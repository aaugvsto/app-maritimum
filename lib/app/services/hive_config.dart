import 'dart:io';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as pp;

class HiveConfig {
  static start() async {
    Directory dir = await pp.getApplicationDocumentsDirectory();

    await Hive.openBox('pedidos', path: dir.path);
    await Hive.openBox('cartoes', path: dir.path);

    Hive.init(dir.path);
  }
}
