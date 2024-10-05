import 'package:domi_labs_assignment/widgets/widget_header.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: const Color(0xff111111),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const WidgetHeader(title: "domi in"),
            SizedBox(
              height: 100,
              child: CarouselView(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  itemExtent: 100,
                  children: List.generate(
                    7,
                    (index) => Image.network(
                        'https://picsum.photos/250?random=$index'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
