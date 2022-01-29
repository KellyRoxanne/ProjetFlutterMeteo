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
            CircleAvatar(
              radius: 5,
              backgroundColor: (widget.pageIndex == 0)
                ? const Color.fromRGBO(0, 23, 95, 1)
                : const Color.fromRGBO(231, 243, 250, 1),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 5,
              backgroundColor: (widget.pageIndex == 1)
                ? const Color.fromRGBO(0, 23, 95, 1)
                : const Color.fromRGBO(231, 243, 250, 1),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 5,
              backgroundColor: (widget.pageIndex == 2)
                ? const Color.fromRGBO(0, 23, 95, 1)
                : const Color.fromRGBO(231, 243, 250, 1),
            ),
          ],
        );
  }
}
