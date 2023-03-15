import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;
class AllProductsServices{
  Future<List<ProductModel>> getAllProducts()async{
   http.Response response = await  http.get(Uri.parse("https://fakestoreapi.com/products"));
   List<dynamic> data = jsonDecode(response.body);
   List<ProductModel> productList = [];
   data.forEach((element){
     productList.add(ProductModel.fromJson(element));
   });
  return productList;
  }
}