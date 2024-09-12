import 'package:flutter/material.dart';
import 'package:moviezilla/model/movie_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/colors.dart';
import 'package:moviezilla/views/movie/components/movie_list_item.dart';

class MovieCategory extends StatelessWidget {
  final MovieType movieType;
   MovieCategory({super.key, required this.movieType});

  ApiService apiService=ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: apiService.getMovieData(movieType), builder: (context, snapshot) {
      if(snapshot.hasData){
        List<MovieModel> movieList=snapshot.data ?? [];
        return ListView.builder(
          itemCount: movieList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
return MovieListItem(movieModel: movieList[index]);
        },);
      }
      return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
    },);
  }
}
