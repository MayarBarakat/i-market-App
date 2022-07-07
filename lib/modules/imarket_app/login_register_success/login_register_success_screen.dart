import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/modules/imarket_app/buy/buy_screen.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../../layout/imarket_app/shop_layout.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/size_config.dart';

class SuccessScreen extends StatelessWidget {

    late final String text;
   SuccessScreen(
       this.text
       );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: SizedBox(),
            title: Text(text,style: TextStyle(color: Colors.black,fontWeight:
            FontWeight.w600),),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight! *0.04,
                  ),
                  Image.asset('assets/images/success.png',
                    height: SizeConfig.screenHeight! * 0.4 ,//40%,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.08,
                  ),
                  Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: getProportionsScreenWidth(30),
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.6,
                    child: buildDefaultButton(
                        register: true,
                        text: 'الشاشة الرئيسية',
                        function: (){
                          if(cubit.isFromCreate && cubit.products.isNotEmpty){
                            navigateAndFinish(context, ShopLayout());
                            navigateTo(context, BuyScreen(cubit.products,
                                cubit.priceOfAllProduct));
                          }else {
                            navigateAndFinish(context, ShopLayout());
                          }
                        },
                        height: 56
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
