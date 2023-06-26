import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_storage/bindings/my_bindings.dart';
import 'package:getx_storage/toggle_theme_screen.dart';

void main() async {
  // * main() should be async and await this
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // * access to storage
    final box = GetStorage();
    return GetMaterialApp(
      // * if we haven't written in it yet then make it false
      theme: box.read('theme') ?? false ? ThemeData.dark() : ThemeData.light(),
      initialBinding: MyBindings(),
      home: const ToggleThemeScreen(),
    );
  }
}
