import 'package:flutter/material.dart';

class LayoutCard extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;

  const LayoutCard({
    super.key,
    required this.widget,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 24,
            offset: Offset(0, 8),
            spreadRadius: 6,
          )
        ],
      ),
      child: widget,
    );
  }
}
