import 'package:flutter/material.dart';
import 'package:imarket_app/layout/imarket_app/shop_layout.dart';
import 'package:imarket_app/modules/imarket_app/on_boarding/component/splash_content.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../shared/component/components.dart';
import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../register/register_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLast = false;
  Permission? permission;
  PermissionStatus permissionStatus = PermissionStatus.denied;
  void listenForPermission() async {
    final status = await Permission.storage.status;
    setState(() {
      permissionStatus = status;
    });
    switch (status) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;
      case PermissionStatus.limited:
        Navigator.pop(context);
        break;
      case PermissionStatus.restricted:
        Navigator.pop(context);
        break;
      case PermissionStatus.permanentlyDenied:
        Navigator.pop(context);
        break;
    }
  }

  Future<void> requestForPermission() async {
    final status = await Permission.storage.request();
    permissionStatus = status;
  }

  @override
  void initState() {
    listenForPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

    List<Map<String, String>> splashData = [
      {
        "text": 'أهلا بكم في التطبيق الأول في جرمانا للتسوق',
        'image': 'assets/images/splash_1.png'
      },
      {
        "text": 'طريقك الأفضل نحو التوفير\n كلشي بتلاقي عنا',
        'image': 'assets/images/splash_2.png'
      },
      {
        "text": 'الطريقة الأسهل للتسوق \nخليك بالبيت وطلبك عنا',
        'image': 'assets/images/splash_3.png'
      }
    ];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == 2) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: boardController,
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]['text'],
                    image: splashData[index]['image'],
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionsScreenWidth(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: buildSmoothIndicator(boardController, splashData),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    buildDefaultButton(
                      register: true,
                      text: 'متابعة',
                      function: () {
                        if (isLast) {
                          submit();
                        } else {
                          boardController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      height:   56,

                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSmoothIndicator(
      PageController boardController, List<Map<String, String>> splashData) {
    return SmoothPageIndicator(
      controller: boardController,
      count: splashData.length,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        dotHeight: 10.0,
        expansionFactor: 4,
        dotWidth: 10,
        spacing: 5.0,
        activeDotColor: kPrimaryColor,
      ),
    );
  }

  void submit() {
    if (permissionStatus == PermissionStatus.denied) {
      listenForPermission();
    }
    else {
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        navigateAndFinish(context, ShopLayout());
      });
    }
  }
}
