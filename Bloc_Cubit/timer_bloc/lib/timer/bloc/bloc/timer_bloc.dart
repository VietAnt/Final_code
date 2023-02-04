// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer_bloc/ticker.dart';
part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    //*OnEvent
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
  }

  //*Bien
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubcription;

  @override
  Future<void> close() {
    _tickerSubcription?.cancel();
    return super.close();
  }

  //*_onStared: Bat Dau
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));
    _tickerSubcription?.cancel();
    _tickerSubcription = _ticker.tick(ticks: event.duration).listen((duration) {
      return add(_TimerTicked(duration: duration));
    });
  }

  //*_onPaused: Tam Dung
  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubcription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  //*_onResumed: Tiep Tuc
  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubcription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  //*_onReset: Khoi Phuc
  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubcription?.cancel();
    emit(const TimerInitial(_duration));
  }

  //*_onTicked:Danh Dau
  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }
}
