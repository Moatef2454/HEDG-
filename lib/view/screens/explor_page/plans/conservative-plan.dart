// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/calcultor_screen.dart';
import 'package:interview_task/view/screens/explor_page/plans/asset_per.dart';

import '../../../componants/app_widgets.dart';
import '../../../componants/home_widgets/plan_details_widgets.dart';
import 'buying_plan.dart';

class ConservativePlanScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backGroundColor,
      appBar: PreferredSize(  preferredSize:Size.fromHeight(60), child: CustomAppBar(text: 'Conservative Plan',),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 120.spMin,
                width: double.infinity,
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                    color: HexColor('#C7EDD8'),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor('D9DAE1'))
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Conservative Plan',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                          Padding(
                            padding:  EdgeInsets.only(top: 8.0),
                            child: Text('Save More With Low Risks',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                        height: 50.spMin,
                        width: 50.spMin,
                        child: Image.asset('assets/images/image2.png',fit: BoxFit.cover,)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 165.spMin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text('Description',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AssetsPerformance(),));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('See Performance',style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: AppColors.successColor ),),
                                Padding(
                                  padding:  EdgeInsets.only(left: 8.0),
                                  child: Icon(Icons.arrow_forward_outlined,color: AppColors.successColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 8.0),
                      child: Text('An aggressive investment plan prioritizes growth over risk, typically by investing in Stocks, Fixed Income, and Gold.',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 13.0,top: 0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 4.0),
                                child: Icon(Icons.video_collection,color: AppColors.errorsColor,),
                              ),
                              Text('Watch video',style: TextStyle(fontSize:12,fontWeight: FontWeight.w600,color: AppColors.errorsColor,),),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen(),));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(right: 4.0),
                                  child: Icon(Icons.calculate_outlined,color: AppColors.successColor),
                                ),
                                Text('Calculator',style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: AppColors.successColor ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8),
                      child: Text('Plan Details',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 16,right: 16),
              child: PlanManagerListItemBuilder(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,top: 8),
              child: Text('Asset Allocation',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 16,right: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 130.spMin,
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
                  children: [
                    TextsRowBuilderWidget(leftText: 'Fixed Income',rightText: '85%',),
                    TextsRowBuilderWidget(leftText: 'Gold',rightText: '15%',isLast: true,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0,right: 16,left: 16),
              child: Row(
                children: [
                  Expanded(child: ButtonItem(text:'Buy',buttonHeight: 60,tap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyingPlanScreen(),));
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