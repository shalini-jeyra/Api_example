import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'global.dart';

class HiveInstance {
  static Box<String>? _accessBox;
  static Box<String>? get accessBox => _accessBox;
  static initializeHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String hiveRepoPath = p.join(appDocDir.path, Global.hiveRepoStoragePath);
    await Hive.initFlutter(hiveRepoPath);
    
    _accessBox = await Hive.openBox('accessBox');
  }

  static clearHive() {
   
  }
}
