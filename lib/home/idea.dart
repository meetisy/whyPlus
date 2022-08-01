import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'question_page.dart';
import 'package:dio/dio.dart';
class Idea extends StatefulWidget{
  @override
  _IdeaState createState() => new _IdeaState();
}
class _IdeaState extends State<Idea>{
  @override
  Widget build(BuildContext context) {
    Future<void> _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 1500));  //模拟网络请求
      setState(() {});
    }
    Dio dio =  Dio();
    return FutureBuilder(
        future: dio.get('http://192.168.0.100:8888/get_idea_list'),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
          // 请求失败，显示错误
          return Text("Error: ${snapshot.error}");}
          var ideaList = snapshot.data.data;
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index){
                  var textButtonOnPressed = (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return new QuestionPage();}));
                  };
                  var cutText = ideaList[index]["context"].toString().length >20?
                  ideaList[index]["context"].toString().substring(0,20)+'...' :
                  ideaList[index]["context"].toString();

                  var textButtonChild = Wrap(children: [
                        Image.network(ideaList[index]["imageUrl"]),
                        // Spacer(),
                        Text(cutText,style: TextStyle(fontSize: 10,color: Colors.black),)
                  ]);
                  return new Container(
                      color: Colors.white,
                      child: TextButton(
                        child: textButtonChild,
                        onPressed: textButtonOnPressed,
                      ),
                      //   children: [
                      //     Image.network(imageList[index]),
                      //
                    // child: Column(/     Spacer(),
                      //     Text(ideaList[index],style: TextStyle(fontSize: 15),)
                      //   ],
                      // )
                  );
                },
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1.7),
              )
            );
    }
      return Text("");
    });
  }
}