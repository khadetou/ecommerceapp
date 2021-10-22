import 'package:flutter/material.dart';

class BuildFb extends StatelessWidget {
  const BuildFb({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    const double defaultTopMargin = 200.0 - 4.0;

    const double scaleStart = 160.0;
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;

      top -= offset;

      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
