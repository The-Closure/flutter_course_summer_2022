import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/models/product_model.dart';
import 'package:flutter_course_summer_2022/services/product_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ThirdPage extends StatelessWidget {
  final ProductService productService = ProductService();
  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductsWidget(data: productService.fetchAllProducts()),
    );
  }
}

class ProductsWidget extends StatelessWidget {
  final List<ProductModel> data;
  const ProductsWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctxt, index) => ProductCard(item: data[index]),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.indigo, width: 5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 24, decoration: TextDecoration.underline),
                    ),
                    RatingBar.builder(
                      initialRating: item.rate,
                      ignoreGestures: true,
                      minRating: 1,
                      direction: Axis.horizontal,
                      //  allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    )
                  ],
                ),
                Text(
                  item.price.toString(),
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.desc,
              style: TextStyle(fontSize: 24),
            )
          ],
        ));
  }
}
