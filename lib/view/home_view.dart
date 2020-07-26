import 'package:deneme/model/Questions.dart';
import 'package:deneme/services/service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Card(
                child: FutureBuilder<List<Questions>>(
                    future: getPost(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              Text(snapshot.data[index].english),
                          itemCount: snapshot.data.length,
                        );
                      } else
                        return CircularProgressIndicator();
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
