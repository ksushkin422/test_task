

class ProductsMainResponse {
  ProductsMainResponse({
    this.data,
  });

  List<ProductsResponse>? data;

  factory ProductsMainResponse.fromRawData(String str) =>
      ProductsMainResponse.fromData(str);

  factory ProductsMainResponse.fromData(data) => ProductsMainResponse(
    data: List<ProductsResponse>.from(data.map((x) => ProductsResponse.fromSnapshot(x))),
  );

  Map<String, dynamic> toData() => {
    "data": List<dynamic>.from(data!.map((x) => x.toData())),
  };
}


class ProductsResponse {
  ProductsResponse({
    this.id,
    this.image,
    this.category_id,
    this.composition,
    this.description,
    this.name,
    this.packaging,
  });

  int? id;
  List<dynamic>? image;
  int? category_id;
  String? composition;
  String? description;
  String? name;
  List<Packaging>? packaging;

  factory ProductsResponse.fromSnapshot(Map<String, dynamic> item) => ProductsResponse(
    id: item['id'] ?? 0,
    image: item["image"] ?? [],
    category_id: item["category_id"] ?? 0,
    composition: item["composition"] ?? '',
    description: item["description"] ?? '',
    name: item["name"] ?? '',
    packaging: List<Packaging>.from(item["packaging"].map((x)=> Packaging.fromData(x))) ?? [],
  );

  Map<String, dynamic> toData() => {
    "id": id,
    "image": image,
    "category_id": category_id,
    "composition": composition,
    "description": description,
    "name": name,
    "packaging": List<dynamic>.from(packaging!.map((x) => x.toData())),
  };
}


class Packaging {
  Packaging({
    this.price,
    this.size,
    this.id,
    this.selected,
  });

  int? price;
  String? size;
  int? id;
  int? selected;

  factory Packaging.fromRawData(Map<String, dynamic> item) =>
      Packaging.fromData(item);

  Map<String, dynamic> toRawData() => toData();

  factory Packaging.fromData(Map<String, dynamic> data) =>
      Packaging(
        price: data["price"]??0,
        size: data["size"]??'',
        id: data["id"]??0,
        selected: 0,
      );

  Map<String, dynamic> toData() => {
    "price": price,
    "size": size,
    "id": id,
    "selected": selected,
  };
}