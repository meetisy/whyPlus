import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  @override
  _SearchState createState() => new _SearchState();
}
class _SearchState extends State<Search>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.search,color: Colors.black,),
          title: TextField(
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
      ),
    );
  }
}
