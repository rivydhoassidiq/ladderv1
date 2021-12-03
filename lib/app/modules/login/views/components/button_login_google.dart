import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/utils/theme.dart';

class RoundedButtonLGGG extends StatefulWidget {
  RoundedButtonLGGG({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  State<RoundedButtonLGGG> createState() => _RoundedButtonLGGGState();
}

class _RoundedButtonLGGGState extends State<RoundedButtonLGGG> {
  final authC = Get.find<AuthController>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        setState(() {
          isLoading = true;
          authC.login();
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: googleColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Loading",
                    style: boldText16.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.image,
                    width: 32,
                    height: 22,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.title,
                    style: boldText16.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
