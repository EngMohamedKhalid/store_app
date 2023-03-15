import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/shared/component/custom_card.dart';
import 'package:store_app/shared/network/remote/get_all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if(context.locale.languageCode=="en"){
              context.setLocale(Locale("ar"));
            }else{
              context.setLocale(Locale("en"));
            }
          },
          icon: Icon(
              Icons.language,
            color: Colors.blue,
            size: 35.sp,
          ),
        ),
        title: Text(
          "NewTrend".tr(),
          style: TextStyle(
            //fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            padding:  EdgeInsets.all(10.sp),
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down_circle,
                size: 30.sp,
                color: Colors.blue,
              ),
          )
        ],
      ),
      body:FutureBuilder<List<ProductModel>>(
        future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 60,
                    crossAxisSpacing: 5
                ),
                itemBuilder: (context, index) {
                  return customCard(productModel: products[index],context: context);
                },
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      )
    );
  }
}
