import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/modules/imarket_app/categories/one_categories_Screen.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/size_config.dart';
import '../details/details_screen.dart';
import 'component/carousel.dart';
import 'component/categories.dart';
import 'component/home_header.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var cubit = ShopCubit.get(context);

    List<ProductForBuy> products = cubit.testProduct;

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionsScreenWidth(20),
                ),
                HomeHeader(),
                SizedBox(
                  height: getProportionsScreenWidth(10),
                ),
                Carousel(),
                Categories(
                  title: 'الأصناف',
                  image: 'assets/images/banner1.png',
                  name: 'بقوليات',
                  numberOfProduct: 20,
                  onClick: () {
                    navigateTo(context, OneCategoriesScreen());
                  },
                  onTextPress: () {},
                ),
                SizedBox(
                  height: getProportionsScreenWidth(30),
                ),
                titleWithMore(text: 'الأكثر مبيعاً', onPressed: () {}),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionsScreenWidth(12)),
                  height: getProportionsScreenWidth(250),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => productCard(
                          isFavorites: products[index].inFavorites,
                          product: products[index],
                          onLikePress: () {
                            cubit.addFavorites(products[index]);
                          },
                          onPress: () => navigateTo(
                              context,
                              DetailsScreen(
                                product: products[index],
                                images: [
                                  products[index].image,
                                  'assets/images/d1.png',
                                  'assets/images/d2.png',
                                  'assets/images/d3.png',
                                ],
                              ))),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemCount: products.length),
                ),
                titleWithMore(text: 'جديدنا', onPressed: () {}),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionsScreenWidth(12)),
                  height: getProportionsScreenWidth(250),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => productCard(
                          isFavorites: products[index].inFavorites,
                          product: products[index],
                          onLikePress: () {
                            cubit.addFavorites(products[index]);
                          },
                          onPress: () => navigateTo(
                              context,
                              DetailsScreen(
                                product: products[index],
                                images: [
                                  products[index].image,
                                  'assets/images/d1.png',
                                  'assets/images/d2.png',
                                  'assets/images/d3.png',
                                ],
                              ))),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemCount: products.length),
                ),
                titleWithMore(text: 'منتجاتنا', onPressed: () {}),
                GridView.count(
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.58,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      products.length,
                      (index) => Padding(
                            padding:
                                EdgeInsets.all(getProportionsScreenWidth(12)),
                            child: productCard(
                                isFavorites: products[index].inFavorites,
                                product: products[index],
                                onLikePress: () {
                                  cubit.addFavorites(products[index]);
                                },
                                onPress: () => navigateTo(
                                    context,
                                    DetailsScreen(
                                      product: products[index],
                                      images: [
                                        products[index].image,
                                        'assets/images/d1.png',
                                        'assets/images/d2.png',
                                        'assets/images/d3.png',
                                      ],
                                    ))),
                          )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
