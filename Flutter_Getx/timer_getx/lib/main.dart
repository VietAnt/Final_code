import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_getx/bindings.dart';
import 'package:timer_getx/utils/themes.dart';
import 'package:timer_getx/view/final_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Timer',
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      home: const FinalView(),
    );
  }
}
