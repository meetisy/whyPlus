
import 'package:copywhy/home/idea.dart';
import 'package:flutter/material.dart';
import 'follow.dart';
import 'recommend.dart';
import 'hot.dart';
import 'search.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    var pageList = [HomePage(),Follow(),Follow(),Follow(),Search()];
    return new DefaultTabController(length: 3, child: new Scaffold(
      appBar: new AppBar(
        actions: [IconButton(onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[4]))
        }, icon: Icon(Icons.search,color: Colors.black,))],
        backgroundColor: Colors.white,
        title: new TabBar(
          labelColor: Colors.black,
          // labelStyle: ,
          tabs: [
            new Tab(text: "想法"),
            new Tab(text: "推荐"),
            new Tab(text: "热榜"),
          ],
        )
      ),
      body: new TabBarView(children: [
        new Idea(),
        new Recommend(),
        new Hot(),
      ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 2,
      //   items: [
      //     BottomNavigationBarItem(icon: Text("首页"),label: "a"),
      //     BottomNavigationBarItem(icon: Text("关注"),label: "a"),
      //     BottomNavigationBarItem(icon: Text("+"),label: "a"),
      //     BottomNavigationBarItem(icon: Text("会员"),label: "a"),
      //     BottomNavigationBarItem(icon: Text("我的"),label: "a")
      //   ],
      //   onTap: (index){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[index]));
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
    color: Colors.white,
    //shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
    child: Row(
      children: [
        IconButton(icon: Icon(Icons.home),onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[0]))
        }),
        IconButton(icon: Icon(Icons.people),onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[0]))
        }),
        FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          child: new Icon(Icons.add),
          onPressed: ()=>{print(1)},), //中间位置空出
        IconButton(icon: Icon(Icons.rocket_launch),onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageList[0]))
        }),
        IconButton(icon: Icon(Icons.face),onPressed: ()=>{print(0)}),
      ],
        mainAxisAlignment: MainAxisAlignment.spaceAround
    )
      ),
    ));
  }
}

