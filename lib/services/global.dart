import 'package:api_example/services/hive.dart';
import 'package:hive/hive.dart' show Box;


enum BOX_NAME{
  USER_ACCESS,
}

class Global{
  static const hiveRepoStoragePath = 'api';
static final Map<BOX_NAME, Box?> boxes = {
    BOX_NAME. USER_ACCESS: HiveInstance.accessBox,};
}