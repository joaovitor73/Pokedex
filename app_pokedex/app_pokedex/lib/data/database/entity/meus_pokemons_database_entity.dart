import 'package:json_annotation/json_annotation.dart';
part 'meus_pokemons_database_entity.g.dart';

@JsonSerializable()
class MeusPokemonsDatabaseEntity {
  @JsonKey(name: MeusPokemonsDatabaseContract.idColumn)
  final int? id;

  @JsonKey(name: MeusPokemonsDatabaseContract.idPokemonColumn)
  final int idPokemon;

  MeusPokemonsDatabaseEntity({
    required this.id,
    required this.idPokemon,
  });

  factory MeusPokemonsDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$MeusPokemonsDatabaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MeusPokemonsDatabaseEntityToJson(this);
}

abstract class MeusPokemonsDatabaseContract {
  static const String meusPokemonsTable = "meus_pokemon_table";
  static const String idColumn = "id";
  static const String idPokemonColumn = "id_pokemon";
}
