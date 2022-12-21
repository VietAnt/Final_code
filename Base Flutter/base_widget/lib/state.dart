import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget này là gốc của ứng dụng của bạn.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Đây là chủ đề của ứng dụng của bạn.
        // Hãy thử chạy ứng dụng của bạn với "flutter run". Bạn sẽ thấy
        // ứng dụng có thanh công cụ màu xanh. Sau đó, không thoát khỏi ứng dụng, hãy thử
        // thay đổi PrimarySwatch bên dưới thành Colors.green và sau đó gọi
        // "tải lại nóng" (nhấn "r" trong bảng điều khiển nơi bạn đã chạy "flutter run",
        // hoặc chỉ cần lưu các thay đổi của bạn vào "tải lại nóng" trong IDE Flutter).
        // Lưu ý rằng bộ đếm không đặt lại về 0; ứng dụng
        // không được khởi động lại.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // Widget này là trang chủ của ứng dụng của bạn. Nó có trạng thái, nghĩa là
  // rằng nó có một đối tượng Trạng thái (được định nghĩa bên dưới) chứa các trường ảnh hưởng đến
  // trông nó thế nào
  // Lớp này là cấu hình cho trạng thái. Nó giữ các giá trị (trong này
  // trường hợp tiêu đề) được cung cấp bởi phụ huynh (trong trường hợp này là tiện ích Ứng dụng) và
  // được sử dụng bởi phương thức build của State. Các trường trong một lớp con Widget là
  // luôn được đánh dấu là "cuối cùng".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    // Phương thức này được chạy lại mỗi khi setState được gọi, ví dụ như done
    // bằng phương thức _incrementCounter ở trên.
    // Khung công tác Flutter đã được tối ưu hóa để chạy lại các phương thức xây dựng
    // nhanh, để bạn có thể xây dựng lại bất cứ thứ gì cần cập nhật
    // thay vì phải thay đổi từng cá thể của widget.
    return Scaffold(
      appBar: AppBar(
        // Ở đây chúng ta lấy giá trị từ đối tượng MyHomePage được tạo bởi
        // phương thức App.build và sử dụng nó để đặt tiêu đề cho thanh ứng dụng của chúng ta.
        title: Text(widget.title),
      ),
      body: Center(
        // Trung tâm là một tiện ích bố cục. Phải mất một đứa trẻ duy nhất và định vị nó
        // ở giữa cha mẹ.
        child: Column(
          // Cột cũng là một tiện ích bố cục. Nó lấy một danh sách trẻ em và
          // sắp xếp chúng theo chiều dọc. Theo mặc định, nó tự kích thước để phù hợp với
          // con theo chiều ngang và cố gắng cao bằng cha của nó.
          // Gọi "bức tranh gỡ lỗi" (nhấn "p" trong bảng điều khiển, chọn
          // Hành động "Toggle Debug Paint" từ Flutter Inspector trong Android
          // Studio hoặc lệnh "Toggle Debug Paint" trong Visual Studio Code)
          // để xem wireframe cho mỗi widget.
          // Cột có các thuộc tính khác nhau để kiểm soát kích thước của chính nó và
          // cách nó định vị các con của nó. Ở đây chúng tôi sử dụng mainAxisAlignment để
          // căn giữa các con theo chiều dọc; trục chính ở đây là trục dọc
          // trục vì Cột thẳng đứng (trục chéo sẽ là
          // nằm ngang).
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
      ), // Dấu phẩy ở cuối này giúp định dạng tự động đẹp hơn cho các phương thức xây dựng.
    );
  }
}
