//!The ticker: là nguồn dữ liệu của chúng tôi cho ưng dụng hẹn giờ
//!Nó sẽ hiện thị một luồng tick mà chúng ta có thể đăng kí và phản ứng
//!Ticker: là hiển thị 1 hàm đánh dấu lấy số lượng đánh dấu (giây) mà chúng ta
//! muốn trả về 1 luồng phát ra số giây còn lại mỗi giấy

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
