import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviezilla/constant/constant.dart';
import 'package:moviezilla/model/movie_model.dart';

import '../model/tv_model.dart';
import '../model/video_model.dart';

enum MovieType{ nowPlaying,popular,topRated,upcoming }
enum TvType{airing_today,on_the_air,popular,top_rated}
enum ProgramType{tv,movie}

class ApiService{
Future<List<MovieModel>> getMovieData(MovieType type) async{
  String url='';

  if(type==MovieType.nowPlaying){
    url=KmovieDbUrl+KNowPlaying;
  }
  else if (type==MovieType.popular){
    url=KmovieDbUrl+Kpopular;
  }
  else if (type==MovieType.topRated){
    url=KmovieDbUrl+KTopRated;
  }
  else if (type==MovieType.upcoming){
    url=KmovieDbUrl+KUpComing;
  }

  try{
    Response response=await get(Uri.parse(url+"?api_key=3bb8d1f9a3cee1f06791301a9930bc5f"));

    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json['results'];   //j array ar list dekhabe tar nam ki
      List<MovieModel> movieList=body.map((item) => MovieModel.fromJson(item),).toList();  //map theke item ber korse
      return movieList;  //upore create kora list ta return kore dibo
    }
    else{
      throw('Nothing Found');
    }
  }
  catch(e){
   throw e.toString();
  }
}

Future<List<TvModel>> getTvData(TvType type) async{
  String url='';

  if(type==TvType.popular){
    url=KTvDbUrl+Kpopular;
  }
  else if (type==TvType.on_the_air){
    url=KTvDbUrl+K_on_air;
  }
  else if (type==TvType.airing_today){
    url=KTvDbUrl+K_airing_today;
  }
  else if (type==TvType.top_rated){
    url=KTvDbUrl+KTopRated;
  }

  try{
    Response response=await get(Uri.parse(url+"?api_key=3bb8d1f9a3cee1f06791301a9930bc5f"));

    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json['results'];   //j array ar list dekhabe tar nam ki
      List<TvModel> TvList=body.map((item) => TvModel.fromJson(item),).toList();  //map theke item ber korse
      return TvList;  //upore create kora list ta return kore dibo
    }
    else{
      throw('Nothing Found');
    }
  }
  catch(e){
    throw e.toString();
  }
}

Future<List<VideoModel>> getVideos(int id,ProgramType type) async{
  String url='';

  if(type==ProgramType.movie){
    url=KmovieDbImageUrl+id.toString()+KVideos;
  }
  else if (type==ProgramType.tv){
    url=KTvDbUrl+id.toString()+KVideos;
  }

  try{
    Response response=await get(Uri.parse(url+"?api_key=3bb8d1f9a3cee1f06791301a9930bc5f"));

    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      List<dynamic> body=json['results'];   //j array ar list dekhabe tar nam ki
      List<VideoModel> VideoList=body.map((item) => VideoModel.fromJson(item),).toList();  //map theke item ber korse
      return VideoList;  //upore create kora list ta return kore dibo
    }
    else{
      throw('Nothing Found');
    }
  }
  catch(e){
    throw e.toString();
  }
}
}