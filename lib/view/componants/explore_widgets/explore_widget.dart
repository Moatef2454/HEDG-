// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/view/screens/explor_page/plans/custome_plan/custom_plan_screen.dart';
import 'package:interview_task/view/screens/explor_page/plans/guidance/guidance_screen.dart';

import '../../../config/colors.dart';
import '../../screens/explor_page/plans/asset_per.dart';
import '../../screens/explor_page/plans/plan_details_screen.dart';

class ListVewOfChartFilterItemBuilder extends StatefulWidget {
  final String label;
  void Function()? tap;

  ListVewOfChartFilterItemBuilder({super.key, required this.label, this.tap});

  @override
  State<ListVewOfChartFilterItemBuilder> createState() =>
      _ListVewOfChartFilterItemBuilderState();
}

class _ListVewOfChartFilterItemBuilderState
    extends State<ListVewOfChartFilterItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        filterChart == widget.label;
        setState(() {
          print(filterChart);
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: filterChart.contains(widget.label)
                ? AppColors.buttonsColor
                : Colors.white),
        child: Center(
            child: Text(
          widget.label,
          style: TextStyle(
              color: filterChart == widget.label
                  ? Colors.white
                  : AppColors.buttonsColor),
        )),
      ),
    );
  }
}

class ListFilter extends StatefulWidget {
  @override
  State<ListFilter> createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                filterChart == 'All';
              print(filterChart);
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: filterChart == 'All'
                      ? AppColors.errorsColor
                      : Colors.white),
              child: Center(
                  child: Text(
                'All',
                style: TextStyle(
                    color: filterChart == 'All'
                        ? Colors.white
                        : AppColors.buttonsColor),
              )),
            ),
          ),

        ],
      ),
    );
  }
}

class SliderOfCalculatorItemBuilder extends StatefulWidget{
   double currentSliderValue;
   double max;
   final String label;
   SliderOfCalculatorItemBuilder({super.key, required this.currentSliderValue, required this.label,required this.max});

  @override
  State<SliderOfCalculatorItemBuilder> createState() => _SliderOfCalculatorItemBuilderState();
}

class _SliderOfCalculatorItemBuilderState extends State<SliderOfCalculatorItemBuilder> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          const EdgeInsets.only(top: 13.0, right: 13, left: 13),
          child: Text(
            '${widget.label}: ${widget.currentSliderValue.round()} Egp',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.blacks),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor:AppColors.successColor,
              trackHeight: 2.0,

              // Change the height of the track
              thumbColor: Colors.blue,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius:
                8.0, // Change the size of the thumb
              ),
              overlayColor: Colors.purple.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 18.0,
              ),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.green,
              inactiveTickMarkColor: Colors.red,
            ),
            child: Slider(
              activeColor: AppColors.successColor,
              value: widget.currentSliderValue,
              onChanged: (double value) {
                setState(() {
                  widget.currentSliderValue = value..toDouble().round();
                });
              },
              max: widget.max,
              min: 0,
            ),
          ),
        ),
      ],
    );
  }
}
class ImageTitleItemBuilder extends StatefulWidget{
  final String image;
  final String label;
   String? labelB;
  bool isBuying;
  double? h;
  Color? color;
  bool isPlan;
  bool isGuid;
  ImageTitleItemBuilder({super.key, required this.image, required this.label,this.isBuying=false,this.h,this.labelB,this.color,this.isPlan=true,this.isGuid=false});

  @override
  State<ImageTitleItemBuilder> createState() => _ImageTitleItemBuilderState();
}

class _ImageTitleItemBuilderState extends State<ImageTitleItemBuilder> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          if(widget.isPlan) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PlanDetailsScreen(),));
          }
          else{
            if(widget.isGuid)
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuidancePlanScreen(),));
            else
            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomPlanScreen(),));
          }
        },
        child: Container(
          height: widget.h??120.spMin,
          width: double.infinity,
          padding: EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: widget.color??HexColor('#C7EDD8'),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: HexColor('D9DAE1'))
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.label,style: TextStyle(fontSize:14,fontWeight: FontWeight.w900 ),),
                    if(widget.isBuying==false)
                    Padding(
                      padding:  EdgeInsets.only(top: 8.0),
                      child: Text(widget.labelB??'Save More With Low Risks',style: TextStyle(fontSize:12,fontWeight: FontWeight.w400 ),),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                  height: 50.spMin,
                  width: 50.spMin,
                  child: Image.asset(widget.image,fit: BoxFit.cover,)),
            ],
          ),
        ),
      ),
    );
  }
}
class BottomSideOfBuyingPlanItem extends StatefulWidget{
  final String leftText;
  final String rightText;
  bool isLast;
  bool isPositions;
  Color? fontColor;
  bool isBuying;
   BottomSideOfBuyingPlanItem({super.key,this.isBuying=false,this.isLast=false, required this.leftText, required this.rightText,this.isPositions=false,this.fontColor});

  @override
  State<BottomSideOfBuyingPlanItem> createState() => _BottomSideOfBuyingPlanItemState();
}

class _BottomSideOfBuyingPlanItemState extends State<BottomSideOfBuyingPlanItem> {
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Padding(
         padding: widget.isLast? EdgeInsets.only(top: 16.0):EdgeInsets.symmetric(vertical: 16.0),
         child: Container(
           padding: EdgeInsets.all(13),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             border: Border.all(color: AppColors.greyTextColor.withOpacity(.4))
           ),
           child: Row(
             children: [
               Text(
                 widget.leftText,
                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: widget.fontColor??AppColors.blacks),
               ),
               Spacer(),
               Text(
                 widget.rightText,
                 style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w700,
                     color: widget.fontColor??AppColors.blacks
                 ),
               ),
             ],
           ),
         ),
       ),
     ],
   );
  }
}
class LeftColumnOfCustomPlan extends StatelessWidget{
  final TextEditingController controller;
  final String label;
   LeftColumnOfCustomPlan({super.key, required this.controller, required this.label});
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Padding(
         padding: const EdgeInsets.only(bottom: 8.0),
         child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
       ),
       Container(
         height: 42,
         // width: 100.spMin,
         decoration: BoxDecoration(
            
             color: AppColors.cardsColor,
             borderRadius: BorderRadius.circular(10),
             border: Border.all(color: AppColors.greyTextColor.withOpacity(.4))
         ),

         child: TextFormField(
           controller: controller,
           textAlign: TextAlign.center,
           keyboardType: TextInputType.number,
           onFieldSubmitted: (value) {
           },
           decoration: InputDecoration(
               border: OutlineInputBorder(
                   borderSide: BorderSide.none)),
         ),
       ),
     ],
   );
  }
}
List<double> chartNumbers=[
  5,
  10,
  15,
  20,
  25,
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  65,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  115,
  120,
  125,
  130,
  135,
  140,
  145,
  150,
  155,
  160,
  165,
  170,
  175,
  180,
  185,
  190,
  195,
  200,
  210,
];