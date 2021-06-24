import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:multi_select_demo/models/userList.dart';

class UsersServices {
  Future<UserList> fetchData(int page) async {
    var url = Uri.https("reqres.in", "/api/users", {"page": "$page"});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse.isNotEmpty) {
        return UserList.fromJson(jsonResponse);
      }
    }
    return UserList();
  }
}
