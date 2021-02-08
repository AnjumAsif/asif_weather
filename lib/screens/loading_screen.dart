import 'package:asif_weather/screens/location_screen.dart';
import 'package:asif_weather/services/location.dart';
import 'package:asif_weather/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'c5420ce44948b548b2f225c0e4c9da34';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;
    print(location.latitude);
    print(location.longitude);
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
