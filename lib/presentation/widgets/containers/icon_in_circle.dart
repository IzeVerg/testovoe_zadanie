import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconInCircle extends StatelessWidget {
  const IconInCircle({
    super.key,
    required this.color,
    required this.image,
    this.border = 100,
  });

  final Color color;
  final String image;
  final double border;

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(border),
          ),
        ),
        child: SvgPicture.asset(image),
      );
}
