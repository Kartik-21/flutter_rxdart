import 'package:flutter/material.dart';
import 'package:flutter_rxdart/blocs/HomeScreenBloc.dart';
import 'package:flutter_rxdart/screens/FetchDataScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _hight, _width, _blockOfHight, _blockOfWidth;

  @override
  Widget build(BuildContext context) {
    _hight = _hight ?? MediaQuery.of(context).size.height;
    _width = _width ?? MediaQuery.of(context).size.width;
    _blockOfWidth = _blockOfWidth ?? (_width / 100);
    _blockOfHight = _blockOfHight ?? (_hight / 100);

    final bloc = HomeScreenBloc();

    return Container(
      height: _hight,
      width: _width,
      child: Scaffold(
        appBar: AppBar(
          title: Text("RxDart"),
          elevation: 6.0,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: _blockOfHight * 1),
          child: ListView(
            children: [
              SizedBox(
                height: _blockOfHight * 15,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: _blockOfHight * 1.5),
                  child: StreamBuilder<String>(
                    stream: bloc.email,
                    builder: (context, snapshot) {
                      //  print(bloc.email.);
                      return TextField(
                        onChanged: (s) => bloc.emailChanged.add(s),
                        decoration: InputDecoration(
                            labelText: "Enter Email",
                            errorText: snapshot.error,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: _blockOfHight * 1.5),
                  child: StreamBuilder<String>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (s) => bloc.passwordChanged.add(s),
                        decoration: InputDecoration(
                            labelText: "Enter Password",
                            errorText: snapshot.error,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: _blockOfHight * 2),
                child: SizedBox(
                  height: _blockOfHight * 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: StreamBuilder<bool>(
                      stream: bloc.submitCheck,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          onPressed: snapshot.hasData
                              ? () {
                                  //  debugPrint("submit");
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return FetchDataScreen();
                                    },
                                  ));
                                }
                              : null,
                          elevation: 6.0,
                          color: Theme.of(context).accentColor,
                          child: StreamBuilder<String>(
                            stream: bloc.email,
                            builder: (context, snapshot) {
                              bloc.listenData();
                              return Text(
                                snapshot.data ?? "nothing",
                                style: TextStyle(fontSize: 20.0),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
