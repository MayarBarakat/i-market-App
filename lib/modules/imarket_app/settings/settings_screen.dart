import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/modules/imarket_app/orders/orders_screen.dart';
import 'package:imarket_app/modules/imarket_app/phone_verification/continue_with_phone.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/states.dart';
import 'package:imarket_app/modules/imarket_app/register/help_screen.dart';
import 'package:imarket_app/modules/imarket_app/register/register_screen.dart';
import 'package:imarket_app/modules/imarket_app/sign_in/sign_in_screen.dart';
import 'package:imarket_app/modules/imarket_app/wholesaler/wholesaler_info_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';

import '../../../shared/component/size_config.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
      listener: (context,state){},
      builder: (context , state){
        var cubit = ShopRegisterCubit.get(context);
        return  SafeArea(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              child: Column(
                children: [
                  SizedBox(
                    height: getProportionsScreenWidth(20),
                  ),
                  profilePic(),
                  SizedBox(
                    height: 20,
                  ),
                  if(cubit.wholesalerRegister)
                  Text('حسابك الآن تاجر جملة',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  ),
                  if(cubit.wholesalerRegister)
                  SizedBox(height: 20,),
                  profileMenu(
                      context,
                      text: 'حسابي',
                      icon: Icons.person_outline_sharp,
                      press: () {
                        if (cubit.wholesalerRegister) {
                          navigateTo(context, WholesalerInfoScreen());
                        }
                        else {
                          navigateTo(context, RegisterScreen(false));
                        }
                      }
                  ),
                  profileMenu(
                      context,
                      text: 'الطلبات',
                      icon: Icons.list_alt  ,
                      press: () {
                        navigateTo(context, OrdersScreen());
                      }
                  ),

                  profileMenu(
                      context,
                      text: 'مساعدة',
                      icon: Icons.question_answer_outlined,
                      press: () {
                        navigateTo(context, HelpScreen());
                      }
                  ),
                  profileMenu(
                      context,
                      text: 'تسجيل الدخول كتاجر جملة',
                      icon: Icons.login,
                      press: () {
                        navigateTo(context, SignIn());
                      }
                  ),
                  profileMenu(
                      context,
                      text: 'تسجيل الخروج',
                      icon: Icons.logout,
                      press: () {
                        if ((CacheHelper.getData(key: 'wholesalerRegister')== null)
                            && (CacheHelper.getData(key: 'register')== null)) {
                          showToast(msg: 'لم تقم بتسجيل الدخول', state:
                          ToastStates.WARNING);
                        } else {
                          cubit.openLogoutDialog(context);
                        }
                      }
                  ),
                  profileMenu(
                      context,
                      text: 'التحقق من الهاتف',
                      icon: Icons.phone,
                      press: () {
                        navigateTo(context, ContinueWithPhone());
                      }
                  ),

                ],
              ),

          ),
        );},

    );
  }

  Widget profileMenu(context,
      {required String text, required icon, required VoidCallback press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: (Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        )),
      ),
    );
  }

  Widget profilePic() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [

          CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              width: 46,
              height: 46,
              child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {},
                  color: Color(0xFFF5F6F9),
                  child: Icon(Icons.camera_alt_outlined)),
            ),
          ),
        ],
      ),
    );
  }
}
