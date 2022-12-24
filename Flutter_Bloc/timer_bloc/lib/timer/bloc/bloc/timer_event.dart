part of 'timer_bloc.dart';

abstract class TimerEvent {
  const TimerEvent();
}

//*TimerStarted: thông báo cho TimerBloc rằng bộ hẹn giờ sẽ được bắt đầu.
class TimerStarted extends TimerEvent {
  final int duration;
  const TimerStarted({required this.duration});
}

//*TimerPaused: thông báo cho TimerBloc rằng bộ đếm thời gian sẽ bị tạm dừng.
class TimerPaused extends TimerEvent {
  const TimerPaused();
}

//*TimerResumed: thông báo cho TimerBloc rằng bộ hẹn giờ sẽ được tiếp tục.
class TimerResumed extends TimerEvent {
  const TimerResumed();
}

//*TimerReset: thông báo cho TimerBloc rằng bộ hẹn giờ sẽ được đặt lại về trạng thái ban đầu.
class TimerReset extends TimerEvent {
  const TimerReset();
}

//*TimerTicked : thông báo cho TimerBloc rằng một dấu tích đã xảy ra và nó cần cập nhật trạng thái tương ứng.
class _TimerTicked extends TimerEvent {
  final int duration;
  const _TimerTicked({required this.duration});
}
