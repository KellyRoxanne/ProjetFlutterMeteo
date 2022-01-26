import 'package:appmeteo/components/PrevisionRow.dart';
import 'package:appmeteo/components/WeatherIcon.dart';
import 'package:appmeteo/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appmeteo/api.dart';

class PrevisionsLayout extends StatefulWidget {
  final Map weatherDatas;
  const PrevisionsLayout({
    Key? key,
    required this.weatherDatas,
  }) : super(key: key);

  @override
  _PrevisionsLayoutState createState() => _PrevisionsLayoutState();
}

class _PrevisionsLayoutState extends State<PrevisionsLayout> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeatherIcon(
                    time: widget.weatherDatas['weather'][0]['main'],
                    size: screenSize[0] / 3,
                    ),
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
                      widget.weatherDatas['main']['temp'].round().toString() +
                          "°",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Plus d'infos
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: screenSize[0],
            height: screenSize[1] / 1.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: screenSize[0] / 5,
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(83, 116, 232, 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Prévisions",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                FutureBuilder<Map>(
                  future: getCityForecast(cityName: widget.weatherDatas['name']),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Prévisions
                      return SizedBox(
                        height: screenSize[1] / 2,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder:(context, index) => const SizedBox(height: 15),
                          itemCount: snapshot.data!['list'].length,
                          itemBuilder: (context, index) => PrevisionRow(
                            previsions: snapshot.data!['list'][index],
                          ),
                        ),
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
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
