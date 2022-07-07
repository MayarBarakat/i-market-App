import 'package:flutter/material.dart';

import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';


class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    @required this.icon,
  }) : super(key: key);
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionsScreenWidth(20),
        getProportionsScreenWidth(20),
        getProportionsScreenWidth(20),
      ),
      child: Icon(
        icon,
        color: kPrimaryColor,
        size: getProportionsScreenWidth(25),
      ),
    );
  }
}
