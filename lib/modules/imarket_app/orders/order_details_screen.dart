import 'package:flutter/material.dart';
import 'package:imarket_app/models/imarket_app/order_model.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrdersModel order;

  OrderDetailsScreen(this.order);

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
                    order.productsBuying.length,
                        (index) => DataRow(cells: [
                      DataCell(Text(
                          '${order.productsBuying[index].pricePerProduct * order
                              .productsBuying[index].numberOfProduct}')),
                      DataCell(
                          Text(order.productsBuying[index].pricePerProduct.toString())),
                      DataCell(
                          Text(order.productsBuying[index].numberOfProduct.toString())),
                      DataCell(Text(order.productsBuying[index].name)),
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
                  'الأسم : ' + order.user.name,
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
                  'رقم الموبايل : ' + order.user.phone,
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
                  'المنطقة : ' + order.user.region,
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
                  'الحي : ' + order.user.alhay,
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
                  'الحارة : ' + order.user.street,
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
                  'البناء : ' + order.user.building,
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
                  'الطابق : ' + order.user.floor,
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
                  'الجهة : ' + order.user.side,
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
                  'تفاصيل إضافية : ' + order.user.details,
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
                      order.priceOfAllProducts.toString(),
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
                      '${order.priceOfAllProducts + 2000}',
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
