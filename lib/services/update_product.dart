import 'package:flutter/material.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProducreService{
  
  Future<dynamic> updateProduct(
     {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id,}
  )async{
    var data= await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body:  {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    }, 
      );
      return ProductModel.fromJson(data);
  }
}