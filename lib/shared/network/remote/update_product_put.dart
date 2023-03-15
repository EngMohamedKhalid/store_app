import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/add_model.dart';
class UpdateProduct{
  Future<AddProductModel> put({
    required int id,
    required String title,
    required dynamic price,
    required String desc,
    required String image,
    required String category,
  })async{
    http.Response response = await http.put(
        Uri.parse("https://fakestoreapi.com/products/$id"),
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











