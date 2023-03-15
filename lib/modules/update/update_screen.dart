import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/shared/component/custom_text_field.dart';
import 'package:store_app/shared/network/remote/update_product_put.dart';

class UpdateScreen extends StatelessWidget {
   UpdateScreen({Key? key, required this.id, required this.category}) : super(key: key);
   final int id;
   final String category;
final TextEditingController nameCont = TextEditingController();
final TextEditingController descCont = TextEditingController();
final TextEditingController imageCont = TextEditingController();
final TextEditingController priceCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Update Product",
          style: TextStyle(
            //fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: Colors.black
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomStatelessTextField(
                labelText: "Product Name",
                controller: nameCont,
              ),
              SizedBox(height: 30.h),
              CustomStatelessTextField(
                labelText: "Product Description",
                controller: descCont,
              ),
              SizedBox(height: 30.h),
              CustomStatelessTextField(
                labelText: "Product Image",
                controller: imageCont,
              ),
              SizedBox(height: 30.h),
              CustomStatelessTextField(
                labelText: "Product Price",
                inputType: TextInputType.number,
                controller: priceCont,
              ),
              SizedBox(height: 40.h),
              MaterialButton(
                color: Colors.blue,
                  height: 40.h,
                  onPressed: () {
                  UpdateProduct().put(
                      id: id,
                      title: nameCont.text,
                      price: priceCont.text,
                      desc: descCont.text,
                      image: imageCont.text,
                      category: category,
                  ).then((value) {
                    print("Success");
                  });
                  },
                child: Text(
                    "Update Product",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
