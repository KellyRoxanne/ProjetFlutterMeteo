import 'package:appmeteo/components/CurrentCityBox.dart';
import 'package:appmeteo/views/DevView.dart';
import 'package:appmeteo/views/ExplorerView.dart';
import 'package:appmeteo/api.dart';
import 'package:appmeteo/components/CityCarousel.dart';
import 'package:appmeteo/components/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// Page d'accueil
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
    // Taille de l'écran
    double longueur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    // Affichage
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: largeur,
          height: longueur,
          //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            /*gradient: LinearGradient(colors: [
            Color.fromRGBO(97, 166, 237, 1),
            Color.fromRGBO(83, 116, 232, 1),
            Color.fromRGBO(70, 90, 225, 1),
          ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter,),*/
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              // const SizedBox(height: 10), // Espacement
              // Header
              Header(),
              SizedBox(height: 30), // Espacement
              // ListView
              CityCarousel(),
              SizedBox(height: 20), // Espacement
              // Ville atuelle
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CurrentCityBox(),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Recherche',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work_outlined),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              child: ClipOval(
                child: Image.asset(
                  'assets/img/alex.jpg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            label: 'Devs',
          ),
        ],
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromRGBO(0, 23, 95, 1),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        onTap: (newIndex) {
          //print(newIndex);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DevView()));
        },
      ),
    );
  }
}
