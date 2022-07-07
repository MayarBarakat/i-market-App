import 'package:flutter/material.dart';

import '../../../models/imarket_app/wholesaler_order_model.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';

class WholesalerOrderDetailsScreen extends StatelessWidget {
  final WholesalerOrdersModel wholesalerOrders;

  WholesalerOrderDetailsScreen(this.wholesalerOrders);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلب',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(getProportionsScreenWidth(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'قائمة مشترياتك',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: DataTable(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  dataRowHeight: getProportionsScreenWidth(80),
                  columnSpacing: 30,
                  columns: [
                    DataColumn(label: Text('السعر الكلي')),
                    DataColumn(label: Text('سعر القطعة')),
                    DataColumn(label: Text('العدد')),
                    DataColumn(label: Text('المنتج')),
                  ],
                  rows: List.generate(
                    wholesalerOrders.productsBuying.length,
                        (index) => DataRow(cells: [
                      DataCell(Text(
                          '${wholesalerOrders.productsBuying[index]
                              .pricePerProduct *
                              wholesalerOrders
                              .productsBuying[index].numberOfProduct}')),
                      DataCell(
                          Text(wholesalerOrders.productsBuying[index].pricePerProduct
                              .toString())),
                      DataCell(
                          Text(wholesalerOrders.productsBuying[index].numberOfProduct
                              .toString())),
                      DataCell(Text(wholesalerOrders.productsBuying[index].name)),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child:Text(
                  'الأسم : ' + wholesalerOrders.wholesalerUser.name,
                  textAlign: TextAlign.end,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'رقم الموبايل : ' + wholesalerOrders.wholesalerUser.phoneNumber,
                  textAlign: TextAlign.end,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'المنطقة : ' + wholesalerOrders.wholesalerUser.address,
                  textAlign: TextAlign.end,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      wholesalerOrders.priceOfAllProducts.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                    ),
                    Text(
                      ' : مجموع أسعار المنتجات',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '2000',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                    ),
                    Text(
                      ' : أجرة النقل',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${wholesalerOrders.priceOfAllProducts + 2000}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                    ),
                    Text(
                      ' : السعر النهائي',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
