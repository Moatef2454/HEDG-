// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/asset_per.dart';
import 'package:tiny_charts/tiny_charts.dart';

import '../../../componants/app_widgets.dart';
import '../../../componants/home_widgets/plan_details_widgets.dart';
import '../../../componants/explore_widgets/explore_widget.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double _currentSliderValue = 10000;
  double _currentSliderValueSecond = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          text: 'Conservative Plan',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expected Profit Within 10 Years',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.blacks),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Text(
                      'Total: 380,500 Egp',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: AppColors.blacks),
                    ),
                  ),
                  Text(
                    'Investment: 130,000 Egp',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: AppColors.blacks),
                  ),
                  Text(
                    'Profit: 250,500 Egp',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: AppColors.blacks),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 270.spMin,
                width: double.infinity,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor('D9DAE1'))),
                child: Column(
                  children: [
                    TinyColumnChart(
                      options: TinyColumnChartOptions(
                          positiveColor: AppColors.successColor,
                          negativeColor: AppColors.errorsColor,
                          maxLimit: 200),
                      data: chartNumbers,
                      width: double.infinity,
                      height: 210.spMin,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Year 1',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.successColor),
                          ),
                          Spacer(),
                          Text(
                            '10 years',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.successColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliderOfCalculatorItemBuilder(currentSliderValue: _currentSliderValue, label: 'Initial Investment',max: 60000,),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SliderOfCalculatorItemBuilder(currentSliderValue: _currentSliderValueSecond, label: 'Monthly Investment',max:10000,),
            ),
            Container(
              height: 110.spMin,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/images/logo.svg'),
            )
          ],
        ),
      ),
    );
  }
}
