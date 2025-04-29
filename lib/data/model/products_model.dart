class Products {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final int categoryId;
  final String image;
  final String status;
  final String criteria;
  final int favorite;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category category;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.categoryId,
    required this.image,
    required this.status,
    required this.criteria,
    required this.favorite,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stock: json['stock'],
        categoryId: json['categoryId'],
        image: json['image'],
        status: json['status'],
        criteria: json['criteria'],
        favorite: json['favorite'],
        deletedAt: json['deletedAt'],
        createdAt: json['createdAt'],
        updatedAt: json['updateAt'],
        category: json['category']);
  }
}

class Category {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
}


