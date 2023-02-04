import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  static const maxSeconds = 60;
  var seconds = maxSeconds;
  Timer? timer;

  /// Start Timer: Bắt đầu hẹn giờ:
  void startTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        stopTimer(rest: false);
        resetTimer();
      }
    });
  }

  /// Stop Timer:  dừng
  void stopTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer?.cancel();
    update();
  }

  /// Reset Timer: Đặt lại bộ hẹn giờ
  void resetTimer() {
    seconds = maxSeconds;
    update();
  }

  /// is Timer Active?: Hẹn giờ có hoạt động không
  bool isTimerRuning() {
    return timer == null ? false : timer!.isActive;
  }

  /// is Timer Completed?: Hẹn giờ đã hoàn thành chưa?
  bool isCompleted() {
    return seconds == maxSeconds || seconds == 0;
  }
}
