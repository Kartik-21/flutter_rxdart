// import 'package:flutter_rxdart/models/User.dart';
// import 'package:flutter_rxdart/repository/UserRepository.dart';
// import 'package:rxdart/rxdart.dart';
//
// class FetchDataScreenBloc {
//   final _fetchSubject = PublishSubject<User>();
//   UserRepository _userRepository = UserRepository();
//
//   Stream<User> get myUser => _fetchSubject.stream;
//
//   GetData() async {
//     User users = await _userRepository.getUser();
//     _fetchSubject.sink.add(users);
//   }
//
//   dispose() {
//     _fetchSubject?.close();
//   }
// }
//
// final userBloc = FetchDataScreenBloc();
