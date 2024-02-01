import 'package:flutter/material.dart';
import 'package:test_project/domain/dto/item_model.dart';
import 'package:test_project/presentation/widgets/containers/icon_in_circle.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.model,
  });

  final ItemModel model;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: <Widget>[
            IconInCircle(color: Colors.white, image: model.inputIcon),
            const Spacer(flex: 525),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  model.number,
                  style: const TextStyle(color: Color(0xFF29364E), fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  model.region,
                  style: const TextStyle(color: Color(0xFF8693A3), fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            const Spacer(flex: 4200),
            TextInCircle(width: model.widthForFirstCircle, text: model.textInFirstCircle),
            const Spacer(flex: 525),
            TextInCircle(width: model.widthForSecondCircle, text: model.textInSecondCircle),
          ],
        ),
      );
}

class TextInCircle extends StatelessWidget {
  const TextInCircle({
    super.key,
    this.height = 36,
    required this.width,
    required this.text,
  });

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: const Color(0xFFD4D9E0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFF29364E), fontWeight: FontWeight.w600, fontSize: 11),
        ),
      );
}
