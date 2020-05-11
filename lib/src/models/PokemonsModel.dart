class PokemonsModel {
  final String name;
  final int weight;
  final String photo;

  PokemonsModel({this.name, this.weight, this.photo});

  factory PokemonsModel.fromJson(final json) {
    return PokemonsModel(
      name: json["name"],
      weight: json["weight"],
      photo: json["sprites"]["front_default"]
    );
  }
}
