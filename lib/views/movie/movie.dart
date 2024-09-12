import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/colors.dart';
import 'package:moviezilla/utlis/text_style.dart';
import 'package:moviezilla/views/movie/components/movie_carosul.dart';
import 'package:moviezilla/views/movie/components/movie_category.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService=ApiService();
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'MovieZilla',fontSize: Get.height*0.030,),
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(height: Get.height*.012,),
            FutureBuilder(builder: (context, snapshot) {
              List<MovieModel> movieData=snapshot.data??[];
              if(snapshot.hasData){
                return MovieCarosul(movielist: movieData,);
              }
              return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
            },
              future:apiService.getMovieData(MovieType.nowPlaying) ,),
            SizedBox(height: Get.height*.02,),
            Column(
        
              children: [

                const HeadingTwo(data: 'Popular Movie'),
                SizedBox(height: Get.height*.012,),
                SizedBox(
                    height:Get.height*.23,child: MovieCategory(movieType: MovieType.popular)),

                const HeadingTwo(data: 'Top Rated Movie'),
                SizedBox(height: Get.height*.012,),
                SizedBox(
                    height:Get.height*.23,child: MovieCategory(movieType: MovieType.topRated)),

                const HeadingTwo(data: 'UpComing Movie'),
                SizedBox(height: Get.height*.012,),
                SizedBox(
                    height:Get.height*.23,child: MovieCategory(movieType: MovieType.upcoming)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
