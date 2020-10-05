import 'dart:convert';
import 'dart:async';
import 'package:flutter_rxdart/AppConstants/UrlConstant.dart';
import 'package:flutter_rxdart/models/Post.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<Post>> getPost() async {
    try {
      var responce = await http.get(UrlConstant.urlForPosts);

      if (responce.statusCode == 200) {
        print(responce.body);
        List result = json.decode(responce.body);
        List<Post> list = result.map<Post>((d) => Post.fromJson(d)).toList();

        // List<Post> list = List<Post>();
        // if (result != null) {
        //   result.forEach((element) {
        //     list.add(Post.fromJson(element));
        //   });
        // }

        print(list.length);
        return list;
      } else {
        print("error");
        List<Post>();
      }
    } catch (e) {
      print(e);
      List<Post>();
    }
  }
}
