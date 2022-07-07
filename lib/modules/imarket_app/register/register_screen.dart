import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/models/imarket_app/user_model.dart';
import 'package:imarket_app/modules/imarket_app/register/help_screen.dart';
import 'package:imarket_app/shared/component/constants.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/size_config.dart';
import '../login_register_success/login_register_success_screen.dart';
import 'cupit/cubit.dart';
import 'cupit/states.dart';

class RegisterScreen extends StatelessWidget {

  late bool isFromBuy;
  RegisterScreen(this.isFromBuy);
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var regionController = TextEditingController();
  var alhayController = TextEditingController();
  var streetController = TextEditingController();
  var buildingController = TextEditingController();
  var floorController = TextEditingController();
  var sideController = TextEditingController();
  var detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShopRegisterCubit();
      },
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopRegisterCubit.get(context);


            UserModel? user = cubit.user;
            nameController.text = user.name;
            phoneController.text = user.phone;
            regionController.text = user.region;
            alhayController.text = user.alhay;
            streetController.text = user.street;
            buildingController.text = user.building;
            floorController.text = user.floor;
            sideController.text = user.side;
            detailsController.text = user.details;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'انشاء حساب',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                          hint: 'الاسم',
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
                          hint: '',
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

                          hint: '... ساحة السيوف, ساحة الرئيس, الروضة',
                          controller: alhayController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'ادخل الحي من فضلك';
                            }
                          },
                          label: 'الحي',
                          prefix: Icons.home_work_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'إختياري يمكنك عدم ادخاله في حال لا يوجد حارة '
                              'للتحديد',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: getProportionsScreenHeight(10),),
                        defaultFormField(
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
                        Text(
                          'إختياري يمكنك عدم ادخاله في حال لا يوجد تفاصيل '
                              'إضافية '
                              'للتحديد',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: getProportionsScreenHeight(10),),
                        defaultFormField(
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

                        isFromBuy?SizedBox():buildDefaultButton(
                            register: true,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.registerUser(
                                    name: nameController.text.toString(),
                                    phone: phoneController.text.toString(),
                                    region: regionController.text.toString(),
                                    alhay: alhayController.text.toString(),
                                    street: streetController.text.toString(),
                                    building: buildingController.text.toString(),
                                    floor: floorController.text.toString(),
                                    side: sideController.text.toString(),
                                    details: detailsController.text.toString()
                                );
                                cubit.register = true;
                                navigateTo(context,
                                    SuccessScreen('تم انشاء حسابك بنجاح'));
                              }
                            },
                            text: 'انشاء حساب',
                            height: 56),
                        SizedBox(
                          height: 15.0,
                        ),
                        buildDefaultButton(
                          register: cubit.register,
                            function:() {
                              if (formKey.currentState!.validate() && cubit.register) {
                                cubit.editUserData(
                                    name: nameController.text.toString(),
                                    phone: phoneController.text.toString(),
                                    region: regionController.text.toString(),
                                    alhay: alhayController.text.toString(),
                                    street: streetController.text.toString(),
                                    building: buildingController.text.toString(),
                                    floor: floorController.text.toString(),
                                    side: sideController.text.toString(),
                                    details: detailsController.text.toString()
                                );
                                if(isFromBuy){
                                  Navigator.pop(context);
                                }
                              }
                            },

                            text: 'تعديل',
                            height: 56),
                        SizedBox(
                          height: 15.0,
                        ),
                        buildDefaultButton(
                            register: true,
                            function:() {
                              navigateTo(context, HelpScreen());
                            },

                            text: 'مساعدة',
                            height: 56),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
