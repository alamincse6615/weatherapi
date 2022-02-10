import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapi/model.dart';

class WeatherInfo{

  Future<WeatherModel> getWeather(String city)async{
    String apiurl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f99154b4074ab6d40bdaef30df8fb498&units=metric";
    var api = Uri.parse(apiurl);
    var response =await http.get(api);
    var body = jsonDecode(response.body);
    print(body);
    return WeatherModel.fromJson(body);
  }
}