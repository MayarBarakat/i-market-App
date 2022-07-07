import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/modules/imarket_app/details/details_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var products = cubit.testProduct;
        List<ProductForBuy> favorites = [];
        products.forEach((element) {
          if (element.inFavorites) {
            favorites.add(element);
          }
        });
        return Container(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    'المفضلة',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) =>
                          buildFavoritesList(favorites[index],context),
                      separatorBuilder: (ctx, index) => Container(
                            child: SizedBox(
                              height: 12,
                            ),
                          ),
                      itemCount: favorites.length),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildFavoritesList(ProductForBuy product,context) {
    var cubit = ShopCubit.get(context);
    return Dismissible(
        key: Key(product.id.toString()),
        onDismissed: (direction){
          cubit.addFavorites(product);
        },
        child: GestureDetector(
          onTap: (){
            navigateTo(context, DetailsScreen(
                product: product,
                images: [
                  product.image,
                  'assets/images/d1.png',
                  'assets/images/d2.png',
                  'assets/images/d3.png'
                ],

            ));
          },
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            product.name,
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              height: 1.3,
                            ),
                          ),
                          const Text(
                            'وصف المنتج ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 1.3,
                            ),
                          ),
                          Spacer(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  product.pricePerProduct.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: kPrimaryColor),
                                ),
                                Text(
                                  ': سعر القطعة ',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionsScreenWidth(88),
                    height: getProportionsScreenWidth(150),
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(product.image),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Spacer(
              ),
              Icon(
                Icons.delete_outline,
                size: 40,
              ),
            ],
          ),
        ),
        );
  }
}
