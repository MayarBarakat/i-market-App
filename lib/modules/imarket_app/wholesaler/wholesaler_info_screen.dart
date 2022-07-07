import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/size_config.dart';

class WholesalerInfoScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var regionController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = 'ميار بركات';
    phoneController.text = CacheHelper.getData(key: 'wholesalerPhone');
    regionController.text = 'ساحة الرئيس بجانب مطعم على كيفك ';
    passwordController.text = CacheHelper.getData(key: 'wholesalerPassword');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'حسابك',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'تاجر جملة',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionsScreenWidth(26),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'معلوماتك الشخصية',
                      style: TextStyle(
                        fontSize: getProportionsScreenWidth(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: '',
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل اسمك من فضلك';
                      }
                    },
                    label: 'الأسم',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: '',
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل رقم الموبايل من فضلك';
                      }
                    },
                    label: 'رقم الموبايل',
                    prefix: Icons.phone,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'العنوان : ساحة الرئيس, بجانب فلافل على كيفك',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'اختياري يمكنك عدم ادخاله',
                    controller: passwordController,
                    type: TextInputType.text,
                    validate: (String value) {
                      return;
                    },
                    label: 'كلمة السر',
                    prefix: Icons.lock_outline_rounded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Text(
                      'للمزيد التواصل على الرقم التالي',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,

                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: Text(
                        '0988548197',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      onPressed: ()async{
                        launch("tel://+963988548197");
                      },
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          child: FaIcon(FontAwesomeIcons.whatsapp),
                          backgroundColor: Colors.green.shade800,
                          onPressed: () {

                            String url =
                                "https://wa.me/+963988548197/";
                            launch(url);

                          },
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        FloatingActionButton(
                          child: FaIcon(FontAwesomeIcons.facebook),
                          backgroundColor: Colors.blueAccent.shade700,
                          onPressed: () {

                            String url =
                                "fb://page/mayar886886";
                            launch(url);

                          },
                        ),
                      ],
                    ),
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
