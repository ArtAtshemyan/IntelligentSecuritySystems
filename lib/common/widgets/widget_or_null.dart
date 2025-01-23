import 'package:flutter/material.dart';

class WidgetOrNull extends StatelessWidget {
  final bool status;
  final Widget showWidget;
  final Widget? hideWidget;
  const WidgetOrNull({
    super.key,
    required this.status,
    required this.showWidget,
    this.hideWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 100),
      firstChild:
          showWidget,
      secondChild:
          hideWidget??const SizedBox(),
      crossFadeState:
          status ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
