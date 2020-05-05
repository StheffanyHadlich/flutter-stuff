class PokemonsModel {
  final String name;
  final String weight;
  final String photo;

  PokemonsModel({this.name, this.weight, this.photo});

  factory PokemonsModel.fromJson(final json) {
    return PokemonsModel(
      name: json["name"],
      weight: json["weigth"],
      photo: json["sprites"]["front_default"]
    );
  }
}
