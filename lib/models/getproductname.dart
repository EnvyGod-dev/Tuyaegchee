class productname {
  String? status;
  List<Result>? result;

  productname({this.status, this.result});

  productname.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  int? categoryId;
  int? brandId;
  String? barcode;
  String? productName;
  int? productQty;
  int? productPrice;
  int? type;
  int? isdel;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  Result(
      {this.id,
      this.categoryId,
      this.brandId,
      this.barcode,
      this.productName,
      this.productQty,
      this.productPrice,
      this.type,
      this.isdel,
      this.createdAt,
      this.updatedAt,
      this.brand});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    barcode = json['barcode'];
    productName = json['product_name'];
    productQty = json['product_qty'];
    productPrice = json['product_price'];
    type = json['type'];
    isdel = json['isdel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['barcode'] = this.barcode;
    data['product_name'] = this.productName;
    data['product_qty'] = this.productQty;
    data['product_price'] = this.productPrice;
    data['type'] = this.type;
    data['isdel'] = this.isdel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? brandName;
  String? type;
  String? createdAt;
  String? updatedAt;

  Brand({this.id, this.brandName, this.type, this.createdAt, this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
