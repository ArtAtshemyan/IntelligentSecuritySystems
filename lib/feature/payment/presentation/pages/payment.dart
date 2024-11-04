import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final String? token;
  const PaymentPage({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
    );
  }
}
