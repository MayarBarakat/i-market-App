import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/size_config.dart';

class HelpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var regionController = TextEditingController();
  var region2Controller = TextEditingController();
  var streetController = TextEditingController();
  var buildingController = TextEditingController();
  var floorController = TextEditingController();
  var sideController = TextEditingController();
  var detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = 'ميار بركات';
    phoneController.text = '0988548197';
    regionController.text = 'كرم صمادي';
    region2Controller.text = 'كرم صمادي';
    streetController.text = 'الحارة السادسة';
    buildingController.text = 'البناء الثالث على اليمين';
    floorController.text = 'الطابق الثاني فني';
    sideController.text = 'البيت اليمين';
    detailsController.text = 'بجانب مغسل جرمانا';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'مساعدة',
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
                      'انشاء حساب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionsScreenWidth(26),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'قم بإنشاء حسابك لتوصيل كافة طلباتك',
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
                  defaultFormField(
                    isClickable: false,
                    hint: '...,ساحة السيوف, ساحة الرئيس, الروضة',
                    controller: regionController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل عنوانك بالتفصيل من فضلك';
                      }
                    },
                    label: 'المنطقة',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'اختياري يمكنك عدم ادخاله',
                    controller: region2Controller,
                    type: TextInputType.text,
                    validate: (String value) {
                      return;
                    },
                    label: 'الحي',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'اختياري : الحارة الأولى, '
                        'الثانية',
                    controller: streetController,
                    type: TextInputType.text,
                    validate: (String value) {
                      return;
                    },
                    label: 'الحارة',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'رقم البناء و جهته يسار او يمين',
                    controller: buildingController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل رقم البناء وجهته بالتفصيل من فضلك';
                      }
                    },
                    label: 'البناء',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: '... الأولي فني, الثاني فني',
                    controller: floorController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل الطابق بالتفصيل من فضلك';
                      }
                    },
                    label: 'الطابق',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'يمين أو يسار',
                    controller: sideController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'ادخل الجهة بالتفصيل من فضلك';
                      }
                    },
                    label: 'الجهة',
                    prefix: Icons.home_work_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    isClickable: false,
                    hint: 'اختياري: عنوان معروف قريب إليك',
                    controller: detailsController,
                    type: TextInputType.text,
                    validate: (String value) {
                      return;
                    },
                    label: 'تفاصيل إضافية',
                    prefix: Icons.home_work_outlined,
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
