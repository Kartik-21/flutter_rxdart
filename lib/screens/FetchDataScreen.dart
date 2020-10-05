import 'package:flutter/material.dart';
import 'package:flutter_rxdart/blocs/FetchDataScreenBloc.dart';
import 'package:flutter_rxdart/models/Post.dart';

class FetchDataScreen extends StatefulWidget {
  @override
  _FetchDataScreenState createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  double _hight, _width, _blockOfHight, _blockOfWidth;

  @override
  Widget build(BuildContext context) {
    _hight = _hight ?? MediaQuery.of(context).size.height;
    _width = _width ?? MediaQuery.of(context).size.width;
    _blockOfWidth = _blockOfWidth ?? (_width / 100);
    _blockOfHight = _blockOfHight ?? (_hight / 100);

    postBloc.GetData();
    return Container(
        height: _hight,
        width: _width,
        child: Scaffold(
            appBar: AppBar(
              title: Text("RxDart Fetch"),
              elevation: 6.0,
              centerTitle: true,
            ),
            body: Container(
              child: StreamBuilder<List<Post>>(
                stream: postBloc.myPost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data[index].id.toString()),
                            subtitle: Text(snapshot.data[index].title),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )));
  }
}
