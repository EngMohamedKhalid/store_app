import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/add_model.dart';
import 'package:store_app/models/product_model.dart';
class AddProduct{
  Future<AddProductModel> post({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
})async{
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/products"),
        body: {
          "title":title,
          "price": price,
          "description": desc,
          "image": image,
          "category": category
        }
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return AddProductModel.fromJson(data);
  }
}











