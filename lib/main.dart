import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apidata.dart';
import 'model.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherInfo _weatherInfo = WeatherInfo();
  WeatherModel? _weatherModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData()async{
    _weatherModel = await _weatherInfo.getWeather("London");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Api Example"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,info){
          if(info.connectionState == ConnectionState.done){
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny_rounded,color: Colors.orange,size: 80,),
                  Text(_weatherModel!.main!.temp.toString()+"°C",style: TextStyle(fontSize: 65),),
                  Text(_weatherModel!.name.toString(),style: TextStyle(fontSize: 30),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Wind"),
                      Text(_weatherModel!.wind!.speed.toString()+"km/h"),

                      Text("feels_like"),
                      Text(_weatherModel!.main!.feelsLike.toString()),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("humidity"),
                      Text(_weatherModel!.main!.humidity.toString()),

                      Text("description"),
                      Text(_weatherModel!.weather![0].description.toString()),
                    ],
                  ),
                ],
              ),
            );
          }else{
            return Center(
              child: Container(
                child: Text("Loading...."),
              ),
            );
          }
        },
      ),
    );
  }
}


