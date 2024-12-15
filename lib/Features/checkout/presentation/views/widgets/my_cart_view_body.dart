import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/payment_methods_buttom_sheet.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/total_price.dart';
import 'package:checkout_payment_ui/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset(
              Assets.imagesBasketImage,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            thickness: 2,
            height: 37,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) {
                  return const PaymentMethodsButtomSheet();
                },
              );
            },
            title: 'Complete Payment',
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
