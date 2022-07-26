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
    var searchHotList = [
      "油价或将三连跌",
      "专家：预售制...",
      "乐山2名儿童检...",
      "2022f1法国大奖赛",
      "抖音无脑反夏日...",
      "阿里双重上市",
      "广州12345回应",
      "赵露思吴磊"
    ];
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
                  Text("  历史搜索",style: TextStyle(fontSize: 15,color: Colors.black),),Spacer(),
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
                }, child: Text(e,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.black),))).toList(),]
              ),
              Row(
                children: [Text("  搜索发现",style: TextStyle(fontSize: 15)),Spacer(),TextButton.icon(icon: Icon(Icons.recycling,color: Colors.black26,),label: Text("换一换",style: TextStyle(fontSize: 15,color: Colors.black26),),onPressed: ()=>{print("刷新搜索热点")},)],
              ),
              Container(
                height: 300,
                width: 300,
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 //宽高比为1时，子widget
                    ),
                  children: searchHotList.map((e) => Text("${e}",style: TextStyle(color: Colors.black,fontSize :15))).toList(),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
