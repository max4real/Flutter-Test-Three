import 'dart:ffi';

class Products {
  String id;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rate;
  int count;

  Products(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate,
      required this.count});

  factory Products.fromApi({required Map<String, dynamic> data}) {
    double rate = -1;
    int count = -1;

    if (data["rating"] != null) {
      rate = double.tryParse(data["rating"]["rate"].toString()) ?? -1;
      count = int.tryParse(data["rating"]["count"].toString()) ?? -1;
    }
    return Products(
        id: data["id"].toString(),
        title: data["title"].toString(),
        price: double.tryParse(data["price"].toString()) ?? -1,
        description: data["description"].toString(),
        category: data["category"].toString(),
        image: data["image"].toString(),
        rate: rate,
        count: count);
  }
}


/**
 * {"id":5,
 * "title":"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
 * "price":695,
 * "description":"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
 * "category":"jewelery",
 * "image":"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
 * "rating":{
 *  "rate":4.6,
 *  "count":400}
 * }
 */