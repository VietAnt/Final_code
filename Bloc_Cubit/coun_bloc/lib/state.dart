import 'package:flutter/material.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //khai bao state = 0
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Lệnh gọi setState này nói với Flutter framework rằng có thứ gì đó
      // đã thay đổi trong Trạng thái này, khiến nó chạy lại phương thức xây dựng bên dưới
      // để màn hình có thể phản ánh các giá trị được cập nhật. Nếu chúng ta thay đổi
      // _counter mà không gọi setState() thì phương thức build sẽ không
      // được gọi lại và do đó sẽ không có gì xảy ra.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
