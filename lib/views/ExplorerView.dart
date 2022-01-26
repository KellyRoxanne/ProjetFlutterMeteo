import 'package:appmeteo/api.dart';
import 'package:appmeteo/components/PrevisionsLayout.dart';
import 'package:appmeteo/components/WeatherInfoLayout.dart';
import 'package:appmeteo/functions.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Page d'accueil
class ExplorerView extends StatefulWidget {
  final Map ville;
  const ExplorerView({Key? key, required this.ville}) : super(key: key);

  @override
  ExplorerViewState createState() => ExplorerViewState();
}

class ExplorerViewState extends State<ExplorerView> {
  PageController pageController = PageController(viewportFraction: 1);

  @override
  void dispose() {
    // TODO: implement dispose
    // Changer les propriétés systèmes
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent, //Color.fromRGBO(97, 166, 237, 1),
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Changer les propriétés systèmes
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent, //Color.fromRGBO(97, 166, 237, 1),
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    List<double> screenSize = getScreenSize(context);
    // Affichage
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize[0],
            //height: screenSize[1],
            //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
              //color: Colors.white,
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(97, 166, 237, 1),
                  Color.fromRGBO(83, 116, 232, 1),
                  Color.fromRGBO(70, 90, 225, 1),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Nom de la ville
                          Text(
                            widget.ville['name'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          // Nom du pays
                          Text(
                            widget.ville['country'],
                            style: GoogleFonts.poppins(
                              //fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Espacement
                      FutureBuilder<Map>(
                          future:
                              getCityWeather(cityName: widget.ville['name']),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: screenSize[0],
                                    height: screenSize[1] / 1.2,
                                    child: PageView(
                                      pageSnapping: true,
                                      controller: pageController,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        // Infos de la météo
                                        WeatherInfoLayout(
                                            weatherDatas: snapshot.data!),
                                        // Prévisions
                                        PrevisionsLayout(
                                            weatherDatas: snapshot.data!),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              print('Echec de chargement');
                              return Text('Echec de chargement');
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
                          }),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color.fromRGBO(83, 116, 232, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
