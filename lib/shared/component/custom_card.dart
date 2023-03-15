import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/modules/update/update_screen.dart';

Widget customCard({
  required ProductModel productModel,
  required BuildContext context
}){
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UpdateScreen(id: productModel.id,category: productModel.category,),)
      );
    },
    child: Stack(
      // alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200.w,
          height: 200.h,
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${productModel.title}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${productModel.price}",
                      style: TextStyle(
                        //fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ) ,
          ),
        ),
        Positioned(
          bottom: 120.sp,
          right: 20.sp,
          child: Image.network(
            "${productModel.image}",
            height: 100.h,
            width: 100.w,
          ),
        ),
      ],
    ),
  );
}