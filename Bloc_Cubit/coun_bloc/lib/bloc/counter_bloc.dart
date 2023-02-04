//*-->Event: Su kien
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

//*Su_kien_Them:Tru
class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

//*Bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
