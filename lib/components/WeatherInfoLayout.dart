import 'package:appmeteo/api.dart';
import 'package:appmeteo/components/WeatherIcon.dart';
import 'package:appmeteo/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WeatherInfoLayout extends StatefulWidget {
  final Map weatherDatas;
  const WeatherInfoLayout({
    Key? key,
    required this.weatherDatas,
  }) : super(key: key);

  @override
  _WeatherInfoLayoutState createState() => _WeatherInfoLayoutState();
}

class _WeatherInfoLayoutState extends State<WeatherInfoLayout> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // Temperature
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.1),
                  ],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  widget.weatherDatas['main']['temp'].round().toString() + "°",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 150,
                    color: Colors.white,
                  ),
                ),
              ),
              WeatherIcon(
                time: widget.weatherDatas['weather'][0]['main'],
                size: screenSize[0] / 1.7,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Plus d'infos
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: screenSize[0],
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: screenSize[0] / 5,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(70, 90, 225, 0.3))),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Humidité
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/flat-icons/humidity.png',
                          width: 25,
                          fit: BoxFit.contain,
                          color: const Color.fromRGBO(0, 23, 95, 1),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.weatherDatas['main']['humidity'].toString() + '%',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 23, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Humidité',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            //fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 23, 95, 1),
                          ),
                        ),
                      ],
                    ),
                    // Pression atmo
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/flat-icons/speedometer.png',
                          width: 25,
                          fit: BoxFit.contain,
                          color: const Color.fromRGBO(0, 23, 95, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.weatherDatas['main']['pressure'].toString() +
                              ' hPa',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 23, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Pression',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            //fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(141, 152, 173, 1),
                          ),
                        ),
                      ],
                    ),
                    // Vitesse du vent
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/flat-icons/wind.png',
                          width: 25,
                          fit: BoxFit.contain,
                          color: const Color.fromRGBO(0, 23, 95, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.weatherDatas['wind']['speed'].toString() + ' m/s',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 23, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Vent',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            //fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(141, 152, 173, 1),
                          ),
                        ),
                      ],
                    ),
                    // Vitesse visibilité
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromRGBO(0, 23, 95, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          (widget.weatherDatas['visibility'] / 1000).toString() +
                              ' Km',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 23, 95, 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Visibilté',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            //fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(141, 152, 173, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder<Map>(
            future: getCityForecast(cityName: widget.weatherDatas['name']),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
            return SizedBox(
              height: 140,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.j().format(DateTime.parse(
                                    snapshot.data!['list'][index]['dt_txt'])),
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          WeatherIcon(time: snapshot.data!['list'][index]['weather'][0]['main']),
                          const SizedBox(height: 5),
                          Text(
                            snapshot.data!['list'][index]['main']['temp']
                                        .round()
                                        .toString() +
                                    "°",
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemCount: 5),
            );
              } else if (snapshot.hasError) {
                print('Echec de chargement');
                return const Text('Echec de chargement');
              }
              //todo: Cercle de chargement
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        semanticsLabel: 'Chargement de la météo',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
