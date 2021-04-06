import 'package:dio/dio.dart';

import '../models/models.dart';

class UserRepository {
  final Dio _dio = Dio();

  /// Getting users list from randomuser api
  Future<List<User>> getUser({numOfUser: 20}) async {
    List<User> users = [];

    try {
      Response response =
          await _dio.get('https://randomuser.me/api/?results=$numOfUser');
      response.data['results'].map((data) {
        users.add(User.fromJson(data));
      }).toList();
    } catch (e) {}

    return users;
  }
}
