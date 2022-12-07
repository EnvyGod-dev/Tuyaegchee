import 'dart:convert';

class BrandList {
  String? status;
  List<Brands>? brandList;

  BrandList({this.status, this.brandList});

  BrandList.fromJson(dynamic json) {
    status = json["status"];
    if (json['result'] != null) {
      brandList = [];
      json['result'].forEach((v) {
        brandList?.add(Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["result"] = brandList;

    return map;
  }
}

class Brands {
  int? id;
  String? brand_name;
  String? type;
  String? created_at;
  String? updated_at;

  Brands({
    this.id,
    this.brand_name,
    this.type,
    this.created_at,
    this.updated_at,
  });

  Brands.fromJson(dynamic json) {
    id = json['id'];
    brand_name = json['brand_name'];
    type = json['type'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }
}
