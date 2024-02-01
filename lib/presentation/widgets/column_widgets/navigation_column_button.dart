import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/domain/dto/bottom_menu.dart';

class NavigationColumnButton extends StatelessWidget {
  const NavigationColumnButton({super.key, required this.menu, required this.onTap});

 final BottomMenu menu;
 final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 80,
            // maxWidth: 78.67,
          ),
          color: const Color(0xFFF5F7FA),
          child: Container(
            alignment: Alignment.center, // check on alignment
            constraints: const BoxConstraints(maxHeight: 80, maxWidth: 73),
            decoration: BoxDecoration(
              color: menu.isSelected ? const Color(0xFFBFFF07) : const Color(0xFFF5F7FA),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  menu.iconPath,
                  color: menu.isSelected ? const Color(0xFF29364E) : const Color(0xFF828282),
                ),
                const SizedBox(height: 4),
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
