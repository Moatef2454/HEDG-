// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/conservative-plan.dart';

import '../../../componants/app_widgets.dart';
import '../../../componants/explore_widgets/explore_widget.dart';
import '../../../componants/home_widgets/plan_details_widgets.dart';

class BuyingPlanScreen extends StatefulWidget {
  @override
  State<BuyingPlanScreen> createState() => _BuyingPlanScreenState();
}

class _BuyingPlanScreenState extends State<BuyingPlanScreen> {
  var _amount = 100.00.round();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    amountController.text = _amount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          text: 'Buying Plan',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                    padding: EdgeInsets.all(16),
                    height: 170.spMin,
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
                        border: Border.fromBorderSide(BorderSide.none)),
                    child: Column(
                      children: [
                        Container(
                          height: 47,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_amount > 100) {
                                      _amount = _amount - 100;
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
                                    if (_amount < 50000) {
                                      _amount = _amount + 100;
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Container(
                            height: 47,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Text('Min Amount')),
                                Spacer(),
                                Expanded(child: Text('Max Amount')),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Container(
                            height: 36,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.greyTextColor
                                                    .withOpacity(.4))),
                                        padding: EdgeInsets.all(8),
                                        child: Center(child: Text('100 EGP')))),
                                Spacer(),
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.greyTextColor
                                                    .withOpacity(.4))),
                                        padding: EdgeInsets.all(4),
                                        child: Center(child: Text('50000 EGP')))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                    padding: EdgeInsets.all(16),
                    height: 535.spMin,
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
                        border: Border.fromBorderSide(BorderSide.none)),
                    child: Column(
                      children: [
                        ImageTitleItemBuilder(
                          image: 'assets/images/image2.png',
                          label: 'Conservative Plan',
                          isBuying: true,
                          h: 100.spMin,
                        ),
                        BottomSideOfBuyingPlanItem(
                          leftText: 'Market',
                          rightText: 'EGY',
                        ),
                        BottomSideOfBuyingPlanItem(
                          leftText: 'Asset manager',
                          rightText: 'Azimut',
                        ),
                        BottomSideOfBuyingPlanItem(
                          leftText: 'Investment Amount',
                          rightText: _amount.toString(),
                        ),
                        BottomSideOfBuyingPlanItem(
                          leftText: 'Transaction fees',
                          rightText: '10 EGP',
                        ),
                        BottomSideOfBuyingPlanItem(
                          leftText: 'Estimated Total',
                          rightText: (_amount+10).toString(),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, right: 16, left: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: ButtonItem(
                      text: 'Next',
                      buttonHeight: 60,
                      tap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ConservativePlanScreen(),));
                      },
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
