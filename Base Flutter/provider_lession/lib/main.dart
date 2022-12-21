import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:provider_lession/providers/video_list_provider.dart';
import 'package:provider_lession/views/video_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoListProvider()),
        // Đặt thêm các provider
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoListScreen(),
      ),
    );
  }
}
