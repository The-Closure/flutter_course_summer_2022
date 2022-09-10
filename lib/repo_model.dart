class Repo {
  String? name;
  Location? location;
  List<Products>? products;
  List<Viechles>? viechles;

  Repo({this.name, this.location, this.products, this.viechles});

  Repo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['viechles'] != null) {
      viechles = <Viechles>[];
      json['viechles'].forEach((v) {
        viechles!.add(Viechles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (viechles != null) {
      data['viechles'] = viechles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? city;
  String? road;
  String? details;
  int? number;

  Location({this.city, this.road, this.details, this.number});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    road = json['road'];
    details = json['details'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['road'] = road;
    data['details'] = details;
    data['number'] = number;
    return data;
  }
}

class Products {
  String? name;
  int? price;
  int? qty;

  Products({this.name, this.price, this.qty});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['qty'] = qty;
    return data;
  }
}

class Viechles {
  String? type;
  int? speed;
  Location? location;

  Viechles({this.type, this.speed, this.location});

  Viechles.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    speed = json['speed'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['speed'] = speed;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}
