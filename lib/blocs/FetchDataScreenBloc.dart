import 'package:flutter_rxdart/models/Post.dart';
import 'package:flutter_rxdart/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class FetchDataScreenBloc {
  final _fetchSubject = PublishSubject<List<Post>>();
  UserRepository _userRepository = UserRepository();

  GetData() async {
    List<Post> users = await _userRepository.getPost();
    _fetchSubject.sink.add(users);
  }

  dispose() {
    _fetchSubject?.close();
  }

  Stream<List<Post>> get myPost => _fetchSubject.stream;
}

final postBloc = FetchDataScreenBloc();
