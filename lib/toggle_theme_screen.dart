import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_storage/controllers/theme_controller.dart';

class ToggleThemeScreen extends StatelessWidget {
  const ToggleThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // * Access to storage
    final box = GetStorage();
    return Scaffold(
      body: Center(
        child: Obx(() {
          return CupertinoSwitch(
            value: Get.find<ThemeController>().isDark.value,
            onChanged: (value) {
              Get.find<ThemeController>().toggle();

              if (Get.find<ThemeController>().isDark.value) {
                Get.changeTheme(ThemeData.dark());
                // * Write in box
                box.write('theme', true);
              } else {
                Get.changeTheme(ThemeData.light());
                box.write('theme', false);
              }
            },
          );
        }),
      ),
    );
  }
}
