// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/modules/app_cubit/app_cubit.dart';

import '../../../modules/app_cubit/app_states.dart';
import '../../componants/app_widgets.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedButtonIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_pageController.page != null) {
          final nextPage = (_pageController.page! + 1).toInt();
          if (nextPage < 3) {
            _pageController.animateToPage(
              nextPage,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..initializeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          var seriesData = AppCubit.get(context).trainingSeries;

          return Scaffold(
            body: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.network(
                    AppCubit.get(context)
                        .trainingSeries!
                        .coverPhotoLink
                        .toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                // Scrollable content
                NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    setState(() {});
                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: [
                        // First Part: Image and Text
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: _getOpacity(context),
                            child: Text(
                              'Centered Text',
                              style: TextStyle(color: Colors.red, fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // Second Part: Column with Text and Buttons
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                              // Top Texts
                              TopSideOfPage(
                                couchName: seriesData!.coaches.first.name,
                                seriesName: seriesData!.seriesName,
                              ),
                              SizedBox(height: 16),
                              // Toggle Buttons
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonItemBuilder(
                                      color: _selectedButtonIndex == 0
                                          ? Colors.grey
                                          : Colors.white,
                                      text: 'Over View',
                                      onTab: () => _onButtonPressed(0),
                                    ),
                                    ButtonItemBuilder(
                                      color: _selectedButtonIndex == 1
                                          ? Colors.grey
                                          : Colors.white,
                                      text: 'Class',
                                      onTab: () => _onButtonPressed(1),
                                    ),
                                    ButtonItemBuilder(
                                      color: _selectedButtonIndex == 2
                                          ? Colors.grey
                                          : Colors.white,
                                      text: 'Community',
                                      onTab: () => _onButtonPressed(2),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              // PageView
                              SizedBox(
                                height: 400, // Adjust height as needed
                                child: PageView(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: _pageController,
                                  onPageChanged: (page) {
                                    setState(() {
                                      _currentPage = page;
                                      _selectedButtonIndex = _currentPage;
                                    });
                                  },
                                  children: [
                                    FirstPage(
                                        pageName: 'OverView',
                                        scrollController: _scrollController,
                                        description:
                                            seriesData.overview.description,
                                        name: seriesData.coaches.first.name,
                                        aboutTrainer: seriesData
                                            .coaches.first.overviewInfo),
                                    SecondPage(
                                        pageName: 'Class',
                                        scrollController: _scrollController,
                                        description: seriesData
                                            .classes.first.description,
                                        name: seriesData.classes.first.title,
                                        aboutTrainer: seriesData
                                            .coaches.first.overviewInfo),
                                    ListView.builder(
                                      itemCount: seriesData!.communitySocialFeed.length,
                                      itemBuilder: (context, listIndex) =>
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                // Image widget
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Container(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    height: 42,
                                                    width: 42,
                                                    child: Image.network(
                                                      'https://th.bing.com/th/id/R.741baeeb886d5c1346fe020d6b02a3a9?rik=WzWkiNBU7JMT3A&pid=ImgRaw&r=0',
                                                      // Replace with your image URL
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                ),
                                                // Column of texts
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HeaderTexts(
                                                          text: seriesData!.communitySocialFeed[listIndex].postedBy.toString(),
                                                          padding: 0),
                                                      DescriptionTexts(
                                                          text: seriesData!.communitySocialFeed[listIndex].timeOfPost.toString(),
                                                          padding: 0),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 24.0),
                                            child: DescriptionTexts(text: seriesData!.seriesName),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 24.0),
                                            child: HeaderTexts(text: seriesData!.communitySocialFeed![listIndex].text),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(

                                                    child: Icon(Icons.heart_broken_sharp,color: Colors.grey,),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadiusDirectional.circular(50),
                                                    border: Border.all(color: AppColors.greyTextColor)
                                                  ),
                                                  padding: EdgeInsets.all(4),
                                                ),
                                                SizedBox(width: 8,),
                                                DescriptionTexts(text: 'Be The first to like this ')
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(6),
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey
                                            ),
                                            child: TextFormField(
                                              textAlign: TextAlign.left,
                                              decoration: InputDecoration(
                                                hintText: 'Write a comment...',
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide.none, // Remove border line if needed
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide.none, // Remove border line if needed
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide.none, // Remove border line if needed
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {},
      ),
    );
  }
}

double _getOpacity(BuildContext context) {
  double offset = MediaQuery.of(context).size.height / 2 -
      MediaQuery.of(context).padding.top;
  return offset <= 0
      ? 1
      : offset > 1
          ? 0
          : 1 - offset;
}


