import 'package:checkout_payment_ui/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCartView(),
    );
  }
}

// 1 -  PaymentIntentObject create payment intent (amount,currency)
// 2 - init payment sheet (paymentIntentClientSecret)
// 3 - presentPaymentSheet()
