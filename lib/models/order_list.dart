class orderList {
  String? status;
  List<Result>? result;

  orderList({this.status, this.result});

  orderList.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  Null? userId;
  int? deliverId;
  int? sellerId;
  int? productQty;
  String? ownerName;
  String? ownerPhone;
  String? ownerAddress;
  String? orderDate;
  Null? procurementDate;
  Null? deliveryDate;
  String? orderStatus;
  String? paymentStatus;
  int? orderType;
  String? createdAt;
  String? updatedAt;
  Product? product;
  Seller? seller;
  Delivery? delivery;

  Result(
      {this.id,
      this.productId,
      this.userId,
      this.deliverId,
      this.sellerId,
      this.productQty,
      this.ownerName,
      this.ownerPhone,
      this.ownerAddress,
      this.orderDate,
      this.procurementDate,
      this.deliveryDate,
      this.orderStatus,
      this.paymentStatus,
      this.orderType,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.seller,
      this.delivery});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    deliverId = json['deliver_id'];
    sellerId = json['seller_id'];
    productQty = json['product_qty'];
    ownerName = json['owner_name'];
    ownerPhone = json['owner_phone'];
    ownerAddress = json['owner_address'];
    orderDate = json['order_date'];
    procurementDate = json['procurement_date'];
    deliveryDate = json['delivery_date'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    orderType = json['order_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['deliver_id'] = this.deliverId;
    data['seller_id'] = this.sellerId;
    data['product_qty'] = this.productQty;
    data['owner_name'] = this.ownerName;
    data['owner_phone'] = this.ownerPhone;
    data['owner_address'] = this.ownerAddress;
    data['order_date'] = this.orderDate;
    data['procurement_date'] = this.procurementDate;
    data['delivery_date'] = this.deliveryDate;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['order_type'] = this.orderType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery!.toJson();
    }
    return data;
  }
}

class Product {
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

  Product(
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
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Seller {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  int? age;
  String? phone;
  String? address;
  String? email;
  String? role;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Seller(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.age,
      this.phone,
      this.address,
      this.email,
      this.role,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Delivery {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  Null? age;
  String? phone;
  String? address;
  String? email;
  String? role;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Delivery(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.age,
      this.phone,
      this.address,
      this.email,
      this.role,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['role'] = this.role;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
