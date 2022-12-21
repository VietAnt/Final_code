import 'package:getx_lession/models/video_model.dart';
import 'package:get/get.dart';

class VideoListController extends GetxController {
  List<VideoModel> videoList = [];

  updateVideoList({required videoList}) {
    this.videoList = videoList;
    update();
  }
}
