import 'package:flutter/material.dart';
import 'package:gas_leak_detector/core/values/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardHome extends StatelessWidget {
  final String iconPath;
  final String title;
  // final  String status;
  final VoidCallback? onPressed;

  const CustomCardHome({
    required this.iconPath,
    required this.title,
    // required this.status,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;

    double cardHeight = 131.h; //screenHeight * 0.1; // Adjust the factor as needed
    double cardWidth = 160.w; //screenWidth * 0.5; // Adjust the factor as needed

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: AppColors.cardbuttonColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  iconPath,
                  width: 30.w, //cardWidth * 0.2,
                  height: 30.h,
                  color: Colors.white, //cardHeight * 0.2,
                ),
              ),
              Text(
                title,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(10),
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // Text(
              //   status,
              //   style: GoogleFonts.roboto(
              //     textStyle: TextStyle(
              //       fontSize: ScreenUtil().setSp(15),
              //       color: Colors.white,
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
