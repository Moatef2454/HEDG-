// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';

import '../../componants/explore_widgets/explore_widget.dart';
import '../../componants/home_widgets/home_widgets.dart';

class ExploreScreen extends StatefulWidget{
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
        padding:  EdgeInsets.only(left:13.0,right: 13,top: 13,bottom: 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ImageTitleItemBuilder(image: 'assets/images/image2.png', label: 'Conservative plan',h: 105,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ImageTitleItemBuilder(image: 'assets/images/image 3.png', label: 'Moderated plan',labelB: 'Moderated plan',h: 105,color: HexColor('#FEB532'),),
              ),
              ImageTitleItemBuilder(image: 'assets/images/image4.png', label: 'Aggressive plan',labelB: 'High interest with high risk',h: 105,color: HexColor('#E45353'),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ImageTitleItemBuilder(image: 'assets/images/image5.png', label: 'Do it your self plan',labelB: 'Customize your plan ',h: 105,color: HexColor('#098AD3'),isPlan: false),
              ),
              ImageTitleItemBuilder(image: 'assets/images/image5.png', label: 'Need guidance ?',labelB: 'Choose the plan that suits you',h: 105,color: HexColor('#1B506F'),isPlan: false,isGuid: true,),
            ],
          ),
        ),
      ),
    );
  }
}