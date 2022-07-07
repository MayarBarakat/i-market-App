import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/models/imarket_app/user_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_model.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/modules/imarket_app/register/register_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:imarket_app/shared/component/size_config.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';
import 'package:intl/intl.dart';

class BuyScreen extends StatefulWidget {
  late final List<ProductForBuy> products;
  late final int priceOfAllProducts;
  BuyScreen(
    this.products,
    this.priceOfAllProducts,
  );

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> with TickerProviderStateMixin{

  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller =
        BottomSheet.createAnimationController(this);
    controller!.duration = Duration(seconds: 2);
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = ShopCubit.get(context);
        bool isWholesaler = false;
        if(CacheHelper.getData(key: 'wholesalerRegister') != null){
          isWholesaler = CacheHelper.getData(key: 'wholesalerRegister');
        }
        var now = DateTime.now();
        var formatterDate = DateFormat('yyyy/MM/dd');
        var formatterTime = DateFormat('kk:mm a');
        var formatDay = DateFormat('EEEE').format(now);

        String actualDate = formatterDate.format(now);
        String actualTime = formatterTime.format(now);

        print(formatDay);
        switch(formatDay){
          case 'Sunday':
            formatDay = 'الأحد ';
            break;
          case 'Monday':
            formatDay = 'الأثنين ';
        break;
        case 'Tuesday':
        formatDay = 'الثلاثاء ';
        break;
        case 'Wednesday':
        formatDay = 'الأربعاء ';
        break;
        case 'Thursday':
        formatDay = 'الخميس ';
        break;
        case 'Friday':
          formatDay = 'الجمعة ';
          break;
          case 'Saturday':
            formatDay = 'السبت ';
            break;

        }
        String name =isWholesaler?CacheHelper.getData(key: 'wholesalerName') :
        CacheHelper.getData(key: 'name');

        String phone =isWholesaler?CacheHelper.getData(key: 'wholesalerPhone'
        ) : CacheHelper.getData(key: 'phone');

        String region =isWholesaler?CacheHelper.getData(key: 'wholesalerAddress') : CacheHelper.getData(key: 'region');

        String alhay =isWholesaler?'': CacheHelper.getData(key: 'alhay');

        String street = isWholesaler?'':CacheHelper.getData(key: 'street');

        String building =isWholesaler?'': CacheHelper.getData(key: 'building');

        String floor =isWholesaler?'': CacheHelper.getData(key: 'floor');

        String side =isWholesaler?'': CacheHelper.getData(key: 'side');

        String details =isWholesaler?'': CacheHelper.getData(key: 'details');


        alhay == ''?alhay = 'لا يوجد':alhay = alhay;
        street == ''?street = 'لا يوجد':street = street;
        details == ''?details = 'لا يوجد':details = details;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'الفاتورة',
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
                        widget.products.length,
                            (index) => DataRow(cells: [
                          DataCell(Text(
                              '${widget.products[index].pricePerProduct * widget.products[index].numberOfProduct}')),
                          DataCell(
                              Text(widget.products[index].pricePerProduct.toString())),
                          DataCell(
                              Text(widget.products[index].numberOfProduct.toString())),
                          DataCell(Text(widget.products[index].name)),
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
                      'الأسم : ' + name,
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
                      'رقم الموبايل : ' + phone,
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
                      'المنطقة : ' + region,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'الحي : ' + alhay,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'الحارة : ' + street,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'البناء : ' + building,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox(): Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'الطابق : ' + floor,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'الجهة : ' + side,
                      textAlign: TextAlign.end,
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isWholesaler?SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'تفاصيل إضافية : ' + details,
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
                          widget.priceOfAllProducts.toString(),
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
                          '${widget.priceOfAllProducts + 2000}',
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: getProportionsScreenWidth(150),
                          child: buildDefaultButton(
                              text: 'تعديل العنوان',
                              function: () {
                                Navigator.push(context, MaterialPageRoute
                                  (builder: (context)=>RegisterScreen(true)
                                )).then((value){
                                  setState(() {
                                    name = CacheHelper.getData(key: 'name');

                                    phone = CacheHelper.getData(key: 'phone');

                                    region = CacheHelper.getData(key: 'region');

                                    alhay = CacheHelper.getData(key: 'alhay');

                                    street = CacheHelper.getData(key: 'street');

                                    building = CacheHelper.getData(key: 'building');

                                    floor = CacheHelper.getData(key: 'floor');

                                    side = CacheHelper.getData(key: 'side');

                                    details = CacheHelper.getData(key: 'details');
                                  });
                                });
                              },
                              height: 56,
                              register: true)),
                      SizedBox(
                          width: getProportionsScreenWidth(150),
                          child: buildDefaultButton(
                              text: 'تأكيد الشراء',
                              function: () {
                                if(isWholesaler){
                                  cubit.buyFromWholesaler(
                                      history: actualDate + formatDay,
                                      time: actualTime,
                                      productsBuying: widget.products,
                                      wholesalerModel: WholesalerModel(
                                          phoneNumber: phone,
                                          name: name,
                                          password: CacheHelper.getData(key: 'wholesalerPassword'),
                                          address: CacheHelper.getData(key: 'wholesalerAddress')
                                      ),
                                      priceOfAllProducts: widget
                                          .priceOfAllProducts
                                  );
                                  showModalBottomSheet(context: context,
                                      barrierColor: Colors.black54,
                                      isDismissible: false,
                                      elevation: 5,
                                      transitionAnimationController: controller,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        ),
                                      ),
                                      builder: (context){
                                        return SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Container(
                                              height: MediaQuery.of(context).size
                                                  .height * 0.60,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    child: Image.asset
                                                      ('assets/images/delivery.png',),
                                                    height: 250,
                                                    width: 250,
                                                  ),
                                                  Text('طلبك صار عنا',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold
                                                    ),

                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  buildDefaultButton(
                                                    text: 'موافق',
                                                    function: (){
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    height: 56,
                                                    register: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }else{
                                cubit.buy(
                                    history: actualDate + formatDay,
                                    time: actualTime,
                                    productsBuying: widget.products,
                                    user: UserModel(name, phone, region,
                                        alhay, street, building, floor,
                                        side, details),
                                priceOfAllProducts: widget
                                    .priceOfAllProducts);

                                showModalBottomSheet(context: context,
                                    barrierColor: Colors.black54,
                                    isDismissible: false,
                                    elevation: 5,
                                    transitionAnimationController: controller,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (context){
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Container(
                                        height: MediaQuery.of(context).size
                                            .height * 0.60,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                child: Image.asset
                                                  ('assets/images/delivery.png',),
                                              height: 250,
                                              width: 250,
                                            ),
                                            Text('طلبك صار عنا',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold
                                              ),

                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            buildDefaultButton(
                                                text: 'موافق',
                                                function: (){
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                height: 56,
                                                register: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                    });
                              }
                                },
                              height: 56,
                              register: true)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
