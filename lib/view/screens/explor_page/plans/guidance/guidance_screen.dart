// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/calcultor_screen.dart';
import 'package:interview_task/view/screens/explor_page/plans/asset_per.dart';
import '../../../../componants/app_widgets.dart';
import '../../../../componants/explore_widgets/explore_widget.dart';
import '../../../../componants/home_widgets/home_widgets.dart';
import '../../../../componants/home_widgets/plan_details_widgets.dart';
import '../buying_plan.dart';
import 'package:pie_chart/pie_chart.dart' as p ;

class GuidancePlanScreen extends StatefulWidget{
  @override
  State<GuidancePlanScreen> createState() => _GuidancePlanScreenState();
}

class _GuidancePlanScreenState extends State<GuidancePlanScreen> {
  TextEditingController stocksController=TextEditingController();
  TextEditingController goldController=TextEditingController();
  TextEditingController moneyMarketController=TextEditingController();
  TextEditingController fixedIncomeController=TextEditingController();
  TextEditingController amountController = TextEditingController();
  var _amount = 10.00.round();
  String _lookingValue = "";
  String _describesValue = "";
  String _incomeValue = "";
  final _lookingFor = ["short term ( less than 3 years )", "Medium term ( from 3 to 8 years )", "Long term ( 8+ years )"];
  final _bestDescribes = ["Medium term ( from 3 to 8 years )", "Long term ( 8+ years )", "I’m a free lancer ","I’m a student","Other"];
  final _incomeRange = ["Less than 8000", "Between 15000 : 25000", "More than 25000","More than 25000"];

  @override
  void initState() {
    // TODO: implement initState
    stocksController.text='0';
    fixedIncomeController.text='0';
    goldController.text='25%';
    moneyMarketController.text='0';
    amountController.text = _amount.toString();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backGroundColor,
      appBar: PreferredSize(  preferredSize:Size.fromHeight(60), child: CustomAppBar(text: 'Guidance',),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Need Guidance ?',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                  Padding(
                    padding:  EdgeInsets.only(left: 8,bottom: 8.0,top: 8),
                    child: Text('We are here to help you! By answering our questions, we will choose the best plan that suits you.',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0,top: 8),
                    child: Text('Plan Details',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 800.spMin,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 1), // Shadow position (x, y)
                      ),
                    ],
                    color: AppColors.cardsColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.fromBorderSide(BorderSide.none)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13.0,right: 13,left: 13),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_amount > 10) {
                                  _amount = _amount - 10;
                                  amountController.text = _amount.toString();
                                }
                              });
                            },
                            child: Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.errorsColor.withOpacity(.5)),
                              child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColors.errorsColor,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColors.greyTextColor
                                            .withOpacity(.3)),
                                    color: Colors.white),
                                child: TextFormField(
                                  enabled: false,
                                  controller: amountController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) {
                                    setState(() {
                                      amountController.text = value;
                                      // amount.toString()=amountController.text;
                                      print(_amount);
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_amount < 100) {
                                  _amount = _amount + 10;
                                  amountController.text = _amount.toString();
                                }
                              });
                            },
                            child: Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.successColor.withOpacity(.3)),
                              child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.successColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('are you looking for : ',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    RadioGroup<String>.builder(
                      groupValue: _lookingValue,
                      onChanged: (value) => setState(() {
                        _lookingValue = value ?? '';
                      }),
                      items: _lookingFor,
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
                      ),
                      fillColor: AppColors.successColor,
                      textStyle: TextStyle(color: AppColors.greyTextColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('what best describes you ?',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    ),
                    RadioGroup<String>.builder(
                      groupValue: _describesValue,
                      onChanged: (value) => setState(() {
                        _describesValue = value ?? '';
                      }),
                      items: _bestDescribes,
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
                      ),
                      fillColor: AppColors.successColor,
                      textStyle: TextStyle(color: AppColors.greyTextColor),                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('monthly income range ?',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    ),
                    RadioGroup<String>.builder(
                      groupValue: _incomeValue,
                      onChanged: (value) => setState(() {
                        _incomeValue = value ?? '';
                      }),
                      items: _incomeRange,
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
                      ),
                      fillColor: AppColors.successColor,
                      textStyle: TextStyle(color: AppColors.greyTextColor),                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0,right: 16,left: 16),
              child: Row(
                children: [
                  Expanded(child: ButtonItem(text:'Find Your Plan',buttonHeight: 60,tap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BuyingPlanScreen(),));
                  },)),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}