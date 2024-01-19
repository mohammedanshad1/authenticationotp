class modeldata{
  /// 1:create Variables

  int? id;
  String? name;
  String? email;
  String? profession;


  ///2:create Constructor

  modeldata(
      {
        this.id,
        this.name,
        this.email,
        this.profession});

  ///3: create fromjson

  factory modeldata.fromJson(Map<String, dynamic> json) {
    return modeldata(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profession: json["profession"]);

  }

  ///4: create tojson

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "profession": profession,

    };
  }
}
