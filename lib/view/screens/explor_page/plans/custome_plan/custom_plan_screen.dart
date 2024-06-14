// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class CustomPlanScreen extends StatefulWidget{
  @override
  State<CustomPlanScreen> createState() => _CustomPlanScreenState();
}

class _CustomPlanScreenState extends State<CustomPlanScreen> {
   TextEditingController stocksController=TextEditingController();
   TextEditingController goldController=TextEditingController();
   TextEditingController moneyMarketController=TextEditingController();
   TextEditingController fixedIncomeController=TextEditingController();
   TextEditingController amountController = TextEditingController();
   var _amount = 10.00.round();

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
      appBar: PreferredSize(  preferredSize:Size.fromHeight(60), child: CustomAppBar(text: 'Custom Plan',),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Your Own Plan',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                  Padding(
                    padding:  EdgeInsets.only(left: 8,bottom: 8.0,top: 8),
                    child: Text('By creating your own plan, you are able to adjust the percentage of the assets you want to invest in.You are going to be responsible of all your gains wether it is profit or loss.',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
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
                height: 400.spMin,
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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LeftColumnOfCustomPlan(controller: stocksController, label: 'Stocks',),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: LeftColumnOfCustomPlan(controller: goldController, label: 'Gold',),
                          ),
                          LeftColumnOfCustomPlan(controller: fixedIncomeController, label: 'Fixed Income',),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: LeftColumnOfCustomPlan(controller: moneyMarketController, label: 'Money market',),
                          ),
                        ],
                      ),
                    ),
                      SizedBox(width: 24,),
                      Expanded(
                      child: CustomPieChart(
                        ringStrokeWidth: 10,
                        chartRadius: 120.spMin,
                        chartLegendSpacing: -1,
                        legendOptions: p.LegendOptions(legendPosition: p.LegendPosition.left,),
                        dataMap: dataMap!,
                        chartType: ChartType.ring,
                        baseChartColor: HexColor('F7F8F9'),
                        colorList: <Color>[Colors.orange],
                        chartValuesOptions: p.ChartValuesOptions(showChartValuesInPercentage: false, showChartValuesOutside: false,showChartValues: false,showChartValueBackground: false),
                        totalValue: 100,
                        initialAngleInDegree: 50,
                      ),
                    )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Center(child: Text('Total percentage must be equal to (100)!',style: TextStyle(color: AppColors.errorsColor,fontWeight: FontWeight.bold,fontSize: 12),maxLines: 2,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),maxLines: 2,),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0,right: 13,left: 13),
              child: Container(
                height: 70,
                padding: EdgeInsets.all(10),
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0,right: 16,left: 16),
              child: Row(
                children: [
                  Expanded(child: ButtonItem(text:'Create This Plan',buttonHeight: 60,tap: () {
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