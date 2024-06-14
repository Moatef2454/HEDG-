// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';

class CardItemBuilder extends StatelessWidget{
  final String topTextOfLeft;
  final String bottomTextOfLeft;
  final String topTextOfRight;
  final String bottomTextOfRight;
  Color? color;

   CardItemBuilder({super.key, required this.topTextOfLeft, required this.bottomTextOfLeft, required this.topTextOfRight, required this.bottomTextOfRight,this.color});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.spMin,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor('D9DAE1'))
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(topTextOfLeft,style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.0),
                    child: Text(bottomTextOfLeft,style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(topTextOfRight,style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                Padding(
                  padding:  EdgeInsets.only(top: 8.0),
                  child: Text(bottomTextOfRight,style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ,color:  color??AppColors.blacks),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class WalletItemBuilder extends StatefulWidget{
  final int i;

  const WalletItemBuilder({super.key, required this.i});

  @override
  State<WalletItemBuilder> createState() => _WalletItemBuilderState();
}

class _WalletItemBuilderState extends State<WalletItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      if(widget.i==1||widget.i==3)
    CardItemBuilder(
    topTextOfLeft: 'Buy Moderated Plan',
    bottomTextOfLeft: '09 Oct 2024 03:25 pm',
    topTextOfRight: '2,800 EGP',
    bottomTextOfRight: 'Pending',
    ),
      if(widget.i==1||widget.i==2)
    CardItemBuilder(
    topTextOfLeft: 'Buy Conservative Plan',
    bottomTextOfLeft: '09 Sep 2024 01:05 pm',
    topTextOfRight: '3,500 EGP',
    bottomTextOfRight: 'Fulfilled',
    color: AppColors.successColor,
    ),
      if(widget.i==1||widget.i==2)
    CardItemBuilder(
    topTextOfLeft: 'Buy Conservative Plan',
    bottomTextOfLeft: '09 Aug 2024 01:05 pm',
    topTextOfRight: '3,500 EGP',
    bottomTextOfRight: 'Fulfilled',
    color: AppColors.successColor,
    ),
      if(widget.i==1||widget.i==4)
    CardItemBuilder(
    topTextOfLeft: 'Buy Aggressive Plan',
    bottomTextOfLeft: '09 Sep 2024 01:05 pm',
    topTextOfRight: '1,500 EGP',
    bottomTextOfRight: 'Cancelled',
    color: AppColors.errorsColor,
    ),
      if(widget.i==1||widget.i==2)
    CardItemBuilder(
    topTextOfLeft: 'Sell Moderated Plan',
    bottomTextOfLeft: '09 Sep 2024 01:05 pm',
    topTextOfRight: '1,800 EGP',
    bottomTextOfRight: 'Fulfilled',
    color: AppColors.successColor,
    ),
    ],
    );

  }
}