import 'package:appmeteo/api.dart';
import 'package:appmeteo/components/WeatherIcon.dart';
import 'package:appmeteo/views/ExplorerView.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityBox extends StatefulWidget {
  final Map city;
  const CityBox({Key? key, required this.city}) : super(key: key);

  @override
  _CityBoxState createState() => _CityBoxState();
}

class _CityBoxState extends State<CityBox> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = [
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    ];
    return DelayedDisplay(
      delay: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExplorerView(ville: widget.city)));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          width: screenSize[0] - 55,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(231, 243, 250, 1),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<Map>(
                future: getCityWeather(cityName: widget.city['name']),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!['name'], //Afficher le nom de la ville
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(141, 152, 173, 1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!['sys']
                                      ['country'], //Afficher le nom de la ville
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(141, 152, 173, 1),
                                  ),
                                ),
                                Text(
                                  snapshot.data!['weather'][0][
                                      'description'], //Afficher le nom de la ville
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(141, 152, 173, 1),
                                  ),
                                ),
                                Text(
                                  snapshot.data!['main']['temp']
                                          .round()
                                          .toString() +
                                      '°',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 74,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(0, 23, 95, 1),
                                  ),
                                ),
                              ],
                            ),
                            WeatherIcon(
                              time: snapshot.data!['weather'][0]['main'],
                              size: screenSize[0] / 3,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: screenSize[0],
                          height: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.solid)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    snapshot.data!['main']['humidity']
                                            .toString() +
                                        '%',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Humidité',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      //fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
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
                                    snapshot.data!['main']['pressure']
                                            .toString() +
                                        ' hPa',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Pression',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      //fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
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
                                    snapshot.data!['wind']['speed'].toString() +
                                        ' m/s',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Vent',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      //fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
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
                                    (snapshot.data!['visibility'] / 1000)
                                            .toString() +
                                        ' Km',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Visibilté',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      //fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    print("Echec de récupération");
                  }
                  //todo: Cercle de chargement
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(0, 23, 95, 1),
                      backgroundColor: Colors.transparent,
                      semanticsLabel: 'Chargement de la météo',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
