class productModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? categoryId;
  String? image;
  String? createdAt;
  String? updatedAt;

  productModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.createdAt,
      this.updatedAt});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['category_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
