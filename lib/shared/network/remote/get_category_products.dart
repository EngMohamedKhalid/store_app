import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';
class GetCategoryProducts{
  List<ProductModel> productList = [];
  Future<List<ProductModel>> getCategoryProducts({required String categoryName })async{
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/category/$categoryName")
    );
    List<dynamic> data = jsonDecode(response.body);
    for(int i = 0 ; i<data.length; i++){
      productList.add(
        ProductModel.fromJson(data[i])
      );
    }
    return productList;
  }
}