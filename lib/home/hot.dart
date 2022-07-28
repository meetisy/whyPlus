import 'package:flutter/material.dart';
import 'question.dart';
import 'question_page.dart';
import 'package:dio/dio.dart';

class Hot extends StatefulWidget{
  @override
  _HotState createState() => new _HotState();
}
class _HotState extends State<Hot>{
  var stealList = [];
  Widget hotCard(Map<String,dynamic> question){
    var flatButtonOnPressed = (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return new QuestionPage();}));
    };
    var num = new Expanded(flex: 1,child: new Column(
      children: <Widget>[
        new Container(
          child: new Text(
            question["order"],
            style: new TextStyle(
                color: Colors.red,fontSize: 18)
          ),
          alignment: Alignment.topLeft,
        )
      ],
    ));
    var title = new Expanded(flex: 6,child: new Column(
      children: <Widget>[
        new Container(
          child: new Text(
            question["title"],
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 2, color: Colors.black),
          ),
          padding: const EdgeInsets.only(bottom: 15.0,right: 4.0),
          alignment: Alignment.topLeft,
        ),
        new Container(
          child: new Text(question["hotNum"], style: new TextStyle(color: Colors.black)),
          alignment: Alignment.topLeft,
        )
      ],
    ));
    var pic = new Expanded(child: new AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: new Container(
          foregroundDecoration:new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(question["imageUrl"]),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(6.0))
          ),
        )
    ));
    var containerChild = new Row(
      children: <Widget>[
        num,title,pic],
    );
    var flatButtonChild = new Container(
      child: containerChild,
    );
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white30,
        border: new BorderDirectional(
            bottom: new BorderSide(color:  Colors.black12, width: 1.0)
        )
    ),
      child: new TextButton(
          onPressed: flatButtonOnPressed,
          child: flatButtonChild)
    );
  }

  @override
  Widget build(BuildContext context) {
    Dio dio =  Dio();
    return new SingleChildScrollView(
      child: new Container(
        child: FutureBuilder(
        future: dio.get('http://192.168.0.104:8888/get_hot_question_list'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasError) {
    // 请求失败，显示错误
    return Text("Error: ${snapshot.error}");}
    var hotQuestionList= [];
    for( var i = 0 ; i < 15; i++ ) {
      hotQuestionList.add(Map<String,dynamic>.from(snapshot.data.data[i]));
    }
    List<Widget> listWidget = [];
    for (var i =0;i<15;i++){
      listWidget.add(hotCard(hotQuestionList[i]));
    }
    return Column(children: listWidget);
    }
    return Text("");
    }
      ),
    ));
  }
}