import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';


import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';
import 'component/custom_app_bar_for _details.dart';
import 'component/product_images.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {
        required this.product,
      required this.images,

      });
  final List<String> images;

  final ProductForBuy product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int numberOfProduct = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,states){},
      builder: (context,states){
        var cubit = ShopCubit.get(context);
        return  Scaffold(
            backgroundColor: Color(0xFFF5F6F9),
            appBar: CustomAppBar(
              product: widget.product,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                ProductImages(images: widget.images,product: widget.product,),
                ProductDescription(
                  price: widget.product.pricePerProduct,
                  color: Colors.white,
                  pressOnSeeMore: () {},
                  name: widget.product.name,
                  description: widget.product.description,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            roundediconBtn(
                                onPress: (){
                                  setState(() {
                                    if(numberOfProduct>0){
                                      numberOfProduct--;
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove,
                                ),
                                color: Colors.white
                            ),
                            SizedBox(width: getProportionsScreenWidth(30),),
                            Text(
                              numberOfProduct.toString(),
                              style: TextStyle(
                                  fontSize: getProportionsScreenWidth(20),
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(width: getProportionsScreenWidth(30),),
                            roundediconBtn(
                                onPress: (){
                                  setState(() {
                                    numberOfProduct++;
                                  });
                                },
                                icon: Icon(Icons.add,
                                ),
                                color: Colors.white
                            ),

                          ],
                        ),
                        SizedBox(width: getProportionsScreenWidth(20),),
                        Text('تحديد الكمية',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),

                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: SizeConfig.screenWidth! * 0.15,
                        right: SizeConfig.screenWidth! * 0.15,
                        top: getProportionsScreenWidth(15),
                        bottom: getProportionsScreenWidth(40)
                    ),
                    child: buildDefaultButton(
                      register: true,
                        text:'اضافة الى السلة',
                        function: (){
                          if(numberOfProduct == 0){
                            showToast(msg: 'يرجى تحديد الكمية', state:
                            ToastStates.WARNING);
                          }else{
                         ProductForBuy product = ProductForBuy(
                              widget.product.id,
                              widget.product.name,
                              widget.product.pricePerProduct,
                              numberOfProduct,
                              widget.images[0],
                           widget.product.description,
                           widget.product.inFavorites
                          );
                          cubit.addProduct(product);
                          Navigator.pop(context);

                        }
                          },
                        height: 56
                    ),
                  ),
                ),
              ]),
            ));
      }


    );
  }
}

class ProductDescription extends StatelessWidget {
  final Color color;
  final GestureTapCallback pressOnSeeMore;
  final String name;
  final int price;
  final String description;

  const ProductDescription({
    Key? key,
    required this.color,
    required this.pressOnSeeMore,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionsScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionsScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(20)),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text(
                  price.toString(),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                  ),
                ),
                Text(
                  ' : السعر',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          Padding(
            padding: EdgeInsets.only(
                left: getProportionsScreenWidth(64),
                right: getProportionsScreenWidth(20)),
            child: Text(
              description,
              textAlign: TextAlign.end,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionsScreenWidth(20), vertical: 10),
            child: GestureDetector(
              onTap: pressOnSeeMore,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                    size: 12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'المزيد من التفاصيل',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
