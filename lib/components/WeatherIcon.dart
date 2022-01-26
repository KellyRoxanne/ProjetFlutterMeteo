import 'package:flutter/material.dart';

class WeatherIcon extends StatefulWidget {
  final String time;
  final double size;
  const WeatherIcon({
    Key? key,
    required this.time,
    this.size = 40,
  }) : super(key: key);

  @override
  _WeatherIconState createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon> {
  @override
  Widget build(BuildContext context) {
    String iconName = '';
    // Charger une icône en fonction du nom
        switch (widget.time) {
            case 'Mist':
                iconName = 'assets/img/weather-icons/wind-sun.png';
                break;
            case 'Smoke':
                iconName = 'assets/img/weather-icons/wind-sun.png';
                break;
            case 'Haze':
                iconName = 'assets/img/weather-icons/wind-sun.png';
                break;
            case 'brouillard':
                iconName = 'assets/img/weather-icons/brume.png';
                break;
            case 'Rain':
                iconName = 'assets/img/weather-icons/rain.png';
                break;
            case 'couvert':
                iconName = 'assets/img/weather-icons/haze.png';
                break;
            case 'Cloudy':
                iconName = 'assets/img/weather-icons/cloud.png';
                break;
            case 'Cloud':
                iconName = 'assets/img/weather-icons/cloud.png';
                break;
            case 'Thunderstorm':
                iconName = 'assets/img/weather-icons/thunder.png';
                break;
            case 'Rain2':
                iconName = 'assets/img/weather-icons/rain2.png';
                break;
            case 'Clear':
                iconName = 'assets/img/weather-icons/sun.png';
                break;
            case 'Snow':
                iconName = 'assets/img/weather-icons/snow.png';
                break;
            case 'Clouds':
                iconName = 'assets/img/weather-icons/half-cloudy-sun.png';
                break;
            default: break;
        }
    return Image.asset(
      iconName,
      width: widget.size,
      fit: BoxFit.contain,
    );
  }
}
