import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'as Geo;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/forcast_responce_model.dart';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/constrant.dart';

class WeatherProvider extends ChangeNotifier{
CurrentResponseModel? currentResponseModel;
ForecastResponseModel? forecastResponseModel;
//GitupModel? gitupModel;
double latitude=0.0,longitude=0.0;
String unit='metric',unitSymbol=celsius;
setNewLocation(double let,double lng){
  longitude=lng;
  latitude=let;
}
bool get isFahrenheit=>unit==imperial;
void setTempUnit(bool value){
  unit=value?imperial:metric;
  unitSymbol=value?fahrenheit:celsius;
  notifyListeners();
}
getWeatherData(){
  _getCurrentData();
  _getForecastData();

}
Future<bool> setTempUnitPreferenceValue(bool value) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setBool('unit', value);
}

Future<bool> getTempUnitPreferenceValue() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getBool('unit') ?? false;
}


bool get hasDataLocated=>currentResponseModel!=null && forecastResponseModel !=null;

  void _getCurrentData()async {
    //final uri = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey');
 final uri=Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey');
  try{
    final response=await get(uri);
    final map=jsonDecode(response.body);
    if(response.statusCode==200){
     currentResponseModel=CurrentResponseModel.fromJson(map);
     print(currentResponseModel!.main!.temp);
     notifyListeners();
    }
    else{
      print(map['message']);
    }

  }catch(err){
rethrow;
  }

  }

  void _getForecastData()async {
   // final uri = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey');
    final uri=Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey');
    try{
      final response=await get(uri);
      final map=jsonDecode(response.body);
      if(response.statusCode==200){
        forecastResponseModel=ForecastResponseModel.fromJson(map);
        print(forecastResponseModel!.list!.length);
        notifyListeners();
      }
      else{
        print(map['message']);
      }

    }catch(err){
      rethrow;
    }


  }


// void getGithupData()async {
//   //final uri = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey');
//
//   final uri=Uri.parse('https://api.github.com/search/repositories?q=%7Bflutter%7D%7B&page%2Cper_page%2Csort%2Corder%7D%2F&fbclid=IwAR0m0D8Kx3JS2xCmgtROGGVWBJVpAwrnG63s3ElvSxiBgNLKR8pU-EQnb7s');
//   try{
//     final response=await get(uri);
//     final map=jsonDecode(response.body);
//     if(response.statusCode==200){
//       gitupModel=GitupModel.fromJson(map);
//       print(gitupModel!.items!.length);
//       notifyListeners();
//     }
//     else{
//       print(map['message']);
//     }
//
//   }catch(err){
//     rethrow;
//   }
//
// }

  void convertCityToLatLong({
    required String result,
  required Function(String) onErr
  })async {
    try{
      final locationList=await Geo.locationFromAddress(result);
      if(locationList.isNotEmpty){
        final location=locationList.first;
        setNewLocation(location.latitude, location.longitude);
        getWeatherData();

      }
      else{
        onErr('Location can not find');
      }

    }catch(e){
      onErr(e.toString());
    }

  }


}