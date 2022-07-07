import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/layout/imarket_app/shop_layout.dart';
import 'package:imarket_app/modules/imarket_app/buy/buy_screen.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../models/imarket_app/product_model.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';


class SallaScreen extends StatelessWidget {



 late List<ProductForBuy> products;



  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
      },
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        products = cubit.products;
        bool isEmpty = products.isEmpty;


        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    'سلة المشتريات',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionsScreenWidth(18),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(products.length.toString(), style: Theme.of
                        (context).textTheme
                          .caption),
                      Text('عدد المنتجات ', style: Theme.of(context).textTheme
                          .caption),

                    ],
                  ),
                ],
              ),
            ),
          ),
          body:isEmpty?Center(child: Text('السلة فارغة',style: TextStyle
            (fontWeight: FontWeight.w200,fontSize: 24,),)
            ,):
          ListView
              .separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> buildItemCart(context,
                  products: products,
                  index: index
              ),
              separatorBuilder: (context,index)=>SizedBox(height: 12,),
              itemCount: products.length
          ),
          bottomNavigationBar: checkOurCart(context,
              priceOfAllProduct: cubit.priceOfAllProduct
          ),
        );
      },

    );
  }

  Widget buildItemCart(context,{
    required List<ProductForBuy>? products,
    required int index,
  }){
    var cubit = ShopCubit.get(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(10)),
      child: Dismissible(
          key: Key(products![index].id.toString()),
          onDismissed: (direction){
            cubit.deleteProduct(products[index]);

       },
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
                      height: 190,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            products[index].name,
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              height: 1.3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(products[index].numberOfProduct.toString()),
                              const Text(
                                ' : العدد',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3
                                ),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                          products[index].pricePerProduct.toString(),
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16.0,

                                  ),
                                ),
                                Text(
                                  ': سعر القطعة ',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                  ),
                                ),
                              ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${products[index].pricePerProduct *
                                    products[index]. numberOfProduct}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                ': السعر الكلي ',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    height: 1.6
                                ),
                              ),
                            ],
                          ),
                          Container(
//                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  roundediconBtn(
                                      onPress: (){
                                        cubit.minusProduct(products[index],
                                            context);

                                      },
                                      icon: Icon(Icons.remove,
                                      ),
                                    color: Colors.grey[300]
                                  ),
                                  Text(
                                    products[index].numberOfProduct.toString(),
                                    style: TextStyle(
                                        fontSize: getProportionsScreenWidth(20),
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  roundediconBtn(
                                      onPress: (){
                                       cubit.plusProduct(products[index]);

                                      },
                                      icon: Icon(Icons.add,
                                      ),
                                      color: Colors.grey[300]
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: getProportionsScreenWidth(100),
                      height: getProportionsScreenWidth(160),
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(products[index].image),
                        ),
                      ),
                    ),
                  ),

                ],
              ))
      ),
    );
  }
  Widget checkOurCart(context,{
  required int priceOfAllProduct,

}){
    var cubit = ShopCubit.get(context);
    Color progressColor = kPrimaryColor;
    if((cubit.priceOfAllProduct/21000)>1.0){
      progressColor = Colors.green;
    }
    return Container(
      height: getProportionsScreenWidth(230),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionsScreenWidth(30),
        vertical: getProportionsScreenWidth(15)
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,-15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15)
            ),
          ]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [

                CircularPercentIndicator(
                    radius: 30,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 5,
                  progressColor: progressColor,
                  percent:cubit.priceOfAllProduct / 21000 >1.0? 1.0:cubit
                      .priceOfAllProduct / 21000,
                  addAutomaticKeepAlive: true,
                  reverse: false,
                  center: Icon(Icons.add_shopping_cart,color: progressColor,),
                  animation: true,
                  animateFromLastPercent: true,
                  animationDuration: 1000,

                ),

                Spacer(),
                Text('الحد الأدنى 21000',style: TextStyle(fontWeight:
                FontWeight.w600,fontSize: 16),),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios,size: 14,color: kTextColor,),
              ],
            ),
            SizedBox(
              height: getProportionsScreenWidth(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: ': المجموع\n',
                    children: [
                      TextSpan(
                        text: cubit.priceOfAllProduct.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ]
                  ),
                ),
                SizedBox(
                  width: getProportionsScreenWidth(190),
                  child: buildDefaultButton(
                    register: true,
                      text: 'شراء',
                      function: () {
                        if (cubit.products.isEmpty) {
                          showToast(msg: 'السلة فارغة', state: ToastStates
                              .WARNING);
                        }else if(priceOfAllProduct<21000){
                          showToast(msg: 'مجموع المنتجات أقل من 21000',
                              state: ToastStates.ERROR);
                        }
                        else {
                          if (CacheHelper.getData(key: 'register') == null&&
                              CacheHelper.getData(key: 'wholesalerRegister')
                          == null) {
                            cubit.openRegisterDialog(context);
                          }
                          else {
                            navigateTo(context,
                                BuyScreen(products, cubit.priceOfAllProduct));
                          }
                        }
                      },
                      height: 56
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
