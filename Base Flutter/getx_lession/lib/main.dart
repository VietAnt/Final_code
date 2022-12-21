import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lession/providers/video_list_provider.dart';
import 'package:getx_lession/views/video_list_screen.dart';
import 'package:provider/provider.dart';
import 'views/video_list_screen.dart';

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
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoListScreen(),
      ),
    );
  }
}
