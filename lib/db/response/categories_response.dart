

class CategoriesMainResponse {
  CategoriesMainResponse({
    this.data,
  });

  List<CategoriesResponse>? data;

  factory CategoriesMainResponse.fromRawData(String str) =>
      CategoriesMainResponse.fromData(str);

  factory CategoriesMainResponse.fromData(data) => CategoriesMainResponse(
    data: List<CategoriesResponse>.from(data.map((x) => CategoriesResponse.fromSnapshot(x))),
  );

  Map<String, dynamic> toData() => {
    "data": List<dynamic>.from(data!.map((x) => x.toData())),
  };
}


class CategoriesResponse {
  CategoriesResponse({
    this.id,
    this.image,
    this.category_name,
  });

  int? id;
  String? image;
  String? category_name;

  factory CategoriesResponse.fromSnapshot(Map<String, dynamic> item) => CategoriesResponse(
    id: item['id'] ?? 0,
    image: item["image"] ?? '',
    category_name: item["category_name"] ?? '',
  );

  Map<String, dynamic> toData() => {
    "id": id,
    "image": image,
    "category_name": category_name,
  };
}