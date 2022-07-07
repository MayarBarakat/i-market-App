import 'package:flutter/material.dart';

import '../../../../shared/component/components.dart';
import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';


class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionsScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth! * 0.7,
            height: 50,
            decoration: BoxDecoration(
                color: kSecondColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'البحث عن منتجات',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionsScreenWidth(20),
                      vertical: getProportionsScreenWidth(9))),
            ),
          ),

          IconButtonWithCounter(
              3,
              onPress: () {},
              icon:Icon( Icons.notifications_active_outlined)
          ),

        ],
      ),
    );
  }
}
