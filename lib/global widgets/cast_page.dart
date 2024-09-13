import 'package:flutter/material.dart';
import 'package:moviezilla/global%20widgets/cast_list_item.dart';
import 'package:moviezilla/model/cast_model.dart';
import 'package:moviezilla/service/api_service.dart';
import 'package:moviezilla/utlis/colors.dart';

class CastPage extends StatelessWidget {
  final ProgramType programType;
  final int id;
  const CastPage({super.key, required this.programType, required this.id});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return FutureBuilder(
      future: apiService.getCast(id, programType), // Use the programType parameter
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CastModel> castList = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: castList.length,
            itemBuilder: (context, index) {
              return CastListItem(castModel: castList[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)); // Add an else clause
        }
      },
    );
  }
}