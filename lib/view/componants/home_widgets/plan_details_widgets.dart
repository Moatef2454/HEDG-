// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';

import '../../screens/explor_page/plans/asset_per.dart';

class TextsRowBuilderWidget extends StatelessWidget {
  final String leftText;
  final String rightText;
   bool isLast;
   bool isPositions;
   Color? fontColor;
   TextsRowBuilderWidget({super.key,this.isLast=false, required this.leftText, required this.rightText,this.isPositions=false,this.fontColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: isLast? EdgeInsets.only(top: 16.0):EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Text(
                leftText,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: fontColor??AppColors.blacks),
              ),
              Spacer(),
              Text(
               rightText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: fontColor??AppColors.blacks
                ),
              ),
            ],
          ),
        ),
        if(isPositions==false&&isLast==false)
        Container(
          height: 1,
          width:double.infinity,
          color: AppColors.greyTextColor.withOpacity(.5),
        )
      ],
    );
  }
}
class ButtonItem extends StatelessWidget {
  Color? buttonColor;
  Color? textColor;
  void Function()? tap;
  final String text;
  double? buttonHeight;
  ButtonItem({super.key, required this.text,this.buttonColor,this.textColor,this.buttonHeight,this.tap});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: tap??(){},
      child: Container(
        height: buttonHeight??null,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor??AppColors.buttonsColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: textColor??Colors.white),)),
      ),
    );
  }
}
class PlanDitailseTopSideItemBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Container(
        padding: EdgeInsets.all(16),
        height: 210.spMin,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: HexColor('#C7EDD8'),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('D9DAE1'))
                  ),

                  child: Image.asset('assets/images/image2.png',fit: BoxFit.cover,),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Conservative Plan',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 14.0),
              child: GestureDetector(
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
            ),
            Row(
              children: [
                Text('Current Value',style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                Spacer(),
                Text('Returns',style: TextStyle(fontSize:12,fontWeight: FontWeight.w500 ,),),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                children: [
                  Text('2,800 EGP',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.north_east,color: AppColors.successColor),
                      Padding(
                        padding: EdgeInsets.only(right: 8) ,
                        child: Text('29.7%',style: TextStyle(fontSize:14,fontWeight: FontWeight.w700 ,color: AppColors.successColor),),
                      ),
                      Text('2,800 EGP',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ,),),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PlanManagerListItemBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16),
      height: 230.spMin,
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
          TextsRowBuilderWidget(leftText: 'Asset Manager',rightText: 'Azimut',),
          TextsRowBuilderWidget(leftText: 'Risk Profile',rightText: 'Low',),
          TextsRowBuilderWidget(leftText: 'Subscription Freq.',rightText: 'Daily',),
          TextsRowBuilderWidget(leftText: 'Redemption Freq',rightText: 'Weekly',isLast: true,),

        ],
      ),
    );
  }
}
class PositionsItemBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 230.spMin,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.0),
              child: Text('My Positions',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
            ),
            TextsRowBuilderWidget(leftText: 'Purchase Value',rightText: 'Current Value',isPositions: true,isLast: true,fontColor: AppColors.greyTextColor,),
            TextsRowBuilderWidget(leftText: '2158.2',rightText: '2,800',isPositions: true,),
            TextsRowBuilderWidget(leftText: 'Profit',rightText: '',isPositions: true,isLast: true),
            TextsRowBuilderWidget(leftText: '641.80',rightText: '',isPositions: true,isLast: true,fontColor: AppColors.successColor,),

          ],
        ),
      ),
    );
  }
}
