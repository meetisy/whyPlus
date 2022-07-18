import 'package:flutter/material.dart';
import 'article.dart';
import 'reply_page.dart';

class Recommend extends StatefulWidget{
  @override
  _RecommendState createState() => new _RecommendState();
}
class _RecommendState extends State<Recommend>{
  Widget commonCard(Article article){
    Widget markWidget;
    if (article.imgUrl == null) {
      markWidget = new Text(
          article.user + " :  " + article.mark,
          style: new TextStyle(height: 1.3, color: Colors.black)
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
              child: new Text(
                  article.user + " :  " + article.mark,
                  style: new TextStyle(height: 1.3, color: Colors.black)
              ),
            ),
          ),
          new Expanded(
              flex: 1,
              child: new AspectRatio(
                  aspectRatio: 3.0 / 2.0,
                  child:new Container(
                    foregroundDecoration:new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(article.imgUrl!),
                          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                    ),
                  )
              )
          ),
        ],
      );
    }
    return new Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: new FlatButton(
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) {
                  return new ReplyPage();
                }
            ));
          },
          child: new Column(
            children: <Widget>[
              new Container(
                  child: new Text(
                      article.title,
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.3, color: Colors.black)
                  ),
                  margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                  child: markWidget,
                  margin: new EdgeInsets.only(top: 6.0, bottom: 14.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(article.agreeNum.toString() + " 赞同 " + article.commentNum.toString() + "评论", style: new TextStyle(color: Colors.black))
                    ),
                    new Icon(Icons.linear_scale, color: Colors.black)
                  ],
                ),
                padding: const EdgeInsets.only(bottom: 10.0),
              )
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context){
    return new SingleChildScrollView(
        child: new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Column(
            children:[
              commonCard(articleList[0]),
              commonCard(articleList[1]),
              commonCard(articleList[2]),
              commonCard(articleList[3]),
            ],
          ),
        )
    );
  }
}