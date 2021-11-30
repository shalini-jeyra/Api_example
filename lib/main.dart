import 'package:api_example/pages/pages.dart';
import 'package:api_example/services/hive.dart';
import 'package:api_example/services/locator.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await HiveInstance.initializeHive();
  setupLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Loginpage(),
    );
  }
}
