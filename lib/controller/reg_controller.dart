import 'package:dio/dio.dart';

class AuthController {
  Dio dio = Dio();

  Future<void> registrationUser(name, email, password) async {
    final response = await dio.post('http://63.251.122.116:2310/registration',
        data: {'name': name, 'email': email, 'password': password});
  }
}
