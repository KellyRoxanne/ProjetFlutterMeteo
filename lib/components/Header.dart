import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  DateFormat dateFormat = DateFormat.yMMMMd();
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                oo(),
                Text(
                  dateFormat.format(DateTime.now()),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                //await getCityWeather('Londres');
              },
              child: CircleAvatar(
                radius: 25,
                child: ClipOval(
                  child: Image.asset(
                    'assets/img/alex.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget oo() {
    var now = new DateTime.now();
    var formatter = new DateFormat('HH:mm');

    String formattedDate = formatter.format(now);
    print(formattedDate);
    if (formattedDate.compareTo('13:00') < 0 &&
        formattedDate.compareTo('06:00') > 0) {
      return Text(
        'Bonjour',
        style: GoogleFonts.poppins(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        'Bonsoir',
        style: GoogleFonts.poppins(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
