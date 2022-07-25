import 'package:flutter/material.dart';
import 'question.dart';
import 'question_page.dart';

class Hot extends StatefulWidget{
  @override
  _HotState createState() => new _HotState();
}
class _HotState extends State<Hot>{

  Widget hotCard(Question question){
    var flatButtonOnPressed = (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return new QuestionPage();}));
    };
    var num = new Expanded(flex: 1,child: new Column(
      children: <Widget>[
        new Container(
          child: new Text(
            question.order,
            style: new TextStyle(
                color: question.order.compareTo("03")<=0?Colors.red:Colors.orange,fontSize: 18)
          ),
          alignment: Alignment.topLeft,
        )
      ],
    ));
    var title = new Expanded(flex: 6,child: new Column(
      children: <Widget>[
        new Container(
          child: new Text(
            question.title,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 2, color: Colors.black),
          ),
          padding: const EdgeInsets.only(bottom: 15.0,right: 4.0),
          alignment: Alignment.topLeft,
        ),
        new Container(
          child: new Text(question.hotNum, style: new TextStyle(color: Colors.black)),
          alignment: Alignment.topLeft,
        )
      ],
    ));
    var pic = new Expanded(child: new AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: new Container(
          foregroundDecoration:new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(question.imgUrl),
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
  Widget build(BuildContext context){
    return new SingleChildScrollView(
      child: new Container(
        child: new Column(
          children: <Widget>[
            hotCard(questionList[0]),
            hotCard(questionList[1]),
            hotCard(questionList[2]),
            hotCard(questionList[3]),
            hotCard(questionList[4]),
            hotCard(questionList[5]),
            hotCard(questionList[6]),
            hotCard(questionList[7]),
            hotCard(questionList[8]),
            hotCard(questionList[9]),
            hotCard(questionList[10]),
            hotCard(questionList[11])
          ],
        ),
      ),
    );
  }
}