import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final String iconPath; // Changed from IconData to String for SVG path
  final String label;
  final bool isSelected;
  final bool useIsicBadge;
  final double iconSize;
  final VoidCallback? onTap;

  const BottomNavItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.isSelected = false,
    this.useIsicBadge = false,
    this.iconSize = 20,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF1E88E5) : Colors.grey[600];

    return InkWell(
      onTap: onTap ?? () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: 42,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 22, // Fixed height for icon area
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  color: color,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
