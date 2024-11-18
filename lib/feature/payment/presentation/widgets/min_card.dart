import 'package:flutter/material.dart';

class MinCard extends StatelessWidget {
  final String cardName;
  final IconData cardIcon;

  const MinCard({
    super.key,
    required this.cardName,
    required this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0x0C49454F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(cardIcon),
          const SizedBox(width: 8),
          Text(
            cardName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF49454F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.10,
            ),
          ),
        ],
      ),
    );
  }
}
