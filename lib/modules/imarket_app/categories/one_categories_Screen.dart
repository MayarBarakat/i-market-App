import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../../models/imarket_app/product_model.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/size_config.dart';
import '../details/details_screen.dart';

class OneCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        List<ProductForBuy> products = cubit.testProduct;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'بقوليات',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.58,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                children:
                List.generate(
                    products.length,
                        (index) =>
                        Padding(
                          padding: EdgeInsets.all(
                              getProportionsScreenWidth(12)),
                          child: productCard(
                            isFavorites: products[index].inFavorites,
                              product: products[index],
                              onLikePress: () {
                                cubit.addFavorites(products[index]);
                              },
                              onPress: () =>
                                  navigateTo(context, DetailsScreen(
                                    product: products[index],
                                    images: [
                                      products[index].image,
                                      'assets/images/d1.png',
                                      'assets/images/d2.png',
                                      'assets/images/d3.png',
                                    ],


                                  ))
                          ),
                        )),
              ),
            ),
          ),
        );
      },

    );
  }


}
