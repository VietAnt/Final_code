import 'package:flutter/material.dart';
import 'package:getx_lession/models/video_model.dart';

class VideoListProvider with ChangeNotifier {
  List<VideoModel> videoList = [];

  updateVideoList({required videoList}) {
    this.videoList = videoList;
    notifyListeners();
  }
}
