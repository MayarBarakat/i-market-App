
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imarket_app/modules/imarket_app/phone_verification/numeric_pad_screen.dart';
import 'package:imarket_app/modules/imarket_app/register/register_screen.dart';
import 'package:imarket_app/shared/component/components.dart';
import 'package:imarket_app/shared/component/constants.dart';

class VerifyScreen extends StatefulWidget {

  final String phoneNumber;
  String verificationId;

  VerifyScreen({required this.phoneNumber,required this.verificationId,
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  String code = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showLoading = false;
  void signInWithAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    setState(() {
      showLoading = true;
    });
    try{
      final authCredential = await auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if(authCredential.user != null){
        navigateTo(context, RegisterScreen(false));
      }
    } on FirebaseAuthException catch(e){
      setState(() {
        showLoading = false;
      });
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(e.message.toString()))
      );
    }

  }
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,size: 30,color: Colors.black,),
        ),
        title: Text(
          'تحقق من الرقم',
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
      body:showLoading?Center(child: CircularProgressIndicator(),): SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Code is sent to ' + widget.phoneNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),
                      Expanded(child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildCodeNumberBox(code.length>0?code.substring(0,1):''),
                          buildCodeNumberBox(code.length>1?code.substring(1,2)
                              :''),
                          buildCodeNumberBox(code.length>2?code.substring(2,3)
                              :''),
                          buildCodeNumberBox(code.length>3?code.substring(3,4)
                              :''),
                          buildCodeNumberBox(code.length>4?code.substring(4,5)
                              :''),
                          buildCodeNumberBox(code.length>5?code.substring(5,6)
                              :''),
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'الطلب مرة ثانية',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'لم يصل الكود؟',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF818181),

                              ),
                            ),


                          ],
                        ),
                      ),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            PhoneAuthCredential phoneAuthCredential = 
                                PhoneAuthProvider.credential(verificationId:
                                widget.verificationId, smsCode: code);
                            signInWithAuthCredential(phoneAuthCredential);
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
                                'تحقق وإنشاء الحساب',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
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
                      if(code.length<6){
                        code = code + value.toString();
                      }
                    }else{
                      code = code.substring(0,code.length -1);
                    }
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget buildCodeNumberBox(String codeNumber){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(Radius.circular(15),

            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
                spreadRadius: 1,
                offset: Offset(0.0,0.75),
              ),
            ]
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F)
              ),
            ),
          ),
        ),
      ),
    );
  }


}
