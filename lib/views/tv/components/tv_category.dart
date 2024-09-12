import 'package:flutter/material.dart';
import 'package:moviezilla/model/tv_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/colors.dart';
import 'package:moviezilla/views/tv/components/tv_list_item.dart';

class TvCategory extends StatelessWidget {
  final TvType tvType;
  TvCategory({super.key, required this.tvType});

  ApiService apiService=ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: apiService.getTvData(tvType), builder: (context, snapshot) {
      if(snapshot.hasData){
        List<TvModel> tvList=snapshot.data ?? [];
        return ListView.builder(
          itemCount: tvList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TvListItem(tvModel: tvList[index]);
          },);
      }
      return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
    },);
  }
}
