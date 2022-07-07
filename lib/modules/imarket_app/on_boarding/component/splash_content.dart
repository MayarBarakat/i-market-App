import 'package:flutter/material.dart';

import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, this.text, this.image}) : super(key: key);
  final String? text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'I-Market',
          style: TextStyle(
              fontSize: getProportionsScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image!,
          height: getProportionsScreenHeight(264),
          width: getProportionsScreenWidth(235),
        ),
      ],
    );
  }
}
