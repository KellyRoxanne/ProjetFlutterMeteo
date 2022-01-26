import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final int pageIndex;
  const PageIndicator({Key? key, required this.pageIndex,}) : super(key: key);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              fadingDuration: const Duration(milliseconds: 500),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: (widget.pageIndex == 0)
                  ? const Color.fromRGBO(0, 23, 95, 1)
                  : const Color.fromRGBO(231, 243, 250, 1),
              ),
            ),
            const SizedBox(width: 5),
            DelayedDisplay(
          fadingDuration: const Duration(milliseconds: 500),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: (widget.pageIndex == 1)
                ? const Color.fromRGBO(0, 23, 95, 1)
                : const Color.fromRGBO(231, 243, 250, 1),
          ),
        ),
        const SizedBox(width: 5),
        DelayedDisplay(
          fadingDuration: const Duration(milliseconds: 500),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: (widget.pageIndex == 2)
                ? const Color.fromRGBO(0, 23, 95, 1)
                : const Color.fromRGBO(231, 243, 250, 1),
          ),
        ),
          ],
        );
  }
}
