

import 'package:flutter/material.dart';
import 'package:json_ex/Corona.dart';

class ListViewWidget extends StatelessWidget {
  final List<Todo> data;

  const ListViewWidget({this.data});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
       itemCount: data == null ? 0: data.length,
       itemBuilder: (context, index){
         Todo corona = data[index];
         return ListTile(
           
             title: Text( 'Name: '+ ' ' + corona.country , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
             subtitle: Text( 'Case:' + ' ' + corona.cases.toString() , style: TextStyle(fontSize: 15, color: Colors.black
             ),)
         );
       });
  }

}