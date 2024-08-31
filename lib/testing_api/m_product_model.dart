class ProductsClass {
  String id;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rate;
  int count;
  int cartQty;
  ProductsClass({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
    this.cartQty = 0
  });

  factory ProductsClass.fromAPI({required Map<String, dynamic> data}) {
    double rate_ = -1;
    int count_ = -1;
    if (data["rating"] != null) {
      rate_ = double.tryParse(data["rating"]["rate"].toString()) ?? -1;
      count_ = int.tryParse(data["rating"]["count"].toString()) ?? -1;
    }

    return ProductsClass(
      id: data["id"].toString(),
      title: data["title"].toString(),
      price: double.tryParse(data["price"].toString()) ?? -1,
      description: data["description"].toString(),
      category: data["category"].toString(),
      image: data["image"].toString(),
      rate: rate_,
      count: count_,
    );
  }
}

/**
 * {id: 1, 
 * title: Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, 
 * price: 109.95, 
 * description: Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday, 
 * category: men's clothing, 
 * image: https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg, 
 * rating: 
 * {  rate: 3.9, 
 *    count: 120}}
 */