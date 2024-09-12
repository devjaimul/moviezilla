import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/text_style.dart';

import '../../../constant/constant.dart';
import '../../../model/video_model.dart';
import '../../../utlis/colors.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieModel;
  const MovieDetails({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    ApiService apiService=ApiService();

    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(
          data: movieModel.title.toString(),
          fontSize: Get.height * .023,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(Get.height*0.013),
        child: Column(
          children: [

            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.height*.012),
                  child: CachedNetworkImage(
                    height: Get.height *.25,
                    fit: BoxFit.cover,
                    imageUrl:KmovieDbImageUrl+movieModel.backdropPath.toString(),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                FutureBuilder(future: apiService.getVideos(movieModel.id!, ProgramType.movie),
                  builder: (context, snapshot) {
                 if(snapshot.hasData){
                   List<VideoModel> videos=snapshot.data ?? [];
                   if(videos.isNotEmpty){
                     return CircleAvatar(
                       child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle,color: Colors.blue,)),
                     );
                   }


                 }
                 return SizedBox();

                },)
              ],
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingTwo(data: movieModel.title.toString()),
                SizedBox(
                  height: Get.height * .001,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                      itemCount: 5,
                      itemSize: Get.height * 0.015,
                      direction: Axis.horizontal,
                      rating: movieModel.voteAverage ?? 0,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                    ),
                    SizedBox(width: Get.width*.03,),
                    HeadingThree(
                        data: movieModel.voteAverage == null
                            ? ""
                            : movieModel.voteAverage.toString()),
                    Spacer(),
                    HeadingThree(
                        data: movieModel.releaseDate == null
                            ? ""
                            :"Realsed : ${movieModel.releaseDate}"),
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                HeadingFour(
                    data: movieModel.overview == null
                        ? ""
                        : movieModel.overview.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
