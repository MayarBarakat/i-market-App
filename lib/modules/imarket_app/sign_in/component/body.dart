import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/component/components.dart';
import '../../../../shared/component/constants.dart';
import '../../../../shared/component/size_config.dart';
import '../../login_register_success/login_register_success_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'customIcon.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, states) => {},
        builder: (context, states) => Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionsScreenWidth(20)),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'تسجيل الدخول',
                  ),
                  Text(
                    'قم بتسجيل الدخول كحساب للشاء بالجملة من خلال '
                    'الحساب المعطى من قبل الشركة',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    hint: '',
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'أدخل رقم الهاتف من فضلك';
                      }
                    },
                    label: 'رقم الهاتف',
                    prefix: Icons.phone_rounded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    hint: '',
                    onSubmit: (value) {
                      if (formKey.currentState!.validate()) {
                        //TODO Check data for login
                      }
                    },
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
                    height: 15.0,
                  ),
                  buildDefaultButton(
                    register: true,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          navigateTo(context,
                              SuccessScreen('تم تسجيل الدخول بنجاح'));
                        }
                      },
                      text: 'نسجيل الدخول',
                      height: 56),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0988548197',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                      Text(
                        'لإمتلاك حساب الجملة اتصل على الرقم التالي ',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
