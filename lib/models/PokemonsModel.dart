class PokemonsModel {
  final String name;
  final String url;

  PokemonsModel({this.name, this.url});

  factory PokemonsModel.fromJson(final json) {
    return PokemonsModel(
      name: json["name"],
      url: json["url"]
    );
  }
}
