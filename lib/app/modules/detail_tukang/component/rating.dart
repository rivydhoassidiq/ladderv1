import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ladder/app/data/models/ratings.dart';
import 'package:ladder/app/data/models/users_model.dart';
import 'package:ladder/app/utils/theme.dart';

class Rating extends StatelessWidget {
  final Ratings rating;
  const Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: sliderColor,
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(1, 2),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: Get.width * 0.10,
                    height: Get.width * 0.10,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: NetworkImage(rating.photoUrl!),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rating.name!,
                        style: semiBoldText14,
                      ),
                      SizedBox(height: 4),
                      RatingBarIndicator(
                        unratedColor: sliderColor,
                        itemSize: 12,
                        itemPadding: EdgeInsets.only(right: 4),
                        rating: rating.ratingg!,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xFFFFC107),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(rating.komen!,
                  style: regularText12.copyWith(color: blackColor)),
            ],
          ),
        ),
        SizedBox(height: 16)
      ],
    );
  }
}
