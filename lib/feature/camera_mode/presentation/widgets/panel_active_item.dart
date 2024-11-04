import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class PanelActiveItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const PanelActiveItem({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            title == S.current.open ? S.of(context).opened : title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 0.13,
              letterSpacing: 0.50,
            ),
          ),
        ],
      ),
    );
  }
}
