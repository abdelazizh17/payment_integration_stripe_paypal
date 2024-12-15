import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 28,
            right: 28,
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: CustomCheckIcon(),
          )
        ],
      ),
    );
  }
}
