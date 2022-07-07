import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/states.dart';
import 'package:imarket_app/shared/component/components.dart';

import '../login_register_success/login_register_success_screen.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
      listener: (context,state){},
      builder: (context , state){
        var cubit = ShopRegisterCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('تسجيل الدخول',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('اذا كنت تمتلك محل تجاري يمكنك تسجيل الدخول كتاجر للجملة',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.number,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'ادخل رقمك المعطى من فضلك';
                            }
                          },
                          label: 'رقم الموبايل',
                          prefix: Icons.phone,
                          hint: 'رقم الموبايل'
                      ),
                      SizedBox(height: 20,),
                      defaultFormField(
                        hint: 'كلمة السر',
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                phone: phoneController.text.toString(),
                                password: passwordController.text.toString(),
                            address: 'ساحة الرئيس, خلف أفران تازا',
                              name: 'ميار بركات'
                            );
                            if(cubit.isWholesaler(context)){
                              showToast(msg: 'تم تسجيل الدخول كتاجر جملة '
                                  'بنجاح', state: ToastStates.SUCCESS);
                              navigateTo(context,
                                  SuccessScreen('تم انشاء حسابك بنجاح'));
                            }
                            else{
                              showToast(msg: 'الحساب غير موجود', state: ToastStates.ERROR);
                            }
                          }
                        },
                        isPassword:
                        cubit.isPasswordShown,
                        suffixPressed: () {
                          cubit
                              .changePasswordVisibility();
                        },
                        suffix: cubit.suffix,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'كلمة السر قصيرة';
                          }
                        },
                        label: 'كلمة السر',
                        prefix: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildDefaultButton(

                          text: 'تسجيل الدخول',
                          function: (){
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  phone: phoneController.text.toString(),
                                  password: passwordController.text.toString(),
                                name: 'ميار بركات',
                                address: 'ساحة الرئيس, خلف أفران تازة'
                              );
                             if(cubit.isWholesaler(context)){
                               showToast(msg: 'تم تسجيل الدخول كتاجر جملة '
                                   'بنجاح', state: ToastStates.SUCCESS);
                               navigateTo(context,
                                   SuccessScreen('تم تسجيل الدخول '
                                       'بنجاح'));
                             }
                              else{
                                showToast(msg: 'الحساب غير موجود', state: ToastStates.ERROR);
                              }
                            }
                          },
                          height: 56,
                          register: true
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
