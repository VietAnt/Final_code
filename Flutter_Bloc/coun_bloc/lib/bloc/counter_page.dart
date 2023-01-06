import 'package:coun_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
 * Tại thời điểm này, chúng tôi đã tách thành công lớp trình bày khỏi lớp logic nghiệp vụ của mình.
 *  Lưu ý rằng CounterPage tiện ích không biết gì về điều gì sẽ xảy ra khi người dùng nhấn vào các nút.
 *  Tiện ích chỉ đơn giản cho biết CounterBloc rằng người dùng đã nhấn nút tăng hoặc giảm.
 */
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementPressed()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterDecrementPressed()),
            ),
          ),
        ],
      ),
    );
  }
}
