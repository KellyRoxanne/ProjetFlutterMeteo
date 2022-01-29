import 'package:appmeteo/api.dart';
import 'package:appmeteo/components/WeatherIcon.dart';
import 'package:appmeteo/gps.dart';
import 'package:appmeteo/views/ExplorerView.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class CurrentCityBox extends StatefulWidget {
  const CurrentCityBox({
    Key? key,
  }) : super(key: key);

  @override
  _CurrentCityBoxState createState() => _CurrentCityBoxState();
}

class _CurrentCityBoxState extends State<CurrentCityBox> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = [
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    ];
    return DelayedDisplay(
      delay: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ville actuelle',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            width: screenSize[0] - 55,
            height: 220,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(231, 243, 250, 1),
              borderRadius: BorderRadius.circular(35),
            ),
            child: FutureBuilder<Map>(
                future: getPositionWeather(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExplorerView(
                                      ville: {
                                        'name': snapshot.data!['name'],
                                        'country': snapshot.data!['sys']['country'],
                                      }
                                    )
                                  )
                                );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot
                                .data!['name'], //Afficher le nom de la ville
                            style: GoogleFonts.poppins(
                              fontSize: 24,
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
                                    snapshot.data!['sys'][
                                        'country'], //Afficher le nom de la ville
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: const Color.fromRGBO(
                                          141, 152, 173, 1),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!['main']['temp']
                                            .round()
                                            .toString() +
                                        '°',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 60,
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
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print("Echec de récupération de la ville actuelle");
                  }
                  //todo: Cercle de chargement
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            color: Color.fromRGBO(0, 23, 95, 1),
                            backgroundColor: Colors.transparent,
                            semanticsLabel: 'Chargement de la météo',
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
