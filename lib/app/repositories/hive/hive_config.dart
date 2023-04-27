import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();

    //bool boxExists = await Hive.boxExists('pedidos', path: dir.path);
    Hive.openBox('pedidos', path: dir.path);

    Hive.init(dir.path);
  }
}
