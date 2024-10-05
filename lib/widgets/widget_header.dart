import 'package:flutter/material.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  const WidgetHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
