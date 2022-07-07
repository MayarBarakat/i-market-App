import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imarket_app/modules/imarket_app/phone_verification/numeric_pad_screen.dart';
import 'package:imarket_app/modules/imarket_app/phone_verification/verify_phone_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/component/constants.dart';
import 'package:imarket_app/shared/component/size_config.dart';


class ContinueWithPhone extends StatefulWidget {
  @override
  State<ContinueWithPhone> createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  String phoneNumber = '';
  String sendNumber = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  bool showLoading = false;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 30.0,
            color: Colors.black,)

        ),
        title: Text('التحقق من رقم الموبايل',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,

        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

      ),
      body:showLoading ? Center(child: CircularProgressIndicator(),): SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.7,0.9],
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFF7F7F7),
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 130,
                        child: Image.asset('assets/images/holding-phone.png'),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal:
                      getProportionsScreenWidth(64),vertical:
                      getProportionsScreenWidth(14)),
                      child: Text('سيتم إرسال إليك رسالة تتضمن 6 أرقام',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF818181),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'أدخل رقم الموبايل من فضلك',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()async{

                          if(phoneNumber.length > 10){
                            showToast(msg: 'الرقم المدخل أكبر من 10 ارقام',
                                state: ToastStates.ERROR);
                          }
                          else if(phoneNumber.length < 10){
                            showToast(msg: 'الرقم المدخل أصغر من 10 أرقام',
                                state: ToastStates.ERROR);
                          }
                          else {
                            if (phoneNumber[0] == '0') {
                              sendNumber = phoneNumber.substring(1);
                              sendNumber = '+963' + sendNumber;
                            }
                            setState(() {
                              showLoading = true;
                            });

                              await auth.verifyPhoneNumber(
                                  phoneNumber: sendNumber,
                                  verificationCompleted: (
                                      phoneAuthCredential) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                  },
                                  verificationFailed: (
                                      verificationFailed) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(content: Text
                                          (verificationFailed.message
                                            .toString()))
                                    );
                                  },
                                  codeSent: (verificationId,
                                      resendingToken) async {
                                    setState(() {
                                      showLoading = true;
                                    });
                                    this.verificationId = verificationId;
                                    navigateTo(context,
                                        VerifyScreen(
                                          phoneNumber: sendNumber,
                                          verificationId: this
                                              .verificationId,));
                                  },
                                  codeAutoRetrievalTimeout: (
                                      verificationId) async {

                                  }
                              );


                            }

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'متابعة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NumericPad(
              onNumberSelected: (value){
                setState(() {
                  if(value != -1){
                    phoneNumber = phoneNumber + value.toString();
                  }
                  else {
                    if (phoneNumber.isNotEmpty) {
                      phoneNumber =
                          phoneNumber.substring(0, phoneNumber.length - 1);
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
