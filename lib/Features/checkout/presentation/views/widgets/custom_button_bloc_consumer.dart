import 'dart:developer';

import 'package:checkout_payment_ui/Features/checkout/data/models/amount/amount.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/amount/details.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/Features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentCubit>(context);
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop;
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: 'cus_RkQsLDnzzBPEzq');
            // paymentCubit.makePayment(
            //     paymentIntentInputModel: paymentIntentInputModel);

            var transactionData = getTransactionData();

            excuetePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }

  void excuetePaypalPayment(BuildContext context,
      ({Amount amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({Amount amount, ItemListModel itemList}) getTransactionData() {
    var amount = Amount(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", subtotal: '100', shippingDiscount: 0),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        quantity: 10,
        price: "4",
        currency: "USD",
      ),
      OrderItemModel(
        name: "Apple",
        quantity: 12,
        price: "5",
        currency: "USD",
      )
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
