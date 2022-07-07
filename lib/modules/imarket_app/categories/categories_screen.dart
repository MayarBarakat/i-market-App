import 'package:flutter/material.dart';
import 'package:imarket_app/modules/imarket_app/categories/one_categories_Screen.dart';
import 'package:imarket_app/shared/component/components.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'الأصناف',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GridView.count(
            crossAxisCount: 2,
//          mainAxisSpacing: 1.0,
//          crossAxisSpacing: 1.0,
//          childAspectRatio: 0.9,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(8, (index) => buildCategories(
              image: 'assets/images/d1.png',
              name: 'بقوليات',
              numberPfProduct: 22,
              onClick: (){
                navigateTo(context, OneCategoriesScreen());
              }
            ))),
      ),
    );
  }

  Widget buildCategories(
  {
  required String image,
    required String name,
    required int numberPfProduct,
    required onClick,
}
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: getProportionsScreenWidth(242),
        height: getProportionsScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
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
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionsScreenWidth(15),
                      vertical: getProportionsScreenWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionsScreenWidth(18),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'منتج',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            numberPfProduct.toString(),
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
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
    );
  }
}
