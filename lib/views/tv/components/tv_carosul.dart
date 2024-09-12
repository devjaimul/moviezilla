import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviezilla/constant/constant.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/model/tv_model.dart';
import 'package:moviezilla/utlis/colors.dart';

class TvCarosul extends StatelessWidget {
  final List <TvModel> tvlist;
  const TvCarosul({super.key, required this.tvlist});

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(itemCount: tvlist.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(sizeHeight*.015),
            child: CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl:KmovieDbImageUrl+tvlist[index].posterPath.toString() ,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        }, options: CarouselOptions(
          height: sizeHeight*.2,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
