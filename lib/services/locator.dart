import 'package:api_example/services/auth.dart';
import 'package:api_example/services/user_details.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(AuthService());
  locator.registerSingleton(UserDetailsService());
  }