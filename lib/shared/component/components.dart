import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/shared/component/size_config.dart';

import 'constants.dart';

Widget buildDefaultButton({
  required String text,
  required Function? function,
  required double height,
   required bool register,
}) {
  return SizedBox(
    width: double.infinity,
    height: getProportionsScreenHeight(height),
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: kPrimaryColor,
      onPressed:register? (){return function!();}:null,
      child: Text(
        text,
        style: TextStyle(
            fontSize: getProportionsScreenWidth(18), color: Colors.white),
      ),
    ),
  );
}

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(text.toUpperCase()));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  bool isPassword = false,
  required Function? validate,
  required String label,
  required IconData prefix,
  required String hint,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      textAlign: TextAlign.end,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (value) {
        return onSubmit!();
      },
      validator: (value) {
        return validate!(value);
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: hint,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: kPrimaryColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget titleWithMore({
  required String text,
  required onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getProportionsScreenWidth(20)),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
            onPressed: () {
              return onPressed();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
            ),
            label: Text('رؤية المزيد')),
        Spacer(),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionsScreenWidth(24),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget productCard(
    {required ProductForBuy product,
    required onLikePress,
    required onPress,
    required bool isFavorites,
    double aspectRetion = 1.02,
    double width = 140}) {
  return GestureDetector(
    onTap: () {
      return onPress();
    },
    child: SizedBox(
      width: getProportionsScreenWidth(width),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: aspectRetion,
            child: Container(
              padding: EdgeInsets.all(getProportionsScreenWidth(20)),
              decoration: BoxDecoration(
                color: kSecondColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(product.image),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            product.description,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
            ),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.pricePerProduct.toString(),
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionsScreenWidth(18),
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: onLikePress,
                  icon: Icon(
                    isFavorites
                        ? Icons.favorite_outlined
                        : Icons.favorite_border_rounded,
                    color: isFavorites ? kPrimaryColor : Colors.black,
                  ))
            ],
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
Widget IconButtonWithCounter(
  int number, {
  required onPress,
  required Widget icon,
}) {
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        height: getProportionsScreenWidth(46),
        width: getProportionsScreenWidth(46),
        decoration: BoxDecoration(
            color: kSecondColor.withOpacity(0.1), shape: BoxShape.circle),
        child: IconButton(
          icon: icon,
          onPressed: () {
            return onPress();
          },
        ),
      ),
      if (number != 0)
        Positioned(
          top: -3,
          right: 0,
          child: Container(
            height: getProportionsScreenWidth(16),
            width: getProportionsScreenWidth(16),
            decoration: BoxDecoration(
              color: Color(0xFFFF4848),
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.white),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: getProportionsScreenWidth(10),
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}

Widget roundediconBtn(
    {required onPress, required Widget icon, required color}) {
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        height: getProportionsScreenWidth(46),
        width: getProportionsScreenWidth(46),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: IconButton(
          icon: icon,
          onPressed: () {
            return onPress();
          },
        ),
      ),
    ],
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      return color = Colors.green;
      break;
    case ToastStates.WARNING:
      return color = Colors.amber;
      break;
    case ToastStates.ERROR:
      return color = Colors.red;
      break;
  }
  return color;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

//TODO buildListProduct
