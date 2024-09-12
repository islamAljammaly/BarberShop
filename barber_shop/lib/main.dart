import 'package:baber_shop/view/custom_view.dart';
import 'package:baber_shop/view/start_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    initialBinding: AppBindings(),
    home: StartPage(),
  ));
}
