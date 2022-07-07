import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/order_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_order_model.dart';
import 'package:imarket_app/modules/imarket_app/orders/order_details_screen.dart';
import 'package:imarket_app/modules/imarket_app/orders/wholesaler_order_details.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:imarket_app/shared/component/size_config.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';

class OrdersScreen extends StatelessWidget {
  bool isWholesaler = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        if(CacheHelper.getData(key: 'wholesalerRegister') != null){
          isWholesaler = CacheHelper.getData(key: 'wholesalerRegister');
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'الطلبات',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:isWholesaler?
              List.generate(cubit.wholesalerOrders.length,
                    (index) {

                  return buildWholesalerOrders(context, order: cubit.wholesalerOrders[index]);
                },
              ):
              List.generate(cubit.orders.length,
                    (index) {

                return buildOrders(context, order: cubit.orders[index]);
              },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildOrders(context, {required OrdersModel order}) {
    return GestureDetector(
      onTap: () {

        navigateTo(context, OrderDetailsScreen(order));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: getProportionsScreenWidth(130),
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_back_ios,color: kPrimaryColor,),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            order.history,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                          Text(
                            ' : الطلب بتاريخ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            order.time,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                          Text(
                            '  : الطلب بتوقيت',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      isWholesaler?Text(
                        "تاجر جملة",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ):SizedBox(),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildWholesalerOrders(context, {required WholesalerOrdersModel
  order}) {
    return GestureDetector(
      onTap: () {

        navigateTo(context, WholesalerOrderDetailsScreen(order));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: getProportionsScreenWidth(130),
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_back_ios,color: kPrimaryColor,),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            order.history,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                          Text(
                            ' : الطلب بتاريخ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            order.time,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                          Text(
                            '  : الطلب بتوقيت',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      isWholesaler?Text(
                        "تاجر جملة",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ):SizedBox(),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
