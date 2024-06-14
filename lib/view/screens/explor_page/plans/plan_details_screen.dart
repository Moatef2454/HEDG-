// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/conservative-plan.dart';

import '../../../componants/app_widgets.dart';
import '../../../componants/home_widgets/plan_details_widgets.dart';

class PlanDetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backGroundColor,
      appBar: PreferredSize(  preferredSize:Size.fromHeight(60), child: CustomAppBar(text: 'Plan Details',),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlanDitailseTopSideItemBuilder(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PlanManagerListItemBuilder(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 115.spMin,
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
                      padding:  EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Pending Orders',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You don’t have any pending orders yet',style: TextStyle(fontSize:14,fontWeight: FontWeight.w600 ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionsItemBuilder(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0,right: 16,left: 16),
              child: Row(
                children: [
                  Expanded(child: ButtonItem(text:'Sell',buttonColor: HexColor('#F2F7FF'),textColor: AppColors.blacks,buttonHeight: 64)),
                  SizedBox(width: 25,),
                  Expanded(child: ButtonItem(text:'Buy',buttonHeight: 60,tap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ConservativePlanScreen(),));
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