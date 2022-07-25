import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      print("_onRefresh");
    }
    var imageList = ["https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg",
    "https://pic3.zhimg.com/50/v2-56dca99cd8718f9303d43b3015342ba7_hd.jpg"];
    var ideaList = ["2333是什么意思?","什么是flutter?"];
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) =>
        new Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.network(imageList[index]),
                Spacer(),
                Text(ideaList[index])
              ],
            )
        ),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1.7),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      )
    );
  }
}