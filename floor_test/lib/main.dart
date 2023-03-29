import 'package:floor_test/DataBase/app_data_base.dart';
import 'package:floor_test/Modules/Login_Screen.dart';
import 'package:floor_test/Modules/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Modules/HomeScreen.dart';

Future<void> main() async {
  runApp( GetMaterialApp(
    initialRoute: "/signup",
    getPages: [
      GetPage(name: "/home", page: ()=>Home()),
      GetPage(name: "/signup", page: ()=>SignUpScreen()),
      GetPage(name: "/signin", page: ()=>LoginScreen())
    ],
    home:  Home()),
  );

}

