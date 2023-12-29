import 'package:flutter/material.dart';
import 'package:gas_leak_detector/screens/bottom_navbar_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         bottomNavigationBar: BottomNavigationBarView(),
       ),
    );
  }
}