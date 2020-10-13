import 'dart:async';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends Object with Validator {
  final _emailController = PublishSubject<String>();
  final _passwordControlller =
      PublishSubject<String>(); //it always refresh and get new values

  StreamSink<String> get emailChanged => _emailController.sink;

  StreamSink<String> get passwordChanged => _passwordControlller.sink;

  Stream<String> get email => _emailController.stream.transform(emailvalidator);

  Stream<String> get password =>
      _passwordControlller.stream.transform(emailvalidator);

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(email, password, (e, p) => true);

  void dispose() {
    _emailController?.close();
    _passwordControlller?.close();
  }
}

mixin Validator {
  var emailvalidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 6) {
        sink.add(data);
      } else {
        sink.addError("Enter length >6");
      }
    },
  );
}
