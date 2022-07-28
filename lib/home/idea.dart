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
    // var imageList = ["https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    // "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg",
    //     "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    //   "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg",
    //   "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    //   "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg",
    //   "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    //   "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg",
    //   "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    //   "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg",];
    // var ideaList = ["2333是什么意思?","什么是flutter?",
    //   "2333是什么意思?","什么是flutter?",
    //   "2333是什么意思?","什么是flutter?",
    //   "2333是什么意思?","什么是flutter?", "2333是什么意思?","什么是flutter?",];

    // return RefreshIndicator(
    //   onRefresh: _onRefresh,
    //   child: StaggeredGridView.countBuilder(
    //     crossAxisCount: 4,
    //     itemCount: 9,
    //     itemBuilder: (BuildContext context, int index){
    //       var textButtonOnPressed = (){
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context){
    //               return new QuestionPage();}));
    //       };
    //       var textButtonChild = Column(children: [
    //             Image.network(imageList[index]),
    //             Spacer(),
    //             Text(ideaList[index],style: TextStyle(fontSize: 15,color: Colors.black),)
    //       ]);
    //       return new Container(
    //           color: Colors.white,
    //           child: TextButton(
    //             child: textButtonChild,
    //             onPressed: textButtonOnPressed,
    //           ),
    //           // child: Column(
    //           //   children: [
    //           //     Image.network(imageList[index]),
    //           //     Spacer(),
    //           //     Text(ideaList[index],style: TextStyle(fontSize: 15),)
    //           //   ],
    //           // )
    //       );
    //     },
    //     staggeredTileBuilder: (int index) =>
    //     new StaggeredTile.count(2, index.isEven ? 2 : 1.7),
    //     mainAxisSpacing: 8.0,
    //     crossAxisSpacing: 8.0,
    //   )
    // );
    Dio dio =  Dio();
    return FutureBuilder(
        future: dio.get('http://192.168.0.104:8888/get_idea_list'),
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