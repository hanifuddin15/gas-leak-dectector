import 'package:flutter/material.dart';
import 'package:gas_leak_detector/screens/bottom_navbar_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      bottomNavigationBar: BottomNavigationBarView(),
    ),);
  }
}