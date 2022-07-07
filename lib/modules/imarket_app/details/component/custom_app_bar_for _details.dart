import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';

import '../../../../shared/component/size_config.dart';

class CustomAppBar extends PreferredSize{
  final ProductForBuy? product;
  CustomAppBar({Key? key, Widget? title,this.product}) : super(
    key: key,
    preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    child: AppBar(
      title: title,
      // maybe other AppBar properties
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(20)),
                child: FlatButton(
                  minWidth: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),

                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),

                child: IconButton(
                  icon: Icon(product!.inFavorites?Icons.favorite: Icons
                      .favorite_outline,color: product!
                      .inFavorites?kPrimaryColor:Colors.grey,),
                  onPressed: (){
                    cubit.addFavorites(product!);
                  },
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}