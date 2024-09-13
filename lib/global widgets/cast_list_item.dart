import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviezilla/constant/constant.dart';
import 'package:moviezilla/model/cast_model.dart';
import 'package:moviezilla/utlis/text_style.dart';

import '../utlis/colors.dart';

class CastListItem extends StatelessWidget {
  final CastModel castModel;
  const CastListItem({super.key, required this.castModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*.25,
      margin: EdgeInsets.symmetric(horizontal: Get.width*.01),
      child: Column(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(width: Get.width*.2,height: Get.height*.15, decoration: BoxDecoration(
              shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider,fit: BoxFit.fill)),),
            height: Get.height * .10,
            fit: BoxFit.cover,
            imageUrl: KmovieDbImageUrl + castModel.profilePath.toString(),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => Ink.image(image: NetworkImage('https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_1280.png')),
          ),
          HeadingThree(data: castModel.name.toString(),fontSize: Get.height*.015,),
          HeadingFour(data: castModel.knownForDepartment.toString(),),
        ],
      ),
    );
  }
}
