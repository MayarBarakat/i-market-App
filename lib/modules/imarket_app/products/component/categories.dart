import 'package:flutter/material.dart';

import '../../../../shared/component/components.dart';
import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';


class Categories extends StatelessWidget {
  Categories({
    required this.title,
    required this.image,
    required this.onTextPress,
    required this.onClick,
    required this.name,
    required this.numberOfProduct,
});
   final String title;
  final onTextPress;
  final onClick;
  final String image;
  final String name;
  final int numberOfProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleWithMore(text: title, onPressed: onTextPress),
        SizedBox(height: 12,),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(12)),
          child: Container(
            height: getProportionsScreenWidth(100),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                      width: getProportionsScreenWidth(242),
                      height: getProportionsScreenWidth(100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: (){
                            return onClick();
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF343434).withOpacity(0.4),
                                        Color(0xFF343434).withOpacity(0.15)
                                      ]),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal:
                                getProportionsScreenWidth(15),vertical: getProportionsScreenWidth(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getProportionsScreenWidth(18),
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('منتج',
                                          style: TextStyle(
                                              color: Colors.white
                                          ),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(numberOfProduct.toString(),
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: getProportionsScreenWidth(6),
                    ),
                itemCount: 12),
          ),
        ),
      ],
    );
  }
}
//Stack(
//alignment: Alignment.bottomCenter,
//children: [
//Image.asset('assets/images/google-pay.png',
//height: 200,
//width: 200,
//),
//Text('بقوليات',
//style: TextStyle(
//fontWeight: FontWeight.bold,
//fontSize: getProportionsScreenWidth(22),
//decorationThickness: 10
//),
//),
//],
