class ProductModel {
  String id;
  String title;
  double price;
  String category;
  String description;
  String image;
  double rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image,
      required this.description,
      required this.rating});

  /*
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
      "rate": 3.9,
      "count": 120
    }
  }
  * */
  factory ProductModel.fromApi({required Map<String, dynamic> data}) {
    double rating = -1;

    if (data["rating"] != null) {
      rating = double.tryParse(data["rating"]["rate"].toString()) ?? -1;
    }

    return ProductModel(
        id: data["id"].toString(),
        title: data["title"].toString(),
        category: data["category"].toString(),
        image: data["image"].toString(),
        price: double.tryParse(data["price"].toString()) ?? -1,
        description: data["description"].toString(),
        rating: rating);
  }
}
