import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
String SearchInput = "Two";
class SearchQuestion extends StatefulWidget{
  SearchQuestion(String SearchInput);
  @override
  _SearchQuestionState createState() => new _SearchQuestionState(SearchInput);
}
class _SearchQuestionState extends State<SearchQuestion>{
  _SearchQuestionState(String SearchInput);
  Widget divider1=Container(height: 20,color: Colors.white70,);
  Widget renderQuestion(Map<String,dynamic> question){
    var cutText = question["Answer"].toString().length >40?
    question["Answer"].toString().substring(0,40)+'...' :
    question["Answer"].toString();
    return Column(
      children: [
           Wrap(children: [ Text(question["Title"],style: TextStyle(fontSize: 18,color: Colors.black)),],),
          Wrap(children: [Text(cutText,style: TextStyle(fontSize: 15,color: Colors.black),)],),
        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    Future<void> _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 1500));  //模拟网络请求
      setState((){});
    }
    Dio dio =  Dio();
    //return Container();
    return FutureBuilder(
        future: dio.get('http://192.168.0.104:8888/get_search_question_list',
            queryParameters:{"SearchInput": SearchInput}),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");}
            var searchedQuestionList= [];
            for( var i = 0 ; i < snapshot.data.data.length; i++ ) {
              searchedQuestionList.add(Map<String,dynamic>.from(snapshot.data.data[i]));
            }
            List<Widget> listWidget = [];
            for (var i =0;i<snapshot.data.data.length;i++){
              listWidget.add(renderQuestion(searchedQuestionList[i]));
            }
            // return RefreshIndicator(
            //     onRefresh: _onRefresh,
            //     child: Column(children: listWidget,));
            //
            // return ListView(children: listWidget);
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: ()=>{},color: Colors.black,),
                ),
                body: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return listWidget[index];
                  },
                  itemCount: 3,
                  //分割器构造器
                  separatorBuilder: (BuildContext context, int index) {
                    return divider1;
                  },
                  //children: listWidget,
                  padding: const EdgeInsets.all(24.0),)
              ),
            );
          }
          return Text("");
        });
  }
}