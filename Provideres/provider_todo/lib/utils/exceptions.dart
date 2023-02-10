//Todo:Auth_Exception: Xác_Thực_Ngoại_Lệ
class AuthException implements Exception {
  final String code;
  final String message;
  AuthException(this.code, this.message);
}

//Todo:ApiException: Xác_Thực_Ngoại_Lệ
class ApiException implements Exception {
  final String code;
  final String message;
  ApiException(this.code, this.message);
}
