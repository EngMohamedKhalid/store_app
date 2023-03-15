import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/layout/home_layout/home_cubit/cubit.dart';
import 'package:store_app/layout/home_layout/home_cubit/states.dart';
import 'package:store_app/modules/home/home_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BNBCubit, BNBStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BNBCubit.getObject(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.current,
            onTap: (value) {
              cubit.changeCurrent(value);
            },
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home
                  ),
                  label: "Home".tr()
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.search
                  ),
                  label: "Search".tr()
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_shopping_cart,
                  ),
                  label: "Cart".tr()
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "Favourite".tr()
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Profile".tr()
              ),
                          ],
          ),
          body: HomeScreen(),
        );
      },
    );
  }
}
