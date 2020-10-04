import 'dart:convert';
import 'dart:async';
import 'package:flutter_rxdart/AppConstants/UrlConstant.dart';
import 'package:flutter_rxdart/models/Post.dart';
import 'package:flutter_rxdart/models/User.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<Post>> getUser() async {
    try {
      var responce = await http.get(UrlConstant.urlForPosts);

      if (responce.statusCode == 200) {
        print(responce.body);
        List result = json.decode(responce.body);
        List<Post> list = result.map<Post>((d) => Post.fromJson(d)).toList();
        // List<User> list =responce.forEa
        return list;
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
}
