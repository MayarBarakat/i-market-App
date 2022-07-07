import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imarket_app/layout/imarket_app/shop_layout.dart';
import 'package:imarket_app/modules/imarket_app/register/cupit/cubit.dart';
import 'package:imarket_app/shared/bloc_observer.dart';
import 'package:imarket_app/shared/cubit/cubit.dart';
import 'package:imarket_app/shared/cubit/states.dart';
import 'package:imarket_app/shared/network/local/cache_helper.dart';
import 'package:imarket_app/shared/network/remote/dio_helper.dart';
import 'package:imarket_app/shared/styles/themes.dart';

import 'modules/imarket_app/on_boarding/on_boarding_screen2.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp();


  bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
  Widget widget;
  if(onBoarding != null){
    widget = ShopLayout();
  }else{
    widget = SplashScreen();
  }

  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget? widget;
  const MyApp({Key? key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => ShopCubit()..loading(),
          ),

          BlocProvider(
            create: (BuildContext context) => ShopRegisterCubit(),
          ),

        ],
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme(),
                home: widget,
              );
            }));

  }
}


// (0xFF8B8B8B)
