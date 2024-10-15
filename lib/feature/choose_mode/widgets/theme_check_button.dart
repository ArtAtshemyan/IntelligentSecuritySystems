import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeCheckButton extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String buttonDescription;
  final Color color;

  const ThemeCheckButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.buttonDescription,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            buttonDescription,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.0,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
