import 'package:flutter/material.dart';
import 'question_page.dart';

class Common {
  static Widget searchInput(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new TextButton.icon(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: "搜索比乎内容",
                  hintStyle: new TextStyle(color: Colors.black)
              ),
            ),
          ),
          new Container(
            child: new IconButton(icon: new Icon(Icons.share, color: Colors.black), onPressed: (){}, padding: const EdgeInsets.all(0.0), iconSize: 18.0),
          ),
          new Container(
            child: new IconButton(icon: new Icon(Icons.list, color: Colors.black), onPressed: (){}, padding: const EdgeInsets.all(0.0), iconSize: 18.0),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: Colors.white,
      ),
      height: 36.0,
      //padding: new EdgeInsets.only(top:8.0, bottom: 8.0, left: 8.0, right: 8.0),
    );
  }
}

class ReplyPage extends StatefulWidget {

  @override
  ReplyPageState createState() => new ReplyPageState();
}

class ReplyPageState extends State<ReplyPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
              title: Common.searchInput(context)
          ),
          body: new SingleChildScrollView(
            child: new Column(
              children: [
                new Container(
                  child: new FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) {
                            return new QuestionPage();
                          }
                      ));
                    },
                    child: new Container(
                      child: new Text("你认为《三体》中最牛的文明是？", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, height: 1.3, color: Colors.black)),
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                    ),
                    color: Colors.white,
                  ),
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(bottom: new BorderSide(color: Colors.white10))
                  ),
                ),
                new Container(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child: new Container(
                            child: new TextButton.icon(
                              onPressed: (){},
                              icon: new Icon(Icons.brush),
                              label: new Text("写回答"),
                            ),
                            decoration: new BoxDecoration(
                                border: new BorderDirectional(end: new BorderSide(color: Colors.white10))
                            ),
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child: new Container(
                            child: new FlatButton(
                              onPressed: (){
                                Navigator.of(context).push(new MaterialPageRoute(
                                    builder: (context) {
                                      return new QuestionPage();
                                    }
                                ));
                              },
                              child: new Text("查看全部10000个回答 > "),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    margin: new EdgeInsets.only(bottom: 10.0)
                ),
                new Container(
                  child: new ListTile(
                      leading: new CircleAvatar(
                          backgroundImage: new NetworkImage("https://pic3.zhimg.com/v2-cd467bb9bb31d0384f065cf0bd677930_xl.jpg"),
                          radius: 20.0
                      ),
                      title: new Text("Flutter"),
                      subtitle: new Text("人生如逆旅，我亦是行人"),
                      trailing: new ElevatedButton.icon(onPressed: (){}, icon: new Icon(Icons.add, color: Colors.white), label: new Text("关注", style: new TextStyle(color: Colors.white),))
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: new BorderDirectional(bottom: new BorderSide(color: Colors.white10))
                  ),
                ),
                new Container(
                  child: new Text(
                      "回归运动\n\n三体定义的黑暗森林的宇宙格局，就是文明相互攻击和毁灭，越高级的，越明白藏好自己做好清理，绝不做探测对方文明的愚蠢行为。\n\n然而归还运动跳出了这个黑暗森林法则，不玩黑暗森林打击，不但探测别的宇宙文明，而且还深入了解对方文明，而且是全宇宙的所有文明。\n\n这是一种多么自信的科技实力呀，才能跳出黑暗森林的生存法则呀",
                      style: new TextStyle(height: 1.4, fontSize: 16.0, color: Colors.black), textAlign: TextAlign.start
                  ),
                  margin: const EdgeInsets.all(16.0),
                )
              ],
            ),
          ),
          bottomNavigationBar: new BottomAppBar(
              child: new Container(
                height: 70.0,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new TextButton.icon(onPressed: (){}, label: new Text("赞同 10 K",style: new TextStyle(fontSize: 16),), icon: new Icon(Icons.arrow_drop_up,color: Colors.blueAccent)),
                      margin: new EdgeInsets.only(left: 16.0),
                    ),
                    new Container(
                      child: new IconButton(onPressed: (){}, icon: new Icon(Icons.arrow_drop_down,color: Colors.blueAccent,),padding: const EdgeInsets.all(0.0)),
                      margin: new EdgeInsets.only(left: 8.0),
                      decoration: new BoxDecoration(
                        borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
                        color: Colors.white,
                      ),
                    ),
                    new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new IconButton(
                                onPressed: (){ print("icon");},
                                icon: new Container(
                                  child: new Column(
                                    children: <Widget>[
                                      new Icon(Icons.favorite, size: 18.0, color: Colors.black,),
                                      new Text("345", style: new TextStyle(fontSize: 10.0, color: Colors.black),)
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(),
                                  height: 30.0,
                                )
                            ),
                            new IconButton(
                                onPressed: (){ print("icon");},
                                icon: new Container(
                                  child: new Column(
                                    children: <Widget>[
                                      new Icon(Icons.star, size: 18.0, color: Colors.black,),
                                      new Text("348", style: new TextStyle(fontSize: 10.0, color: Colors.black),)
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(),
                                  height: 30.0,
                                )
                            ),
                            new IconButton(
                                onPressed: (){ print("icon");},
                                icon: new Container(
                                  child: new Column(
                                    children: <Widget>[
                                      new Icon(Icons.mode_comment, size: 18.0, color: Colors.black,),
                                      new Text("399", style: new TextStyle(fontSize: 10.0, color: Colors.black),)
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(),
                                  height: 30.0,
                                )
                            ),
                          ],
                        )
                    )
                  ],
                ),
                color: Colors.white,
              )
          ),
        )
    );
  }

}