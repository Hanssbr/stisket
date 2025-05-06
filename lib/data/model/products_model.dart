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
  final String createdAt;
  final String updatedAt;
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

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stock: json['stock'],
        categoryId: json['category_id'],
        image: json['image'],
        status: json['status'],
        criteria: json['criteria'],
        favorite: json['favorite'],
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        category: Category.fromJson(json['category']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
        'category_id': categoryId,
        'image': image,
        'status': status,
        'criteria': criteria,
        'favorite': favorite,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'category': category.toJson(),
      };
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
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
