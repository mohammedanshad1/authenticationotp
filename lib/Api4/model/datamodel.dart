class datamodel {
  /// 1:create Variables

  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  String? image;

  ///2:create Constructor

  datamodel(
      {this.category,
      this.description,
      this.id,
      this.title,
      this.price,
      this.image});

  ///3: create fromjson

  factory datamodel.fromJson(Map<String, dynamic> json) {
    return datamodel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        price: json["price"]);
  }

  ///4: create tojson

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "image": image,
      "category": category,
      "description": description,
    };
  }
}
