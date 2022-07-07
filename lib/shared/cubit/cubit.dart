import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/order_model.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/models/imarket_app/user_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_order_model.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/modules/imarket_app/register/register_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../layout/imarket_app/shop_layout.dart';
import '../../modules/imarket_app/categories/categories_screen.dart';
import '../../modules/imarket_app/favorites/favorites_screen.dart';
import '../../modules/imarket_app/products/products_screen.dart';
import '../../modules/imarket_app/salla/salla_screen.dart';
import '../../modules/imarket_app/settings/settings_screen.dart';
import '../component/constants.dart';
import '../network/local/cache_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

   late int priceOfAllProduct = 0;

  List<Widget> bottomScreen = [
    ProductScreen(),
    FavoritesScreen(),
    SallaScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];



  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopLayoutChangeBottomState());
  }
  int activeIndex = 0;
  void changeActiveDot(int index) {
    activeIndex = index;
    emit(ShopLayoutChangeActiveDotState());
  }


  void deleteUser(){
    CacheHelper.removeData(key: 'wholesalerRegister');
     testProduct = CacheHelper.getData(key: 'wholesalerRegister')==null?[
      ProductForBuy(
        1,
        'قبضة',
        6000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false,
      ),
      ProductForBuy(
        2,
        'شورت',
        3750,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false,
      ),
      ProductForBuy(
          3,
          'قبضة',
          10000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          4,
          'شورت',
          4500,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          5,
          'قبضة',
          1500,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          6,
          'شورت',
          2000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          7,
          'قبضة',
          3000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          8,
          'شورت',
          1000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          9,
          'قبضة',
          8000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          10,
          'شورت',
          7000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          11,
          'قبضة',
          9000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          12,
          'شورت',
          12000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
    ]:
    [
      ProductForBuy(
        1,
        'قبضة',
        12000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false,
      ),
      ProductForBuy(
        2,
        'شورت',
        7500,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false,
      ),
      ProductForBuy(
          3,
          'قبضة',
          20000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          4,
          'شورت',
          9000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          5,
          'قبضة',
          3000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          6,
          'شورت',
          4000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          7,
          'قبضة',
          6000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          8,
          'شورت',
          2000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          9,
          'قبضة',
          16000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          10,
          'شورت',
          14000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          11,
          'قبضة',
          18000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
      ProductForBuy(
          12,
          'شورت',
          24000,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false
      ),
    ];
    emit(DeleteWholesalerUserFromShopState());
  }
  List<ProductForBuy> testProduct = CacheHelper.getData(key: 'wholesalerRegister')==null?[
    ProductForBuy(
        1,
        'قبضة',
        6000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false,
    ),
    ProductForBuy(
      2,
      'شورت',
      3750,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false,
    ),
    ProductForBuy(
      3,
      'قبضة',
      10000,
      0,
      'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      4,
      'شورت',
      4500,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      5,
      'قبضة',
      1500,
      0,
      'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      6,
      'شورت',
      2000,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      7,
      'قبضة',
      3000,
      0,
      'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      8,
      'شورت',
      1000,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      9,
      'قبضة',
      8000,
      0,
      'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      10,
      'شورت',
      7000,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      11,
      'قبضة',
      9000,
      0,
      'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
    ProductForBuy(
      12,
      'شورت',
      12000,
      0,
      'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
      false
    ),
  ]:
  [
    ProductForBuy(
      1,
      'قبضة',
      12000,
      0,
      'assets/images/product1.png',
      'لمنتج الأول في جرمانا لمنتج '
          'الأول في جرمانا لمنتج الأول في جرمانا '
          'لمنتج الأول في جرمانا لمنتج الأول في '
          'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
          'المنتج '
          'الأول في جرمانا',
      false,
    ),
    ProductForBuy(
      2,
      'شورت',
      7500,
      0,
      'assets/images/product2.png',
      'لمنتج الأول في جرمانا لمنتج '
          'الأول في جرمانا لمنتج الأول في جرمانا '
          'لمنتج الأول في جرمانا لمنتج الأول في '
          'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
          'المنتج '
          'الأول في جرمانا',
      false,
    ),
    ProductForBuy(
        3,
        'قبضة',
        20000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        4,
        'شورت',
        9000,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        5,
        'قبضة',
        3000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        6,
        'شورت',
        4000,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        7,
        'قبضة',
        6000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        8,
        'شورت',
        2000,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        9,
        'قبضة',
        16000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        10,
        'شورت',
        14000,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        11,
        'قبضة',
        18000,
        0,
        'assets/images/product1.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
    ProductForBuy(
        12,
        'شورت',
        24000,
        0,
        'assets/images/product2.png',
        'لمنتج الأول في جرمانا لمنتج '
            'الأول في جرمانا لمنتج الأول في جرمانا '
            'لمنتج الأول في جرمانا لمنتج الأول في '
            'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
            'المنتج '
            'الأول في جرمانا',
        false
    ),
  ];


  void loading(){
    emit(LoadingState());
  }

 late List<ProductForBuy> products = [];
  void addProduct(ProductForBuy product) {
    bool isContain = false;
    products.forEach((element) {
      if (element.id == product.id) {
        isContain = true;
        showToast(msg: 'المنتج موجود مسبقاً', state: ToastStates.WARNING);
      }
    });
    if (isContain == false) {
      products.add(product);
      priceOfAllProduct = 0;
      products.forEach((element) {
        priceOfAllProduct += (element.pricePerProduct * element
            .numberOfProduct);
      });
      showToast(
          msg: 'تمت اضافة المنتج بنجاح',
          state: ToastStates.SUCCESS
      );
      emit(AddProductState());
    }
  }

  void plusProduct(ProductForBuy product){
    product.numberOfProduct++;
    priceOfAllProduct = 0;
    products.forEach((element) {
      priceOfAllProduct += element.numberOfProduct * element.pricePerProduct;
    });

    emit(PlusProductState());
  }
  void deleteProduct(ProductForBuy product){
    products.remove(product);
    priceOfAllProduct = 0;

    products.forEach((element) {
      priceOfAllProduct += (element.pricePerProduct * element
          .numberOfProduct);
    });
    emit(DeleteProductState());
  }

  bool isFromCreate = false;
  void openRegisterDialog(context){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('يرجى إنشاء حساب لإتمام عملية الشراء',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  isFromCreate = true;
                  navigateTo(context, RegisterScreen(false));
                },
                child: Text('انشاء حساب',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('الغاء',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
          ],
        )
    );
  }


  Future openDialog(context,product)async{
   await showDialog(
     barrierDismissible: false,
        context: context,
        builder: (context)=>AlertDialog(
          title: Text(' حذف المنتج',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  deleteProduct(product);
                  Navigator.of(context).pop();
                },
                child: Text('حذف',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
            TextButton(
                onPressed: (){
                  product.numberOfProduct++;
                  priceOfAllProduct = 0;
                  products.forEach((element) {
                    priceOfAllProduct += element.numberOfProduct * element.pricePerProduct;
                  });

                  emit(MinusProductState());
                  Navigator.of(context).pop();

                },
                child: Text('الغاء',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
          ],
        )
    );
  }
  void minusProduct(ProductForBuy product,context){


    if(product.numberOfProduct>0){
      product.numberOfProduct--;
      if(product.numberOfProduct == 0){
        openDialog(context, product);
      }
      priceOfAllProduct = 0;
      products.forEach((element) {
        priceOfAllProduct += element.numberOfProduct * element.pricePerProduct;
      });
      print(priceOfAllProduct);

    }

    emit(MinusProductState());

  }

  List<OrdersModel> orders = [];
  List<WholesalerOrdersModel> wholesalerOrders = [];
  void buy({
  required String history,
    required String time,
    required List<ProductForBuy> productsBuying,
    required UserModel user,
    required int priceOfAllProducts,
}){
    products = [];
    priceOfAllProduct = 0;
    orders.add(OrdersModel(history, time, productsBuying, user,priceOfAllProducts));


    emit(AddOrderState());
  }
  void buyFromWholesaler({
    required String history,
    required String time,
    required List<ProductForBuy> productsBuying,
    required WholesalerModel wholesalerModel,
    required int priceOfAllProducts,
  }){
    products = [];
    priceOfAllProduct = 0;
    wholesalerOrders.add(WholesalerOrdersModel(history, time, productsBuying, wholesalerModel,
        priceOfAllProducts));


    emit(AddWholesalerOrderState());
  }
  //TODO ADD HOME MODEL
//  HomeModel homeModel;

  void getHomeData() async {
    emit(ShopLoadingHomeDataState());

    //TODO ADD PARAMS HERE
   /** await DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
    });**/
  }

    //TODO add categoriesModel here
//  CategoriesModel categoriesModel;
  void getCategoriesData() async {
    emit(ShopLoadingHomeDataState());

    //TODO ADD PARAMS HERE
    /**
    await DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState(error.toString()));
    });**/
  }

    //TODO add ChangeFavoritesModel here

//    ChangeFavoritesModel changeFavoritesModel;
 late Map<int, bool> favorites = {};
  void addFavorites(ProductForBuy product){
    testProduct.forEach((element) {
      if(element.id == product.id){
        element.inFavorites = !element.inFavorites;
      }
    });
    emit(ChangeFavoritesState());
  }


    //TODO ADD PARAMS HERE

   /** favorites[productId] = !favorites[productId];
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);



      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavoritesData();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      print(error.toString());
      favorites[productId] = !favorites[productId];
      emit(ShopErrorChangeFavoritesState(error.toString()));
    }); **/
  }

  //TODO Add FavoritesModel here
//  FavoritesModel favoritesModel;

  void getFavoritesData() async {

      //TODO Add Params here
    /**
    emit(ShopLoadingGetFavoritesState());

    await DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState(error.toString()));
    });**/
  }

  //TODO Add ShopLoginModel Here
//  ShopLoginModel userModel;
  void getUserData() async {

      //TODO Add Params Here
  /**  emit(ShopLoadingUserDataState());

    await DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel.data.name);
      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState(error.toString()));
    }); **/
  }

  //TODO add Params
 /** void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(ShopLoadingUpdateUserState());

    await DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel.data.name);
      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState(error.toString()));
    });
  }**/

    //TODO Add SearchModel Here
//  SearchModel model;

    //TODO Add Params Here
  /**void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text
      },
    ).then((value){
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }**/
