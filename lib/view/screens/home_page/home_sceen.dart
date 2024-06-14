// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';

import '../../componants/home_widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cardsColor,
        leading: Padding(
          padding:  EdgeInsets.only(left: 30.0),
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
        leadingWidth: MediaQuery.of(context).size.width/3,
        actionsIconTheme: IconThemeData(color: AppColors.buttonsColor,),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 30.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(left:4.0,right: 4,top: 13,bottom: 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CardCarouselSliderBuilder(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text('My Pensions',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w700,color: AppColors.blacks),),
                    Spacer(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:AppColors.grayBackGroundColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:Center(child: Text('Orders',style: TextStyle(fontSize:10,color: AppColors.greyTextColor,fontWeight: FontWeight.w600),)),
                      
                      ),
                    )
                  ],
                ),
              ),
              MiniCardsList()
            ],
          ),
        ),
      ),
    );
  }
}