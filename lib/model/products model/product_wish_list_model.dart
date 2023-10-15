class ProductWishListModel {
  int? id;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  dynamic product;

  ProductWishListModel(
      {this.id,
      this.email,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.product});

  ProductWishListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product'] = product;
    return data;
  }
}
