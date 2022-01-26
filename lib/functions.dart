import 'package:flutter/material.dart';

List<double> getScreenSize(var context) {
  return [
    MediaQuery.of(context).size.width, // largeur de l'écran
    MediaQuery.of(context).size.height, // hauteur de l'écran
  ];
}
