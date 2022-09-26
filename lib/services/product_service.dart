import 'dart:math';

import 'package:flutter_course_summer_2022/models/product_model.dart';
import 'package:lorem_gen/lorem_gen.dart';

class ProductService {
  List<ProductModel> fetchAllProducts() {
    List<ProductModel> products = [];
    for (var i = 0; i < 100; i++) {
      products.add(ProductModel(
          desc: Lorem.word(numWords: 10),
          name: Lorem.word(numWords: 2),
          price: Random().nextInt(100).toDouble(),
          rate: Random().nextInt(5).toDouble()));
    }
    return products;
  }
}
