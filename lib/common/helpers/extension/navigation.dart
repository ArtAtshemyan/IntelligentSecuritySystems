import 'package:flutter/cupertino.dart';

extension NavigationExtension on BuildContext {
  Future<void> navigateTo(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }
}
