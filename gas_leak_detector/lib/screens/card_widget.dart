import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String status;

  const CustomCard({
    required this.iconPath,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;

    double cardHeight = screenHeight * 0.05; // Adjust the factor as needed
    double cardWidth = screenWidth * 0.25; // Adjust the factor as needed

    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: cardWidth * 0.4,
                  height: cardHeight * 0.4,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
