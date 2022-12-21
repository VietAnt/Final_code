import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lession/controllers/video_list_controller.dart';
import 'package:getx_lession/resources/strings.dart';
import 'package:getx_lession/views/video_detail_screen.dart';

class SecondVideoListScreen extends StatelessWidget {
  const SecondVideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final videoList =  Get.put(VideoListController()).videoList;

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<VideoListController>(
          init: VideoListController(),
          builder: (videoListController) {
            final videoList = videoListController.videoList;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Image.network(videoList[index].url_photo!),
                            Text(
                              videoList[index].title!,
                              softWrap: true,
                            )
                          ],
                        )),
                    onTap: () {
                      Get.to(VideoDetailScreen(videoModel: videoList[index]));
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
