import 'package:flutter/material.dart';
import 'package:moviezilla/utlis/text_style.dart';
import 'package:moviezilla/views/tv/components/tv_carosul.dart';

import '../../model/tv_model.dart';
import '../../service/api_service.dart';
import '../../utlis/colors.dart';
import 'components/tv_category.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    ApiService apiService=ApiService();
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'MovieZilla',fontSize: sizeHeight*0.030,),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: sizeHeight*.012,),
            FutureBuilder(builder: (context, snapshot) {
              List<TvModel> tvData=snapshot.data??[];
              if(snapshot.hasData){
               return TvCarosul(tvlist: tvData);
              }
              return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
            },
              future:apiService.getTvData(TvType.on_the_air) ,),
            SizedBox(height: sizeHeight*.02,),
            Column(

              children: [

                const HeadingTwo(data: 'Popular Movie'),
                SizedBox(height: sizeHeight*.012,),
                SizedBox(
                    height:sizeHeight*.23,child: TvCategory(tvType: TvType.popular)),

                const HeadingTwo(data: 'Top Rated Movie'),
                SizedBox(height: sizeHeight*.012,),
                SizedBox(
                    height:sizeHeight*.23,child: TvCategory(tvType: TvType.top_rated)),

                const HeadingTwo(data: 'Airing Today'),
                SizedBox(height: sizeHeight*.012,),
                SizedBox(
                    height:sizeHeight*.23,child: TvCategory(tvType: TvType.airing_today)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
