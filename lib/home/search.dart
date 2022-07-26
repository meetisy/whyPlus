import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  @override
  _SearchState createState() => new _SearchState();
}
class _SearchState extends State<Search>{
  var historySearchList = [];
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    FocusNode _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        print("请求搜索问题：${controller.text}");
        setState(() {
          historySearchList.add("${controller.text}");
        });
      }
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.search,color: Colors.black,),
          title: TextField(
            focusNode: _focusNode,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(6, 2, 1, 1),
              hintText: "请输入要搜索的问题",
              hintStyle: TextStyle(fontSize: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
              )
            ),
          ),
          actions: [
            TextButton(onPressed: ()=>{
              Navigator.pop(context)
            }, child: Text("取消",style: TextStyle(color: Colors.black),))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text("                                           历史搜索",style: TextStyle(fontSize: 15,color: Colors.black),),Spacer(),
                  IconButton(onPressed: ()=>{
                    setState(() {
                      historySearchList = [];
                    })
                  }, icon: Icon(Icons.dangerous))
                ],
              ),
              Column(
                  // children: [TextButton(onPressed: ()=>{print(2333)}, child: Text("2333"))],
                children:[
                ...historySearchList.map((e) => TextButton(onPressed: ()=>{
                print("请求搜索历史搜索过的问题：${e}")
                }, child: Text(e,style: TextStyle(fontSize: 15,color: Colors.black),))).toList(),]
              )
            ],
          )
        ),
      ),
    );
  }
}
