import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/payment_details_view_body.dart';
import 'package:checkout_payment_ui/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'Payment Details'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
