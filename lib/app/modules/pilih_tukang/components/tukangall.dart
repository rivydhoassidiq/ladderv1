import 'package:flutter/material.dart';

import 'package:ladder/app/data/models/tukang.dart';

import 'package:ladder/app/utils/theme.dart';

class TukangAll extends StatelessWidget {
  final TukangModel tukang;
  const TukangAll({
    Key? key,
    required this.tukang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(3, 2),
                  blurRadius: 7)
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  // '${(listAllDocs[index].data() as Map<String, dynamic>)["photoUrl"]}',
                  tukang.photoUrl.toString(),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // '${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}',
                    tukang.name.toString(),
                    style: semiBoldText14.copyWith(color: blackColor),
                  ),
                  Icon(Icons.star_rate_rounded, color: Color(0xFFFFC107))
                ],
              ),
            ],
          )),
    );
  }
}
