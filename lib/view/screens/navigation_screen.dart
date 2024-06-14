import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_string_interpolations, sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/modules/app_cubit/app_states.dart';
import 'package:interview_task/view/screens/profile_page/profile_screen.dart';
import 'package:interview_task/view/screens/wallet_page/wallet_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../config/colors.dart';
import '../../modules/app_cubit/app_cubit.dart';
import 'explor_page/explor_screen.dart';
import 'home_page/home_sceen.dart';



class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> shopScreens = [
    HomeScreen(),
    WalletScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];
  // void showTutorial() {
  //   if(appBarCase==false&&currantScreen==2)
  //     tutorialCoachMarkHome.show(context: context);
  // }
  @override
  void initState() {
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) =>  Scaffold(
          // drawer: BuildDrawer(isHome: true),
          body:  Stack(
            children: [
              shopScreens[currantScreen],
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: HexColor('D9DAE1'))
              ),
              child: StylishBottomBar(
                  hasNotch: true,
                  backgroundColor:Colors.white,
                  elevation: 0,
                  onTap: (value) {
                    setState(() {
                      AppCubit.get(context).changeBottomNave(value,context);
                    });
                  },
                  currentIndex: currantScreen,
                  items: [
                    BottomBarItem(
                        selectedColor: AppColors.buttonsColor,
                        icon: Icon(Icons.home,color: currantScreen==0?AppColors.buttonsColor:Colors.grey,),
                        title: Text('Home',
                            style: TextStyle(fontSize: 10))),
                    BottomBarItem(
                        selectedColor: AppColors.buttonsColor,
                        icon: Icon(Icons.account_balance_wallet_rounded,color: currantScreen==1?AppColors.buttonsColor:Colors.grey,),
                        title: Text('Wallet',
                            style: TextStyle(fontSize: 10))),
                    BottomBarItem(
                        selectedColor: AppColors.buttonsColor,
                        icon: Icon(Icons.explore_rounded,color: currantScreen==2?AppColors.buttonsColor:Colors.grey,),
                        title: Text('Explore',
                            style: TextStyle(fontSize: 10))),
                    BottomBarItem(
                        selectedColor: AppColors.buttonsColor,
                        icon: Icon(Icons.person,color: currantScreen==3?AppColors.buttonsColor:Colors.grey,),
                        title: Text('Profile',
                            style: TextStyle(fontSize: 10))),
                  ],
                  option: BubbleBarOptions(
                      unselectedIconColor: Colors.grey,
                      bubbleFillStyle: BubbleFillStyle.fill,
                      barStyle: BubbleBarStyle.vertical,

                      padding: EdgeInsets.only(bottom: 0, top: 0)
                  )
              ),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
    //  }
  }
}
