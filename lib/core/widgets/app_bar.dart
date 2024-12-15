import 'package:checkout_payment_ui/core/utils/app_images.dart';
import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
    leading: Center(
      child: SvgPicture.asset(
        Assets.imagesArrow,
      ),
    ),
  );
}
