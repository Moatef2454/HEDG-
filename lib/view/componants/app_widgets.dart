// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/modules/app_cubit/app_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class TopSideOfPage extends StatelessWidget {
  final String seriesName;
  final String couchName;

  const TopSideOfPage(
      {super.key, required this.seriesName, required this.couchName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(seriesName,
            style: TextStyle(fontSize: 18.sp, color: AppColors.blacks)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(couchName,
              style:
                  TextStyle(fontSize: 14.sp, color: AppColors.greyTextColor)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: UnusualButton(),
        )
      ],
    );
  }
}

class ButtonItemBuilder extends StatelessWidget {
  final String text;
  final void Function()? onTab;
  final Color? color;

  ButtonItemBuilder({super.key, required this.onTab, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        
        onPressed: onTab,
        style: ElevatedButton.styleFrom(backgroundColor: color,padding: EdgeInsets.all(12)),
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

class UnusualButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: AppColors.blacks,
      child: GestureDetector(
        child: Center(
            child: Text(
          'START PRACTICING',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class HeaderTexts extends StatelessWidget {
  final String text;
  double? padding;

  HeaderTexts({super.key, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8.0),
      child: Text('$text ',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
    );
  }
}

class DescriptionTexts extends StatelessWidget {
  final String text;
  double? padding;

  DescriptionTexts({super.key, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 8.0),
      child: Text('$text ',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.greyTextColor)),
    );
  }
}

class ReadMoreText extends StatelessWidget {
  final String text;
  double? padding;

  ReadMoreText({super.key, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text('$text ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black, // Optional: Color of the underline
              decorationStyle: TextDecorationStyle.solid)),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown before building the widget
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width as per your requirement
      height: 200, // Set height as per your requirement
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class BottomeSideOfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // Align items to the start
        children: [
          // First row of texts
          Text(
            'Total Run Time',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0), // Space between texts
          Text(
            '03 hrs 08 min (7 videos)',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16.0), // Space between rows

          // Second row of texts
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Difficulty',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 16.0), // Space between texts in the row
              Text(
                'Intensity',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16.0), // Space between rows

          // Third row of texts
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Intermediate',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 16.0), // Space between texts in the row
              Text(
                'Level 4',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class FirstPage extends StatelessWidget {
  final String pageName;
  final ScrollController scrollController;
  final String description;
  final String name;
  final String aboutTrainer;

  const FirstPage({
    Key? key,
    required this.pageName,
    required this.scrollController,
    required this.description,
    required this.name,
    required this.aboutTrainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(8),
            color: Colors.grey.withOpacity(.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTexts(text: 'About The Series'),
                DescriptionTexts(text: description),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('video', style: TextStyle(fontSize: 16)),
                ),
                // Add a video player or other content as needed
                Container(
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: VideoPlayerWidget(
                      videoUrl: "https://media.istockphoto.com/id/1412656736/video/online-workout-service-professional-trainer-explaining-exercise-virtual-video-tutorial-for.mp4?s=mp4-640x640-is&k=20&c=-DfB6Cb50hw4ob5OQOpx6_waPb7Y-h0UNvYTNh9w2Qo=", // Replace with your video URL
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Image widget
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 85,
                          width: 85,
                          child: Image.network(
                            'https://th.bing.com/th/id/R.741baeeb886d5c1346fe020d6b02a3a9?rik=WzWkiNBU7JMT3A&pid=ImgRaw&r=0', // Replace with your image URL
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      // Column of texts
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeaderTexts(text: 'Instructor', padding: 0),
                            DescriptionTexts(text: name, padding: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DescriptionTexts(text: aboutTrainer),
                ReadMoreText(text: 'Read More'),
              ],
            ),
          ),
          BottomeSideOfPage(),
          HeaderTexts(text: 'CLASS'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  final String pageName;
  final ScrollController scrollController;
  final String description;
  final String name;
  final String aboutTrainer;

  const SecondPage({
    Key? key,
    required this.pageName,
    required this.scrollController,
    required this.description,
    required this.name,
    required this.aboutTrainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTexts(text: 'Class'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('video', style: TextStyle(fontSize: 16)),
                ),
                // Add a video player or other content as needed
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.grey,
                      child: Center(
                        child: VideoPlayerWidget(
                          videoUrl: "https://media.istockphoto.com/id/1412656736/video/online-workout-service-professional-trainer-explaining-exercise-virtual-video-tutorial-for.mp4?s=mp4-640x640-is&k=20&c=-DfB6Cb50hw4ob5OQOpx6_waPb7Y-h0UNvYTNh9w2Qo=", // Replace with your video URL
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      child: Center(child: Text('1')),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Day1:$name',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('(5:20)',style: TextStyle(color: AppColors.greyTextColor),),
                      ),
                      Text(description,maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0,bottom: 8,right: 8,left: 8),
                  child: Text('video', style: TextStyle(fontSize: 16)),
                ),
                // Add a video player or other content as needed
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.grey,
                      child: Center(
                        child: VideoPlayerWidget(
                          videoUrl: "https://media.istockphoto.com/id/1412656736/video/online-workout-service-professional-trainer-explaining-exercise-virtual-video-tutorial-for.mp4?s=mp4-640x640-is&k=20&c=-DfB6Cb50hw4ob5OQOpx6_waPb7Y-h0UNvYTNh9w2Qo=", // Replace with your video URL
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      child: Center(child: Text('2')),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Day2:$name',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('(5:20)',style: TextStyle(color: AppColors.greyTextColor),),
                      ),
                      Text(description,maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )

              ],
            ),
          ),
          HeaderTexts(text: 'Community'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
