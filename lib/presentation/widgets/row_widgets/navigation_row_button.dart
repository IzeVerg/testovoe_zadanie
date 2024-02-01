import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/domain/dto/bottom_menu.dart';

class NavigationRowButton extends StatelessWidget {
  const NavigationRowButton({super.key, required this.menu, required this.onTap});

  final BottomMenu menu;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxHeight: 80),
          color: const Color(0xFFF5F7FA),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: const BoxConstraints(maxHeight: 40),
            decoration: BoxDecoration(
              color: menu.isSelected ? const Color(0xFFBFFF07) : const Color(0xFFF5F7FA),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  menu.iconPath,
                  color: menu.isSelected ? const Color(0xFF29364E) : const Color(0xFF828282),
                ),
                const SizedBox(width: 4),
                Text(
                  menu.text,
                  style: TextStyle(
                    color: menu.isSelected ? const Color(0xFF29364E) : const Color(0xFF8693A3),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
