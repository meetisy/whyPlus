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
    var flatButtonChild = new Container(

    );
    return new Container(
      child: new FlatButton(
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
            new Container(

            )
          ],
        ),
      ),
    );
  }
}