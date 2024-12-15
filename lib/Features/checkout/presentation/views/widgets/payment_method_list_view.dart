import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});
  static List<String> paymentMethodItem = [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: PaymentMethodListView.paymentMethodItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: PaymentMethodListView.paymentMethodItem[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
