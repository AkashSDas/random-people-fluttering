import 'package:dio/dio.dart';

import '../models/models.dart';

class UserRepository {
  final Dio _dio = Dio();

  // Getting users list
  Future<List<User>> getUser({numOfUser: 20}) async {
    List<User> users = [];

    var response = await _dio.get(
      'https://randomuser.me/api/?results=$numOfUser',
    );
    response.data['results'].map((data, index) {
      users.add(User.fromJson(data, index));
    }).toList();

    return users;
  }
}
