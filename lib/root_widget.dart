// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'modules/home/presentation/home_screen.dart';

class MobileAssessmentApp extends StatefulWidget {
  bool? isDebug;
  MobileAssessmentApp({super.key, this.isDebug});

  @override
  State<MobileAssessmentApp> createState() => _MobileAssessmentAppState();
}

class _MobileAssessmentAppState extends State<MobileAssessmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: widget.isDebug!,
      home: HomeScreen(),
    );
  }
}
