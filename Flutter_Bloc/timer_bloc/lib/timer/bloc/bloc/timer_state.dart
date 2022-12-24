part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

//*TimerInitial — sẵn sàng bắt đầu đếm ngược từ khoảng thời gian đã chỉ định.
class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial {duration: $duration}';
}

//*TimerRunPause - tạm dừng ở một khoảng thời gian còn lại.
class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause {duration: $duration}';
}

//* TimerRunInProgress — tích cực đếm ngược từ thời lượng đã chỉ định.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';
}

//*TimerRunComplete — đã hoàn thành với thời lượng còn lại là 0.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
