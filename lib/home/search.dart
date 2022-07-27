import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Search extends StatefulWidget{
  @override
  _SearchState createState() => new _SearchState();
}
class _SearchState extends State<Search>{
  var historySearchList = [];
  var deleteSearchOnPressed = false;
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
      if (_focusNode.hasFocus && deleteSearchOnPressed == true) {
        setState(() {
          deleteSearchOnPressed = false;
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
        resizeToAvoidBottomInset: false,
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
                      //historySearchList = [];
                      deleteSearchOnPressed = true;
                    })
                  }, icon:Icon(Icons.dangerous_outlined))
                ],
              ),
              Wrap(
                children: [
                  // deleteSearchOnPressed?
                  // Text("true"):Text("false")
                  //

                  ...historySearchList.map((e) =>
                  deleteSearchOnPressed?
                      Wrap(children: [Text("${e}",style: TextStyle(fontSize: 15),),IconButton(onPressed: ()=>{
                        setState(()=>{
                          historySearchList.remove(e)
                        })
                      }, icon: Icon(Icons.close))],):
                      TextButton(onPressed: ()=>{
                    print("请求搜索历史搜索过的问题：${e}")
                    }, child: Text(e,textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.black),))).toList()
                ],
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
                  // children: searchHotList.map((e) => Text("${e}",style: TextStyle(color: Colors.black,fontSize :15))).toList(),
                  children: searchHotList.map((e) => TextButton(
                    onPressed: ()=>{print("请求搜索热点:${e}")},
                      child: Text("${e}",style: TextStyle(color: Colors.black,fontSize :15)))).toList(),)
              ),
              DefaultTabController(length: 2,child: Container(
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      tabs: [
                      new Tab(text: "想法",),
                      new Tab(text: "推荐"),
                    ],),
                    Container(child: new TabBarView(
                        children: [
                          Text("0"),
                          Text("1"),
                        ]),height: 200,)
                  ],
                ),
              ),)
            ],
          )
        ),
      ),
    );
  }
}
