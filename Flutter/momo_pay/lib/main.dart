import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:momo_pay/pages/add_name.dart';
import 'package:momo_pay/pages/splash.dart';
import 'package:momo_pay/static.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MoMo Manager",
      theme: myTheme,
      home: const Splash(),
    );
  }
}
