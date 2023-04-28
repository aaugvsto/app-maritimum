import 'package:flutter/material.dart';
import 'package:app/app/services/hive_config.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const App());
}
