import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_ex/Handle.dart';
import 'package:json_ex/widgets/listview.dart';

import 'Corona.dart';

class Json extends StatefulWidget{
  @override
  _Json createState() => _Json();

}
class _Json extends State<Json>{

  List <String> listData = new List();
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Corona', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
      )),
      body: Container(
        color: Colors.black26,
        child: FutureBuilder<List<Todo>>(
          future: Handle.getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListViewWidget(data: snapshot.data,);
            }
            else if( snapshot.hasError){
              return Text('Error'+snapshot.error);
            }
            else{
             return Center(child: CircularProgressIndicator());
            }
            },
        ),
      ),
    );
  }

}