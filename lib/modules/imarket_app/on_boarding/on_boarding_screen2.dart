import 'package:flutter/material.dart';

import '../../../shared/component/size_config.dart';
import 'component/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
