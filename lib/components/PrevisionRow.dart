import 'package:appmeteo/components/WeatherIcon.dart';
import 'package:appmeteo/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PrevisionRow extends StatefulWidget {
  final Map previsions;
  const PrevisionRow({
    Key? key,
    required this.previsions,
  }) : super(key: key);

  @override
  _PrevisionRowState createState() => _PrevisionRowState();
}

class _PrevisionRowState extends State<PrevisionRow> {
  DateFormat dateFormat = DateFormat.MMMMd();
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = getScreenSize(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color.fromRGBO(97, 166, 237, 0.2),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white,
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                WeatherIcon(time: widget.previsions['weather'][0]['main']),

              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: screenSize[0] / 1.7,
          height: 80,
          decoration: BoxDecoration(
            //color: Colors.red,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.previsions['main']['temp'].round().toString() + "°",
                style: GoogleFonts.montserrat(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(0, 23, 95, 1),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.EEEE().format(DateTime.parse(widget.previsions['dt_txt'])),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(widget.previsions['dt_txt'])),
                    style: GoogleFonts.poppins(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
