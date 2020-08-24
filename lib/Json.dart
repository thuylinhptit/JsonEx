import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_ex/Handle.dart';
import 'package:json_ex/widgets/listview.dart';
import 'package:loadmore/loadmore.dart';

import 'Corona.dart';

class Json extends StatefulWidget{
  @override
  _Json createState() => _Json();

}
class _Json extends State<Json>{

  List <String> listData = new List();
  List<Todo> country_data = new List();
  List <Todo> show_data = new List();
  int count = 0;
  @override
  void initState() {
    super.initState();
    Handle.getData().then((value) {
      setState(() {
        country_data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(
          'Corona', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        )),
        body: Container(
          color: Colors.black26,
          child: LoadMore(
            isFinish: show_data.length == country_data.length,
            onLoadMore: _loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Todo corona = show_data[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      'Name: '+ ' ' + corona.country + '\nCases: '+ ' ' + corona.cases.toString()
                          + '\nActive: '+ ' ' + corona.active.toString() + 'Deaths: '+ ' ' + corona.deaths.toString() + '\n',
                      style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black

                  ),

                  ),
                );
              },
              itemCount: show_data.length,
            ),
            textBuilder: text_load_more,
          ),
        ),
      ),
    );
  }
  Future<bool> _loadMore() async {
    print("onLoadMore");
    // change seconds for delay time
    await Future.delayed(Duration(seconds: 1, milliseconds: 100));
    load();
    return true;
  }
  void load() {
    print("load item $count");
    setState(() {
      List<Todo>temp = [];
      for(int i=0;i<10;i++){
        temp.add(country_data[count]);
        count+=1;
      }
      show_data.addAll(temp);
    });
  }

  String text_load_more (LoadMoreStatus status) {
    String text;
    switch (status) {
      case LoadMoreStatus.fail:
        text = "Load du lieu Fail";
        break;
      case LoadMoreStatus.idle:
        text = "Loading";
        break;
      case LoadMoreStatus.loading:
        text = "Loading...";
        break;
      case LoadMoreStatus.nomore:
        text = "Het du lieu can load";
        break;
      default:
        text = "";
    }
    return text;
  }

}