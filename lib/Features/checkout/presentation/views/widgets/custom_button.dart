import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(
            Color(0xFF34A853),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style22,
        ),
      ),
    );
  }
}
