import 'package:appmeteo/components/CItyBox.dart';
import 'package:appmeteo/components/PageIndicator.dart';
import 'package:flutter/material.dart';

class CityCarousel extends StatefulWidget {
  const CityCarousel({Key? key}) : super(key: key);

  @override
  _CityCarouselState createState() => _CityCarouselState();
}

class _CityCarouselState extends State<CityCarousel> {
  int pageIndex = 0;
  PageController pageController = PageController(viewportFraction: 0.9);
  List villes = [
    {
      'name': 'Abidjan',
      'country': "Côte d'Ivoire",
      'temp': 37,
      'humidity': 30,
      'pressure': 1014,
      'wind': 4.6
    },
    {
      'name': 'Bruxelles',
      'country': "Belgique",
      'temp': 23,
      'humidity': 30,
      'pressure': 1014,
      'wind': 4.6
    },
    {
      'name': 'Paris',
      'country': "France",
      'temp': 17,
      'humidity': 30,
      'pressure': 1014,
      'wind': 4.6
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            pageSnapping: true,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: villes.length,
            onPageChanged: (newIndex) {
              setState(() {
                pageIndex = newIndex;
              });
            },
            itemBuilder: (context, index) {
              return Center(child: CityBox(city: villes[index]));
            },
          ),
        ),
        const SizedBox(height: 10),
        // Page Indicator
        PageIndicator(pageIndex: pageIndex),
      ],
    );
  }
}
