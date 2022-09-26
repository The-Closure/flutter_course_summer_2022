class ProductModel {
  String name = '';
  double price = 0.0;
  double rate = 0.0;
  String desc = '';

  ProductModel(
      {required this.desc,
      required this.name,
      required this.price,
      required this.rate});

  ProductModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    price = data['price'];
    rate = data['rate'];
    desc = data['desc'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['price'] = price;
    data['rate'] = rate;
    data['desc'] = desc;
    return data;
  }
}
