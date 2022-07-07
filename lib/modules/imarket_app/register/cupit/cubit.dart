import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/user_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_model.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/states.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';

import '../../../../models/imarket_app/product_model.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool register = CacheHelper.getData(key: 'register')!= null?CacheHelper
      .getData(key: 'register'):false;
 late UserModel user =register? UserModel(
     CacheHelper.getData(key: 'name'),
     CacheHelper.getData(key: 'phone'),
     CacheHelper.getData(key: 'region'),
     CacheHelper.getData(key: 'alhay'),
     CacheHelper.getData(key: 'street'),
     CacheHelper.getData(key: 'building'),
     CacheHelper.getData(key: 'floor'),
     CacheHelper.getData(key: 'side'),
     CacheHelper.getData(key: 'details')
 ): UserModel(
     '',
     '',
     '',
     '',
     '',
     '',
     '',
     '',
     ''
 );


  void registerUser({
    required String name,
    required String phone,
    required String region,
    required String alhay,
    required String street,
    required String building,
    required String floor,
    required String side,
    required String details,
  }) {
    CacheHelper.saveData(key: 'name', value: name);
    CacheHelper.saveData(key: 'phone', value: phone);
    CacheHelper.saveData(key: 'region', value: region);
    CacheHelper.saveData(key: 'alhay', value: alhay);
    CacheHelper.saveData(key: 'street', value: street);
    CacheHelper.saveData(key: 'building', value: building);
    CacheHelper.saveData(key: 'floor', value: floor);
    CacheHelper.saveData(key: 'side', value: side);
    CacheHelper.saveData(key: 'details', value: details);
    register = true;
    CacheHelper.saveData(key: 'register', value: true);


    emit(ShopRegisterSuccessState());
  }

  void editUserData({
    required String name,
    required String phone,
    required String region,
    required String alhay,
    required String street,
    required String building,
    required String floor,
    required String side,
    required String details,
  }) {
    CacheHelper.saveData(key: 'name', value: name);
    CacheHelper.saveData(key: 'phone', value: phone);
    CacheHelper.saveData(key: 'region', value: region);
    CacheHelper.saveData(key: 'alhay', value: alhay);
    CacheHelper.saveData(key: 'street', value: street);
    CacheHelper.saveData(key: 'building', value: building);
    CacheHelper.saveData(key: 'floor', value: floor);
    CacheHelper.saveData(key: 'side', value: side);
    CacheHelper.saveData(key: 'details', value: details);
    CacheHelper.saveData(key: 'register', value: true);
    user = UserModel(
        CacheHelper.getData(key: 'name'),
        CacheHelper.getData(key: 'phone'),
        CacheHelper.getData(key: 'region'),
        CacheHelper.getData(key: 'alhay'),
        CacheHelper.getData(key: 'street'),
        CacheHelper.getData(key: 'building'),
        CacheHelper.getData(key: 'floor'),
        CacheHelper.getData(key: 'side'),
        CacheHelper.getData(key: 'details'));
    showToast(msg: 'تم تعديل بياناتك بنجاح', state: ToastStates.SUCCESS);

    emit(EditUserDataState());
  }
  void deleteRegister(){
    register =false;
    CacheHelper.removeData(key: 'register');
    emit(DeleteUserState());
  }
  void deleteWholesalerRegister(){
    wholesalerRegister =false;
    CacheHelper.removeData(key: 'wholesalerRegister');
    emit(DeleteWholesalerUserState());
  }
  final auth = FirebaseAuth.instance;
  void openLogoutDialog(context){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('هل تريد تسجيل الخروج',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
                onPressed: ()async{
                  if(wholesalerRegister){
                    deleteWholesalerRegister();
                    ShopCubit.get(context).deleteUser();
                  }
                  else {
                    deleteRegister();
                   await auth.signOut();
                  }
                  ShopCubit.get(context).isFromCreate = false;
                  Navigator.pop(context);
                },
                child: Text('تسجيل الخروج',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('الغاء',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),)
            ),
          ],
        )
    );
  }
  bool wholesalerRegister = CacheHelper.getData(key: 'wholesalerRegister')!=
      null?CacheHelper
      .getData(key: 'wholesalerRegister'):false;

 late  WholesalerModel wholesalerModel = wholesalerRegister?WholesalerModel
    (
   phoneNumber: CacheHelper.getData(key: 'wholesalerPhone'),
   name: CacheHelper.getData(key: 'wholesalerName'),
   address: CacheHelper.getData(key: 'wholesalerAddress'),
   password: CacheHelper.getData(key: 'wholesalerPassword')
 )
     :WholesalerModel
   (password: '',address: '',name: '',phoneNumber: '');
  void userLogin({required String phone, required String password,required
  String address,required String name}) {

    CacheHelper.saveData(key: 'wholesalerPhone', value: phone);
    CacheHelper.saveData(key: 'wholesalerPassword', value: password);
    CacheHelper.saveData(key: 'wholesalerAddress', value: address);
    CacheHelper.saveData(key: 'wholesalerName', value: name);
  }

  bool isWholesaler(context){
    if(CacheHelper.getData(key: 'wholesalerPhone') == '0988548197' &&
        CacheHelper.getData(key: 'wholesalerPassword') == '123456'){
      CacheHelper.saveData(key: 'wholesalerRegister', value: true);
      wholesalerRegister =true;
      ShopCubit.get(context).testProduct =  CacheHelper.getData(key: 'wholesalerRegister')==null?[
        ProductForBuy(
          1,
          'قبضة',
          6000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false,
        ),
        ProductForBuy(
          2,
          'شورت',
          3750,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false,
        ),
        ProductForBuy(
            3,
            'قبضة',
            10000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            4,
            'شورت',
            4500,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            5,
            'قبضة',
            1500,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            6,
            'شورت',
            2000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            7,
            'قبضة',
            3000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            8,
            'شورت',
            1000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            9,
            'قبضة',
            8000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            10,
            'شورت',
            7000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            11,
            'قبضة',
            9000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            12,
            'شورت',
            12000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
      ]:
      [
        ProductForBuy(
          1,
          'قبضة',
          12000,
          0,
          'assets/images/product1.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false,
        ),
        ProductForBuy(
          2,
          'شورت',
          7500,
          0,
          'assets/images/product2.png',
          'لمنتج الأول في جرمانا لمنتج '
              'الأول في جرمانا لمنتج الأول في جرمانا '
              'لمنتج الأول في جرمانا لمنتج الأول في '
              'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
              'المنتج '
              'الأول في جرمانا',
          false,
        ),
        ProductForBuy(
            3,
            'قبضة',
            20000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            4,
            'شورت',
            9000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            5,
            'قبضة',
            3000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            6,
            'شورت',
            4000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            7,
            'قبضة',
            6000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            8,
            'شورت',
            2000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            9,
            'قبضة',
            16000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            10,
            'شورت',
            14000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            11,
            'قبضة',
            18000,
            0,
            'assets/images/product1.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
        ProductForBuy(
            12,
            'شورت',
            24000,
            0,
            'assets/images/product2.png',
            'لمنتج الأول في جرمانا لمنتج '
                'الأول في جرمانا لمنتج الأول في جرمانا '
                'لمنتج الأول في جرمانا لمنتج الأول في '
                'جرمانا لمنتج الأول في جرمانا لمنتج الأول في جرمانا '
                'المنتج '
                'الأول في جرمانا',
            false
        ),
      ];
      emit(LoginState());
      return true;
    }
    wholesalerRegister = false;
    CacheHelper.saveData(key: 'wholesalerRegister', value: false);
    return false;

  }
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
