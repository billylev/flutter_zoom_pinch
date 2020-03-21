import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zoom_pinch/zoomOverlay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///////////////

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget listRow(int row) {
    return Column(children: <Widget>[
      ZoomOverlay(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/800?image=' +
                      (100 + row).toString()))),
      Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Container(
            height: 150,
            color: Colors.grey[200],
            child: const Center(child: Text('Image')),
          )),
      SizedBox(height: 10)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            listRow(1),
            listRow(2),
            listRow(3),
            listRow(4),
          ],
        ));
  }
}
