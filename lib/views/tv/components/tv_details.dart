import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moviezilla/global%20widgets/cast_page.dart';
import 'package:moviezilla/model/tv_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/text_style.dart';
import 'package:moviezilla/views/tv/components/tv_category.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


import '../../../constant/constant.dart';
import '../../../model/video_model.dart';
import '../../../utlis/colors.dart';


class TvDetails extends StatefulWidget {
  final TvModel tvModel;
  const TvDetails({super.key, required this.tvModel, });

  @override
  State<TvDetails> createState() => _TvDetailsState();
}

class _TvDetailsState extends State<TvDetails> {
  bool _isVideoPlaying = false;
  YoutubePlayerController? _controller;
  @override
  Widget build(BuildContext context) {
    ApiService apiService=ApiService();

    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(
          data: widget.tvModel.originalName.toString(),
          fontSize: Get.height * .023,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(Get.height*0.013),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: _isVideoPlaying ? 0 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Get.height * .012),
                      child: CachedNetworkImage(
                        height: Get.height * .25,
                        fit: BoxFit.cover,
                        imageUrl: KmovieDbImageUrl + widget.tvModel.backdropPath.toString(),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: apiService.getVideos(widget.tvModel.id!, ProgramType.tv),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<VideoModel> videos = snapshot.data ?? [];
                        if (videos.isNotEmpty) {
                          return CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVideoPlaying = true;
                                  _controller = YoutubePlayerController(
                                    initialVideoId: videos.first.key.toString(),
                                    params: const YoutubePlayerParams(
                                      autoPlay: true,
                                      showVideoAnnotations: false,
                                    ),
                                  );
                                });
                              },
                              icon: const Icon(Icons.play_circle,),
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                            ),
                          );
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                  _isVideoPlaying
                      ? YoutubePlayerIFrame(controller: _controller!)
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingTwo(data: widget.tvModel.originalName.toString()),
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
                        rating: widget.tvModel.voteAverage ?? 0,
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                      ),
                      SizedBox(width: Get.width*.03,),
                      HeadingThree(
                          data: widget.tvModel.voteAverage == null
                              ? ""
                              : widget.tvModel.voteAverage.toString()),
                      const Spacer(),
                      HeadingThree(
                          data: widget.tvModel.firstAirDate == null
                              ? ""
                              :"Realsed : ${widget.tvModel.firstAirDate}"),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  HeadingFour(
                      data: widget.tvModel.overview == null
                          ? ""
                          : widget.tvModel.overview.toString()),
                  SizedBox(height: Get.height*.012,),
                  const HeadingTwo(data: 'Cast'),
                  SizedBox(height: Get.height*.012,),
                  SizedBox(height:Get.height*0.15 ,child: CastPage(programType: ProgramType.tv, id: widget.tvModel.id!)),
                  SizedBox(height: Get.height*.012,),
                  const HeadingTwo(data: 'Similar Program'),
                  SizedBox(height: Get.height*.012,),
                  SizedBox(
                      height:Get.height*.23,child: TvCategory(tvType: TvType.similar,tvID: widget.tvModel.id,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
