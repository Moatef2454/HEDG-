// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';

import '../../componants/home_widgets/home_widgets.dart';
import '../../componants/wllet_widgets/wallet.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int i=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cardsColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 3,
        actionsIconTheme: IconThemeData(
          color: AppColors.buttonsColor,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.0, right: 4, top: 8, bottom: 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            i=1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i==1?AppColors.greyTextColor.withOpacity(.2):Colors.white,
                            border: Border.all(color: AppColors.greyTextColor.withOpacity(.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1), // Shadow color
                                spreadRadius: 1, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(3, 1), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Center(child: Text('all')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            i=2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i==2?AppColors.greyTextColor.withOpacity(.2):Colors.white,
                            border: Border.all(color: AppColors.greyTextColor.withOpacity(.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1), // Shadow color
                                spreadRadius: 1, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(3, 1), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Center(child: Text('Completed')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            i=3;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i==3?AppColors.greyTextColor.withOpacity(.2):Colors.white,
                            border: Border.all(color: AppColors.greyTextColor.withOpacity(.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1), // Shadow color
                                spreadRadius: 1, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(3, 1), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Center(child: Text('Pending')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            i=4;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal:  8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i==4?AppColors.greyTextColor.withOpacity(.2):Colors.white,
                            border: Border.all(color: AppColors.greyTextColor.withOpacity(.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1), // Shadow color
                                spreadRadius: 1, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(3, 1), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Center(child: Text('Cancelled')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              WalletItemBuilder(i: i,)
            ],
          ),
        ),
      ),
    );
  }
}
