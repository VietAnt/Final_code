import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
    ),
  );
}

//Todo: GetxController
class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

//Todo: Home
class Home extends StatelessWidget {
  Home({super.key});
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("Click: ${controller.count}"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                  );
                },
                child: const Icon(Icons.add_box),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(Other());
                },
                child: const Text("Go to Other"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

//Todo: Other
class Other extends StatelessWidget {
  Other({super.key});
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${controller.count}",
        ),
      ),
    );
  }
}
