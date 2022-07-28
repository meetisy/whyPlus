// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() async{
  Dio dio =  Dio();
  Response? response = await dio.get('http://127.0.0.1:8888/get_hot_question_list');
  List<Map<String,dynamic>>list = [];
  for( var i = 0 ; i < 15; i++ ) {
    list.add(Map<String,dynamic>.from(response.data[i]));
  }
  print(list);
}
