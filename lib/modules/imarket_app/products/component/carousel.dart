import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> data = [
      'assets/images/onboarding_1.png',
      'assets/images/banner1.png',
      'assets/images/banner2.png',
      'assets/images/onboarding_1.png',
    ];
    return Padding(
      padding:  EdgeInsets.all(getProportionsScreenWidth(12)),
      child: Column(
        children: [
          CarouselSlider(
            items: data
                .map(
                  (e) => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Image(
                  image: AssetImage(e),
                  width: double.infinity,
                  fit: BoxFit.cover,

                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
//                        cubit.changeActiveDot(index);
                },
                pauseAutoPlayOnTouch: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 600)),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: getProportionsScreenWidth(12)),
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: 2,
                count: data.length,
                effect:  WormEffect(
                    activeDotColor: kPrimaryColor,
                    dotColor: Colors.black12,
                    dotHeight: 12,
                    dotWidth: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
