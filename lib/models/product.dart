class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  Product({required this.id, required this.title, required this.description, required this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}
