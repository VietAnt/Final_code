/*
* BlocObserver: Giúp quan sát các thay đổi trạng thái trong ứng dụng
*/

import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  @override
  //onChange:De xem tat ca cac thay doi trang thai xay ra
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
