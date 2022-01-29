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
class DevView extends StatefulWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  DevViewState createState() => DevViewState();
}

class DevViewState extends State<DevView> {
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
          Container(
            margin: EdgeInsets.only(top: 25, left: 75),
            child: Text(
              'LISTE DES DEVELOPPEURS',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/alex.jpg'),
                  ),
                  title: Text(
                    'TAHI Ezan Alexandre',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/kelly.jpg'),
                  ),
                  title: Text(
                    'TOKPA Grace Kelly',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/diane.jpg'),
                  ),
                  title: Text(
                    'DIANE Cheick Adama',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/mouki.jpg'),
                  ),
                  title: Text(
                    'KONE Moustapha',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
