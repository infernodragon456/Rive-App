import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveHelper {
  static RiveFile? mainFile;

  static Future<void> loadMainFile() async {
    String path = './assets/animations/rive_assets.riv';
    await RiveFile.initialize();
    //await Future.delayed(const Duration(seconds: 2));
    mainFile = RiveFile.import(await rootBundle.load(path));
  }
}
