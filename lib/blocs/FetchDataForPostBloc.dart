import 'package:flutter_rxdart/models/Post.dart';
import 'package:flutter_rxdart/models/User.dart';
import 'package:flutter_rxdart/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class FetchDataForPostBloc {
  final _fetchSubject = PublishSubject<Post>();
  UserRepository _userRepository = UserRepository();

  Stream<Post> get myUser => _fetchSubject.stream;

  GetData() async {
    List<Post> users = await _userRepository.getUser();

    for (var i in users) {
      _fetchSubject.sink.add(i);
    }
  }

  dispose() {
    _fetchSubject?.close();
  }
}

final postBloc = FetchDataForPostBloc();
