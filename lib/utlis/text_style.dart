
import 'package:flutter/material.dart';
import 'colors.dart';

class HeadingTwo extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? backGroundColor;
  final bool? isTrue ;
  const HeadingTwo({
    super.key, required this.data, this.fontWeight, this.fontSize, this.color, this.backGroundColor, this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;

    return Text(
      data,
      maxLines: 1,
      style: TextStyle(
        color: color ?? AppColors.secondaryColor,
        fontSize: fontSize ??  sizeHeight*.021,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,
        decoration:isTrue==true? TextDecoration.underline:TextDecoration.none,
        overflow: TextOverflow.ellipsis,
      ),

    );
  }
}

class HeadingThree extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? backGroundColor;
  const HeadingThree({
    super.key, required this.data, this.fontWeight, this.fontSize, this.color, this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    return Text(
      data,
      style: TextStyle(
        color: color ?? AppColors.secondaryColor,
        fontSize: fontSize ??  sizeHeight*0.017,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,

      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}


class HeadingFour extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? backGroundColor;
  const HeadingFour({
    super.key, required this.data, this.fontWeight, this.fontSize, this.color, this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    return Text(
      data,
      style: TextStyle(
        color: color ?? AppColors.secondaryColor.withOpacity(0.7),
        fontSize: fontSize ??  sizeHeight*0.016,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,

      ),

    );
  }
}
