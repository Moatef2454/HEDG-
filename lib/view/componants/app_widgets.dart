import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/view/screens/navigation_screen.dart';

import '../../config/colors.dart';

class CustomAppBar extends StatefulWidget {
  final String text;
  final void Function()? onBack;
  const CustomAppBar({super.key, required this.text, this.onBack,});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:Padding(
        padding:  EdgeInsets.only(left: 14.0,bottom: 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.onBack??() {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,size: 28,color: Colors.black,),),
              Padding(
                padding:  EdgeInsets.only(left: 8.0,top: 0),
                child: Text(widget.text,style: TextStyle(color: AppColors.blacks,fontWeight: FontWeight.bold,fontSize: 16),maxLines: 1,overflow: TextOverflow.ellipsis,),),


            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(),), (route) => false,);
            },
              child: Icon(Icons.home,color: AppColors.buttonsColor,)),
        )
      ],
      leadingWidth: MediaQuery.of(context).size.width,
      backgroundColor: Colors.white,
    );
  }
}