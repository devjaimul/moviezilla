import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/utlis/text_style.dart';
import 'package:moviezilla/views/movie/components/movie_details.dart';

import '../../../constant/constant.dart';
import '../../../utlis/colors.dart';

class MovieListItem extends StatelessWidget {
  final MovieModel movieModel;
  const MovieListItem({super.key, required this.movieModel, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(MovieDetails(movieModel: movieModel));
      },
      child: Container(
        width: Get.width *.25 ,
        margin: EdgeInsets.all(Get.height*0.005),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Get.height*.012),
              child: CachedNetworkImage(
                height: Get.height *.15,
                fit: BoxFit.cover,
                imageUrl:KmovieDbImageUrl+movieModel.posterPath.toString(),
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                errorWidget: (context, url, error) =>  Ink.image(image: const NetworkImage('https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_1280.png')),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            HeadingThree(data: movieModel.title.toString()),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               RatingBarIndicator(
                 itemCount: 5,
                 itemSize: Get.height *0.013,
                 direction: Axis.horizontal,
                 rating: movieModel.voteAverage ??0,
                 itemBuilder: (context, index) {
                   return const Icon(Icons.star,color: Colors.amber,);
               },),
               HeadingThree(data: movieModel.voteAverage==null?"":movieModel.voteAverage.toString())

             ],
           ),

          ],
        ),
      ),
    );
  }
}
