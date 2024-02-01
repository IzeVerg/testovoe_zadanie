import 'package:flutter/material.dart';
import 'package:test_project/domain/dto/up_menu.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({super.key, required this.element, required this.onTap});

  final UpMenu element;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 88,
          ),
          decoration: BoxDecoration(
            color: element.isSelected ? const Color(0xFFBFFF07) : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: Text(
            element.title,
            style: TextStyle(
              color: element.isSelected ? const Color(0xFF29364E) : const Color(0xFF8693A3),
            ),
          ),
        ),
      );
}
