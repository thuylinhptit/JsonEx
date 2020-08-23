import 'package:http/http.dart' as http ;
import 'Corona.dart';

class Handle {
  static const String url = 'https://corona.lmao.ninja/v3/covid-19/countries/';
  static Future <List<Todo>> getData () async{
    final response = await http.get(url);
    return todoFromJson(response.body);
  }
}