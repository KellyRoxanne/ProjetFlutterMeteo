import 'package:intl/intl.dart';
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
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Fog":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Haze":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Dust":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case 'Rain':
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/2.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/5.png';
        }
        break;

      case "Thunderstorm":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/20.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/30.png';
        }
        break;

      case 'Clear':
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/10.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/26.png';
        }
        break;

      case 'Snow':
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/36.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/36.png';
        }
        break;

      case "Drizzle":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/35.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/35.png';
        }
        break;
      case 'Clouds':
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/15.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/27.png';
        }
        break;

      case "Sand":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Ash":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Squall":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;

      case "Tomado":
        DateTime now = DateTime.now();
        DateTime dt2 = DateTime.parse("2018-02-27 18:00");
        String st1 = DateFormat('kk').format(dt2);
        String format = DateFormat('kk').format(now);
        var toutou = int.parse(format);
        var barbecue = int.parse(st1);
        if (toutou > barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/41.png';
        } else if (toutou < barbecue) {
          print('$format');
          iconName = 'assets/img/weather-icons/4.png';
        }
        break;
      //
      default:
        break;
    }
    return Image.asset(
      iconName,
      width: widget.size,
      fit: BoxFit.contain,
    );
  }
}
