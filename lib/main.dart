import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_developer_assessment/common/io/shared_preferance.dart';

import 'root_widget.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SharedPreferencesService().initilize();
    runApp(MobileAssessmentApp(isDebug: false));
  }, (exception, stackTrace) async {});
}
