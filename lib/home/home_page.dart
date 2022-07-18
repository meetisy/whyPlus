
import 'package:flutter/material.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return new DefaultTabController(length: 3, child: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new TabBar(
          labelColor: Colors.black,
          tabs: [
            new Tab(text: "关注"),
            new Tab(text: "推荐"),
            new Tab(text: "热榜")
          ],
        )
      ),
      body: new TabBarView(children: [
        new Follow(),
        new Recommend(),
        new Hot()
      ]),
    ));
  }
}