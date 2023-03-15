import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/layout/home_layout/home_cubit/cubit.dart';
import 'package:store_app/layout/home_layout/home_layout.dart';
import 'package:store_app/modules/home/home_screen.dart';
import 'package:store_app/shared/network/remote/add_product_post.dart';
import 'package:store_app/shared/network/remote/get_all_categories.dart';
import 'package:store_app/shared/network/remote/get_all_products.dart';
import 'package:store_app/shared/network/remote/get_category_products.dart';
import 'package:store_app/shared/network/remote/update_product_put.dart';

import 'shared/component/bloc_observer.dart';

void main()async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => BNBCubit(),
          )
        ],
          child: EasyLocalization(
              supportedLocales:const [Locale('en'),Locale('ar')],
              path: 'assets/translations',
              fallbackLocale: const Locale('en',),
              saveLocale: true,
              startLocale:const Locale("en"),
              child: const MyApp()
          )
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275,783.2727272727273),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeLayout(),
      ),
    );
  }
}

