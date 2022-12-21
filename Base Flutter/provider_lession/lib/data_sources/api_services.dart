import 'package:http/http.dart' as http;
import 'package:provider_lession/data_sources/api_urls.dart';
import 'dart:convert' as json;
import 'package:provider_lession/models/video_model.dart';
import 'package:provider_lession/resources/logs.dart';
import 'package:provider_lession/resources/strings.dart';

class ApiServices {
  // fetch all videos

  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUrl = ApiUrls.VIDEO_URL;
    var response;
    // http,
    try {
      response = await http.get(videoListUrl);
    } catch (e) {
      print(ERROR_DOWNLOADING);
    }
    var body = json.jsonDecode(response.body);
    Log().printJson(json: body);
    if (body['code'] == 'success') {
      List jsonList = body['list'];
      for (var json in jsonList) {
        VideoModel videoModel = VideoModel.fromJson(json);
        videoList.add(videoModel);
      }
    }
    return videoList;
  }
}
