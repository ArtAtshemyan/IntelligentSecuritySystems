import 'package:flutter/material.dart';

import '../../../../common/helpers/utils/password_strength_checker.dart';
import '../../../../generated/l10n.dart';

class PasswordStrength extends StatelessWidget {
  final String password;
  final double strength;

  const PasswordStrength(
      {super.key, required this.password, required this.strength});

  @override
  Widget build(BuildContext context) {
    return password.length >= 6
        ? Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 4.0,
              bottom: 16.0,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Text(
                    S.of(context).passwordStrenght,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 24,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: PasswordStrengthChecker.getStrengthColor(
                              strength),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    PasswordStrengthChecker.getStrengthLabel(strength),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
    ;
  }
}
