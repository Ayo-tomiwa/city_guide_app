class DataModel {
  String name;
  String img;
  String price;
  String people;
  String stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        img: json["img"],
        price: json["price"],
        people: json["price"],
        stars: json["price"],
        description: json["description"],
        location: json["location"]);
  }
}
