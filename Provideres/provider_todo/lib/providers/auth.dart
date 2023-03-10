import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider_todo/widgets/notification_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  //*----->
  Status _status = Status.Uninitialized;
  String? _token;
  NotificationText? _notification;

  //*----->
  Status get status => _status;
  String? get token => _token;
  NotificationText? get notification => _notification;

  //*-->API
  final String api = 'https://laravelreact.com/api/v1/auth';

  //!Khoi_Tao_Auth_Provider
  initAuthProvider() async {
    String? token = await getToken();
    if (token != null) {
      _token = token;
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }

  //!Login: Dang_nhap
  Future<bool> login(String email, String password) async {
    _status = Status.Authenticating;
    _notification = null;
    notifyListeners();

    final url = "$api/login";

    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(Uri.parse(url), body: body);

    //*TH1:
    if (response.statusCode == 200) {
      Map<String, dynamic> apiResponse = json.decode(response.body);
      _status = Status.Authenticated;
      _token = apiResponse['access_token'];
      await storeUserData(apiResponse);
      notifyListeners();
      return true;
    }

    //*TH2:
    if (response.statusCode == 401) {
      _status = Status.Unauthenticated;
      _notification = const NotificationText(
        text: 'Invalid email or password.',
        type: 'Invalid email or password.',
      );
      notifyListeners();
      return false;
    }

    //*TH3:
    _status = Status.Unauthenticated;
    _notification = const NotificationText(
      text: 'Server error.',
      type: 'Server error.',
    );
    notifyListeners();
    return false;
  }

  //!:Register: Dang_Ky
  Future<Map> register(
    String name,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    final url = "$api/register";

    Map<String, String> body = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
    };

    Map<String, dynamic> result = {
      "success": false,
      "message": 'Unknown error.'
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      _notification = const NotificationText(
        text: 'Registration successful, please log in.',
        type: 'info',
      );
      notifyListeners();
      result['success'] = true;
      return result;
    }

    Map apiResponse = json.decode(response.body);

    //*TH1
    if (response.statusCode == 422) {
      if (apiResponse['errors'].containsKey('email')) {
        result['message'] = apiResponse['errors']['email'][0];
        return result;
      }

      if (apiResponse['errors'].containsKey('password')) {
        result['message'] = apiResponse['errors']['password'][0];
        return result;
      }

      return result;
    }
    return result;
  }

  //!. PasswordReset
  Future<bool> passwordReset(String email) async {
    final url = "$api/forgot-password";

    Map<String, String> body = {
      'email': email,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      _notification = const NotificationText(
        text: 'Reset sent. Please check your inbox.',
        type: 'info',
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  //*:storeUserData:L??u tr??? d??? li???u ng?????i d??ng
  storeUserData(apiResponse) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('token', apiResponse['access_token']);
    await storage.setString('name', apiResponse['user']['name']);
  }

  //*3:Thoat_Ra
  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    if (tokenExpired == true) {
      _notification = const NotificationText(
        type: 'info',
        text: 'Session expired. Please log in again.',
      );
    }
    notifyListeners();
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

  //*4:Lay_Token
  Future<String?> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? token = storage.getString('token');
    return token;
  }
}
