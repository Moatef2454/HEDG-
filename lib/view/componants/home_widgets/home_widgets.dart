
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task/config/colors.dart';
import 'package:interview_task/view/screens/explor_page/plans/plan_details_screen.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart' as p ;
///this widgets are used to response the charts package
const List<Color> defaultColorList = [
  Color(0xFFff7675),
  Color(0xFF74b9ff),
  Color(0xFF55efc4),
  Color(0xFFffeaa7),
  Color(0xFFa29bfe),
  Color(0xFFfd79a8),
  Color(0xFFe17055),
  Color(0xFF00b894),
];
enum LegendPosition { top, bottom, left, right }
enum ChartType { disc, ring }
class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    required this.dataMap,
    this.chartType = ChartType.disc,
    this.chartRadius,
    this.animationDuration,
    this.chartLegendSpacing = 48,
    this.colorList = defaultColorList,
    this.initialAngleInDegree,
    this.formatChartValues,
    this.centerText,
    this.centerTextStyle,
    this.ringStrokeWidth = 20.0,
    this.legendOptions = const p.LegendOptions(),
    this.chartValuesOptions = const p.ChartValuesOptions(),
    this.emptyColor = Colors.grey,
    this.gradientList,
    this.emptyColorGradient = const [Colors.black26, Colors.black54],
    this.legendLabels = const {},
    Key? key,
    this.degreeOptions = const p.DegreeOptions(),
    this.baseChartColor = Colors.transparent,
    this.totalValue,
  }) : super(key: key);

  final Map<String, double> dataMap;
  final ChartType chartType;
  final double? chartRadius;
  final Duration? animationDuration;
  final double chartLegendSpacing;
  final List<Color> colorList;
  final List<List<Color>>? gradientList;
  @Deprecated('use degreeOptions. instead')
  final double? initialAngleInDegree;
  final Function? formatChartValues;
  final String? centerText;
  final TextStyle? centerTextStyle;
  final double ringStrokeWidth;
  final p.LegendOptions legendOptions;
  final p.ChartValuesOptions chartValuesOptions;
  final Color emptyColor;
  final List<Color> emptyColorGradient;
  final p.DegreeOptions degreeOptions;
  final Map<String, String> legendLabels;
  final Color baseChartColor;
  final double? totalValue;

  @override
  // ignore: library_private_types_in_public_api
  _PieChartState createState() => _PieChartState();
}
class _PieChartState extends State<CustomPieChart> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  AnimationController? controller;
  double _animFraction = 0.0;
  List<String>? legendTitles;
  late List<double> legendValues;
  void initLegends() {
    final List<String> legendLabelList =
    widget.dataMap.keys.toList(growable: false);
    legendTitles = legendLabelList
        .map((label) => widget.legendLabels[label] ?? label)
        .toList(growable: false);
  }
  void initValues() {legendValues = widget.dataMap.values.toList(growable: false);}
  void initData() {
    assert(
    widget.dataMap.isNotEmpty,
    "dataMap passed to pie chart cant be null or empty",
    );
    initLegends();
    initValues();
  }
  @override
  void initState() {
    super.initState();
    initData();
    controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 800),
      vsync: this,
    );
    final Animation curve = CurvedAnimation(
      parent: controller!,
      curve: Curves.decelerate,
    );
    animation =
    Tween<double>(begin: 0, end: 1).animate(curve as Animation<double>)
      ..addListener(() {
        setState(() {
          _animFraction = animation.value;
        });
      });
    controller!.forward();
  }
  Widget _getChart() {
    return Flexible(
      child: LayoutBuilder(
        builder: (_, c) => SizedBox(
          height: widget.chartRadius != null ? c.maxWidth < widget.chartRadius! ? c.maxWidth : widget.chartRadius : null,
          child: CustomPaint(
            painter: PieChartPainter(
                _animFraction,
                widget.chartValuesOptions.showChartValues,
                widget.chartValuesOptions.showChartValuesOutside,
                widget.colorList,
                chartValueStyle: widget.chartValuesOptions.chartValueStyle,
                chartValueBackgroundColor:
                widget.chartValuesOptions.chartValueBackgroundColor,
                values: legendValues,
                titles: legendTitles,
                showValuesInPercentage:
                widget.chartValuesOptions.showChartValuesInPercentage,
                decimalPlaces: widget.chartValuesOptions.decimalPlaces,
                showChartValueLabel:
                widget.chartValuesOptions.showChartValueBackground,
                chartType: widget.chartType,
                centerText: widget.centerText,
                centerTextStyle: widget.centerTextStyle,
                formatChartValues: widget.formatChartValues,
                strokeWidth: widget.ringStrokeWidth,
                emptyColor: widget.emptyColor,
                gradientList: widget.gradientList,
                emptyColorGradient: widget.emptyColorGradient,
                degreeOptions: widget.degreeOptions.copyWith(
                  // because we've deprecated initialAngleInDegree,
                  // we want the old value to be used if it's not null
                  // ignore: deprecated_member_use_from_same_package
                  initialAngle: widget.initialAngleInDegree,
                ),
                baseChartColor: widget.baseChartColor,
                totalValue:widget.totalValue
            ),
            child: const AspectRatio(aspectRatio: 1),
          ),
        ),
      ),
    );
  }
  Widget _getPieChart() {
    switch (widget.legendOptions.legendPosition) {
      case p.LegendPosition.top:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getLegend(
              padding: EdgeInsets.only(
                bottom: widget.chartLegendSpacing,
              ),
            ),
            _getChart(),
          ],
        );

      case p.LegendPosition.bottom:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getChart(),
            _getLegend(
              padding: EdgeInsets.only(
                top: widget.chartLegendSpacing,
              ),
            ),
          ],
        );
      case p.LegendPosition.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            _getChart(),
          ],
        );
      case p.LegendPosition.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getChart(),
            _getLegend(
              padding: EdgeInsets.only(
                left: widget.chartLegendSpacing,
              ),
            ),
          ],
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getChart(),
            _getLegend(
              padding: EdgeInsets.only(
                left: widget.chartLegendSpacing,
              ),
            ),
          ],
        );
    }
  }
  _getLegend({EdgeInsets? padding}) {
    if (widget.legendOptions.showLegends) {
      final isGradientPresent = widget.gradientList?.isNotEmpty ?? false;
      final isNonGradientElementPresent =
          (widget.dataMap.length - (widget.gradientList?.length ?? 0)) > 0;
      return Padding(
        padding: padding!,
        child: Wrap(
          direction: widget.legendOptions.showLegendsInRow ? Axis.horizontal : Axis.vertical,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: legendTitles!
              .map(
                (item) =>Legend(
              title: item,
              color: isGradientPresent
                  ? getGradient(
                  widget.gradientList!, legendTitles!.indexOf(item),
                  isNonGradientElementPresent:
                  isNonGradientElementPresent,
                  emptyColorGradient: widget.emptyColorGradient)[0]
                  : getColor(
                widget.colorList,
                legendTitles!.indexOf(item),
              ),
              style: widget.legendOptions.legendTextStyle,
              legendShape: widget.legendOptions.legendShape,
            ),
          ).toList(),
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: _getPieChart(),
    );
  }
  @override
  void didUpdateWidget(CustomPieChart oldWidget) {
    initData();
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
const doublePi = math.pi * 2;
class PieChartPainter extends CustomPainter {
  final List<Paint> _paintList = [];
  late List<double> _subParts;
  double _total = 0;
  double _totalAngle = doublePi;
  final TextStyle? chartValueStyle;
  final Color? chartValueBackgroundColor;
  final bool? showValuesInPercentage;
  final bool showChartValues;
  final bool showChartValuesOutside;
  final int? decimalPlaces;
  final bool? showChartValueLabel;
  final ChartType? chartType;
  final String? centerText;
  final TextStyle? centerTextStyle;
  final Function? formatChartValues;
  final double? strokeWidth;
  final Color? emptyColor;
  final List<List<Color>>? gradientList;
  final List<Color>? emptyColorGradient;
  final DegreeOptions degreeOptions;
  final Color baseChartColor;
  final double? totalValue;
  late double _prevAngle;
  double get drawPercentage => degreeOptions.totalDegrees / fullDegree;
  PieChartPainter(
      double angleFactor,
      this.showChartValues,
      this.showChartValuesOutside,
      List<Color> colorList, {
        this.chartValueStyle,
        this.chartValueBackgroundColor,
        required List<double> values,
        List<String>? titles,
        this.showValuesInPercentage,
        this.decimalPlaces,
        this.showChartValueLabel,
        this.chartType,
        this.centerText,
        this.centerTextStyle,
        this.formatChartValues,
        this.strokeWidth,
        this.emptyColor,
        this.gradientList,
        this.emptyColorGradient,
        this.degreeOptions = const DegreeOptions(),
        required this.baseChartColor,
        this.totalValue,
      }) {
    // set total value
    if (totalValue == null) {_total = values.fold(0, (v1, v2) => v1 + v2);}
    else {_total = totalValue!;}
    if (gradientList?.isEmpty ?? true) {
      for (int i = 0; i < values.length; i++) {
        final paint = Paint()..color = getColor(colorList, i);
        setPaintProps(paint);
        _paintList.add(paint);
      }
    }
    _totalAngle = angleFactor * doublePi * drawPercentage;
    _subParts = values;
    _prevAngle = degreeToRadian(degreeOptions.initialAngle);
  }
  double degreeToRadian(double degree) => degree * math.pi / 180;
  void setPaintProps(Paint p) {
    if (chartType == ChartType.ring) {
      p.style = PaintingStyle.stroke;
      p.strokeWidth = strokeWidth!;
    }
  }
  @override
  void paint(Canvas canvas, Size size) {
    final side = math.min(size.width, size.height);
    final left =
    degreeOptions.initialAngle >= -90 && degreeOptions.totalDegrees <= 180 ? -size.width / 2 : 0.0;
    const top = 0.0;
    final Rect boundingSquare = Rect.fromLTWH(left, top, side, size.height);
    final useCenter = chartType == ChartType.disc ? true : false;
    final paintBase = Paint()..color = baseChartColor;
    setPaintProps(paintBase);
    canvas.drawArc(boundingSquare, 0, doublePi, useCenter, paintBase,);
    if (_total == 0) {
      final paint = Paint()..color = emptyColor!;
      setPaintProps(paint);
      canvas.drawArc(boundingSquare, _prevAngle, degreeToRadian(degreeOptions.totalDegrees), useCenter, paint,);
    }
    else {
      final isGradientPresent = gradientList?.isNotEmpty ?? false;
      final isNonGradientElementPresent =
          (_subParts.length - (gradientList?.length ?? 0)) > 0;
      for (int i = 0; i < _subParts.length; i++) {
        if (isGradientPresent) {
          final endAngle = (((_totalAngle) / _total) * _subParts[i]);
          final paint = Paint();
          final normalizedPrevAngle = (_prevAngle - 0.15) % doublePi;
          final normalizedEndAngle = (endAngle + 0.15) % doublePi;
          final Gradient gradient = SweepGradient(
            transform: GradientRotation(normalizedPrevAngle),
            endAngle: normalizedEndAngle,
            colors: getGradient(gradientList!, i,
                isNonGradientElementPresent: isNonGradientElementPresent,
                emptyColorGradient: emptyColorGradient!),
          );
          paint.shader = gradient.createShader(boundingSquare);
          if (chartType == ChartType.ring) {
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = strokeWidth!;
            paint.strokeCap = StrokeCap.butt;
          }
          canvas.drawArc(boundingSquare, _prevAngle, endAngle, useCenter, paint,);
        }
        else {
          canvas.drawArc(boundingSquare, _prevAngle, ((_totalAngle / _total) * _subParts[i]), useCenter, _paintList[i],);
        }
        final radius = showChartValuesOutside ? (side / 2) + 16 : side / 3;
        final radians = _prevAngle + (((_totalAngle / _total) * _subParts[i]) / 2);
        final x = (radius) * math.cos(radians);
        final y = (radius) * math.sin(radians);
        if (_subParts.elementAt(i) > 0) {
          final value = formatChartValues != null ? formatChartValues!(_subParts.elementAt(i)) : _subParts.elementAt(i).toStringAsFixed(decimalPlaces!);
          if (showChartValues) {
            final name = showValuesInPercentage == true ? ('${((_subParts.elementAt(i) / _total) * 100).toStringAsFixed(decimalPlaces!)}%') : value;_drawName(canvas, name, x, y, side);
          }
        }
        _prevAngle = _prevAngle + (((_totalAngle) / _total) * _subParts[i]);
      }
    }
    if (centerText != null && centerText!.trim().isNotEmpty) {_drawCenterText(canvas, side);}
  }
  void _drawCenterText(Canvas canvas, double side) {
    _drawName(canvas, centerText, 0, 0, side, style: centerTextStyle);
  }

  void _drawName(
      Canvas canvas,
      String? name,
      double x,
      double y,
      double side, {
        TextStyle? style,
      }) {
    final span = TextSpan(
      style: style ?? chartValueStyle,
      text: name,
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    if (showChartValueLabel!) {
      //Draw text background box
      final rect = Rect.fromCenter(
        center: Offset((side / 2 + x), (side / 2 + y)),
        width: tp.width + 6,
        height: tp.height + 4,
      );
      final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(4));
      final paint = Paint()
        ..color = chartValueBackgroundColor ?? Colors.grey[200]!
        ..style = PaintingStyle.fill;
      canvas.drawRRect(rRect, paint);
    }
    //Finally paint the text above box
    tp.paint(
      canvas,
      Offset(
        (side / 2 + x) - (tp.width / 2),
        (side / 2 + y) - (tp.height / 2),
      ),
    );
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) =>
      oldDelegate._totalAngle != _totalAngle;
}
class Legend extends StatelessWidget {
  const Legend({
    required this.title,
    required this.color,
    required this.style,
    required this.legendShape,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color color;
  final TextStyle style;
  final BoxShape legendShape;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          height: 20.0,
          width: 18.0,
          decoration: BoxDecoration(
            shape: legendShape,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            title,
            style: style,
            softWrap: true,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
      ],
    );
  }
}
class CardCarouselSliderBuilder extends StatelessWidget{
  CardCarouselSliderBuilder({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:13.0),
      child: Container(
        height: 280.spMin,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardsColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor('D9DAE1'))
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Hi Ahmed!',style: TextStyle(fontSize: 18),),
                Text('Fri, 31 May, 2024',style: TextStyle(fontSize: 10),),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(8.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 15.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 5.0.h),
                                child: Text('Investment Value',style: TextStyle(fontSize: 12),),
                              ),
                              Text('60,500 EGP',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0.h),
                            child: Text('Total Returns',style: TextStyle(fontSize: 12),),
                          ),
                            Text('11,500 EGP',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_drop_up,color: AppColors.successColor,),
                              Text('12.2%',style: TextStyle(color: AppColors.successColor,fontSize: 14,fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  // Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPieChart(
                        ringStrokeWidth: 10,
                        chartRadius: 120.spMin,
                        chartLegendSpacing: -1,
                        legendOptions: p.LegendOptions(legendPosition: p.LegendPosition.left,),
                        dataMap: dataMap!,
                        chartType: ChartType.ring,
                        baseChartColor: HexColor('F7F8F9'),
                        colorList: colorList,
                        chartValuesOptions: p.ChartValuesOptions(showChartValuesInPercentage: false, showChartValuesOutside: false,showChartValues: false,showChartValueBackground: false),
                        totalValue: 100,
                        initialAngleInDegree: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('60,500 EGP',style: TextStyle(color: AppColors.blacks,fontSize: 12,fontWeight: FontWeight.w600),),
                          Row(
                            children: [
                              Icon(Icons.arrow_drop_up,color: AppColors.successColor,),
                              Text('11,500 EGP',style: TextStyle(color: AppColors.successColor,fontSize: 12),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.buttonsColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Portfolio Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: Colors.white),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Map<String, double> dataMap = <String, double>{"updated": 60.0};
final colorList = <Color>[AppColors.successColor,];
class MiniCardsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        children: [
          MiniCardsItemBuilder(amount:'2,800 EGP' ,imagePath: 'assets/images/image2.png',secondAmount:'2,800 EGP' ,title: 'Conservative Plan',),
          MiniCardsItemBuilder(amount:'5,300 EGP' ,imagePath: 'assets/images/image5.png',secondAmount:'265 EGP' ,title: 'Customized Plan',color: AppColors.errorsColor.withOpacity(.1),secondAmountColor: HexColor('#EF5830'),),
          MiniCardsItemBuilder(amount:'2,500 EGP' ,imagePath: 'assets/images/image4.png',secondAmount:'212.5 EGP' ,title: 'Aggressive Plan',),
        ],
      ),
    );
  }
}
class MiniCardsItemBuilder extends StatelessWidget{
  final String imagePath;
  final String title;
  final String amount;
  final String secondAmount;
  Color? secondAmountColor;
  Color? color;
   MiniCardsItemBuilder({super.key,this.color,this.secondAmountColor, required this.imagePath, required this.title, required this.amount, required this.secondAmount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PlanDetailsScreen(),));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 84,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.cardsColor,
              borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, 1), // Shadow position (x, y)
              ),
            ],
          ),
          child:Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: HexColor('#C7EDD8'),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor('D9DAE1'))
                ),

                child: Image.asset(imagePath,fit: BoxFit.cover,),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(title,style: TextStyle(fontSize:14,fontWeight: FontWeight.w700 ),),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(amount,style: TextStyle(fontSize:14,fontWeight: FontWeight.w700 ),),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.0),
                    child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: color??AppColors.successColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(secondAmount,style: TextStyle(fontSize:12,color: secondAmountColor??AppColors.successColor, fontWeight: FontWeight.w700 ),)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
