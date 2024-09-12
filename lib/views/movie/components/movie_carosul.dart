import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviezilla/constant/constant.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/utlis/colors.dart';

class MovieCarosul extends StatelessWidget {
 final List <MovieModel> movielist;
  const MovieCarosul({super.key, required this.movielist});

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(itemCount: movielist.length,
        itemBuilder: (context, index, realIndex) {
             return ClipRRect(
               borderRadius: BorderRadius.circular(sizeHeight*.015),
               child: CachedNetworkImage(
                 width: double.infinity,
                 fit: BoxFit.fill,
                 imageUrl:KmovieDbImageUrl+movielist[index].posterPath.toString() ,
                 placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                 errorWidget: (context, url, error) => const Icon(Icons.error),
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
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
