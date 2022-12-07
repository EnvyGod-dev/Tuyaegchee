class OrderCreate {
  String? status;
  Result? result;

  OrderCreate({this.status, this.result});

  OrderCreate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? productId;
  String? ownerName;
  String? ownerPhone;
  String? ownerAddress;
  String? productQty;
  int? sellerId;
  String? orderDate;
  String? orderStatus;
  String? updatedAt;
  String? createdAt;
  int? id;

  Result(
      {this.productId,
      this.ownerName,
      this.ownerPhone,
      this.ownerAddress,
      this.productQty,
      this.sellerId,
      this.orderDate,
      this.orderStatus,
      this.updatedAt,
      this.createdAt,
      this.id});

  Result.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    ownerName = json['owner_name'];
    ownerPhone = json['owner_phone'];
    ownerAddress = json['owner_address'];
    productQty = json['product_qty'];
    sellerId = json['seller_id'];
    orderDate = json['order_date'];
    orderStatus = json['order_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['owner_name'] = this.ownerName;
    data['owner_phone'] = this.ownerPhone;
    data['owner_address'] = this.ownerAddress;
    data['product_qty'] = this.productQty;
    data['seller_id'] = this.sellerId;
    data['order_date'] = this.orderDate;
    data['order_status'] = this.orderStatus;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
