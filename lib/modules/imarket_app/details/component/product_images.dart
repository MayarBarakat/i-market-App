import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';

import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';


class ProductImages extends StatefulWidget {
  final List<String>? images;
  final ProductForBuy? product;

  const ProductImages({Key? key, this.images,this.product}) : super(key: key);

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImages = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getProportionsScreenWidth(200),
          child: Swiper(
            itemCount: widget.images!.length,
            scrollDirection: Axis.horizontal,
            onIndexChanged: (index){
              setState(() {
                selectedImages = index;
              });
            },
            itemBuilder: (context,index){
              return SizedBox(
              width: getProportionsScreenWidth(238),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(widget.images![selectedImages]),
              ),
            ) ;
            },
//          child: SizedBox(
//            width: getProportionsScreenWidth(238),
//            child: AspectRatio(
//              aspectRatio: 1,
//              child: Image.asset(widget.images![selectedImages]),
//            ),
//          ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.images!.length,
                    (index) => GestureDetector(

                  onTap: (){
                    setState(() {
                      selectedImages = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: getProportionsScreenWidth(15)),
                    padding: EdgeInsets.all(getProportionsScreenWidth(8)),
                    height: getProportionsScreenWidth(48),
                    width: getProportionsScreenWidth(48),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: selectedImages == index?
                      kPrimaryColor: Colors.white),
                    ),
                    child: Image.asset(widget.images![index]),
                  ),
                ))
            ,
          ],
        ),
      ],
    );
  }
}