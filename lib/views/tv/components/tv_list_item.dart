import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviezilla/model/tv_model.dart';
import 'package:moviezilla/utlis/text_style.dart';

import '../../../constant/constant.dart';
import '../../../utlis/colors.dart';

class TvListItem extends StatelessWidget {
  final TvModel tvModel;
  const TvListItem({super.key, required this.tvModel, });

  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.sizeOf(context).height;
    final sizeWidth=MediaQuery.sizeOf(context).width;
    return Container(
      width: sizeWidth *.25 ,
      margin: EdgeInsets.all(sizeHeight*0.005),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(sizeHeight*.012),
            child: CachedNetworkImage(
              height: sizeHeight *.15,
              fit: BoxFit.cover,
              imageUrl:KmovieDbImageUrl+tvModel.posterPath.toString(),
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(height: sizeHeight*0.01,),
          HeadingThree(data: tvModel.originalName.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                itemCount: 5,
                itemSize: sizeHeight *0.013,
                direction: Axis.horizontal,
                rating: tvModel.voteAverage ??0,
                itemBuilder: (context, index) {
                  return const Icon(Icons.star,color: Colors.amber,);
                },),
              HeadingThree(data: tvModel.voteAverage==null?"":tvModel.voteAverage.toString())

            ],
          ),

        ],
      ),
    );
  }
}
