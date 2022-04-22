import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/helper/route_helper.dart';
import 'package:user_stories/pages/home_page.dart';
import 'package:user_stories/pages/login_page.dart';
import 'package:user_stories/utils/app_constants.dart';
import 'package:user_stories/utils/colors.dart';
import 'helper/dependencies.dart' as dependency;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dependency.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLogin=GetStorage().read('isLogin')??false;
    return GetMaterialApp(
      title: 'Online Shop',
      theme: ThemeData(
        primarySwatch: primaryThemeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    darkTheme: ThemeData(
    primarySwatch: primaryThemeColor,
    ),
      debugShowCheckedModeBanner: false,
      home:isLogin?const HomePage(): const LoginPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      defaultTransition: AppConstant.PAGE_TRANSITION,
    );
  }
}

