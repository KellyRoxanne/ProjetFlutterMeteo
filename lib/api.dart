import 'dart:async';
import 'dart:convert';
import 'package:appmeteo/gps.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

const Map API_LINKS = {
  'weather': 'https://api.openweathermap.org/data/2.5/weather?',
  'previsions': 'https://api.openweathermap.org/data/2.5/forecast?'
};
const String API_KEY = 'd8e335688a025f1799b6faefa5fa1660';

// Récupération de la météo d'une ville
Future<Map> getCityWeather({required String cityName}) async {
  return await http
      .get(
    Uri.parse(API_LINKS['weather'] +
        'q=' +
        cityName +
        '&appid=' +
        API_KEY +
        '&units=metric&lang=FR'),
  )
      .then((response) {
    //print(response.body);
    return jsonDecode(response.body);
  }).catchError((error) {
    print("Weather error");
    return {};
  });
}

// Récupération des prévisions météo d'une ville
Future<Map> getCityForecast({required String cityName}) async {
  return await http
      .get(
    Uri.parse(API_LINKS['previsions'] +
        'q=' +
        cityName +
        '&appid=' +
        API_KEY +
        '&units=metric&lang=FR'),
  )
      .then((response) {
    //print(response.body);
    return jsonDecode(response.body);
  }).catchError((error) {
    print("Forecast error");
    return {};
  });
}

// Récupération de la météo de la ville actuelle
Future<Map> getPositionWeather() async {
  LocationData location = await checkLocationStatus();
  return await http
      .get(
    Uri.parse(API_LINKS['weather'] +
        'lat=${location.latitude}&lon=${location.longitude}&appid=${API_KEY}&units=metric&lang=FR'),
  )
      .then((response) {
    print(response.body);
    return jsonDecode(response.body);
  }).catchError((error) {
    print("Weather error");
    return {};
  });
}

//Future test = getCityWeather("Londres");
