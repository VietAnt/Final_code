import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  //*khoi_tao_bien
  late Box box;
  late SharedPreferences preferences;

  //*Khoi_Tao_CSDL
  openBox() {
    box = Hive.box('money');
  }

  DbHelper() {
    openBox();
  }

  //*addData
  void addData(int amount, DateTime date, String type, String note) {
    var value = {'amount': amount, 'date': date, 'type': type, 'note': note};
    box.add(value);
  }

  //*deleteData
  Future deleteData(int index) async {
    await box.deleteAt(index);
  }

  //*CleanData
  Future cleanData() async {
    await box.clear();
  }

  //*addName
  addName(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
  }

  //*getName
  getName() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }
}
