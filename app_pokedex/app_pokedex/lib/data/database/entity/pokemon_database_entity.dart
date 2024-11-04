import 'package:json_annotation/json_annotation.dart';
part 'pokemon_database_entity.g.dart';

@JsonSerializable()
class PokemonDatabaseEntity {
  @JsonKey(name: PokemonDatabaseContract.idColumn)
  final int? id;
  @JsonKey(name: PokemonDatabaseContract.nomeColumn)
  final String nome;
  @JsonKey(name: PokemonDatabaseContract.tipoColumn)
  final String tipo;
  @JsonKey(name: PokemonDatabaseContract.hpColumn)
  final int hp;
  @JsonKey(name: PokemonDatabaseContract.attackColumn)
  final int attack;
  @JsonKey(name: PokemonDatabaseContract.defenseColumn)
  final int defense;
  @JsonKey(name: PokemonDatabaseContract.spAttackColumn)
  final int spAttack;
  @JsonKey(name: PokemonDatabaseContract.spDefenseColumn)
  final int spDefense;
  @JsonKey(name: PokemonDatabaseContract.speedColumn)
  final int speed;
  @JsonKey(name: PokemonDatabaseContract.urlColumn)
  final String url;

  PokemonDatabaseEntity(
      {required this.id,
      required this.nome,
      required this.tipo,
      required this.attack,
      required this.defense,
      required this.hp,
      required this.spAttack,
      required this.spDefense,
      required this.speed,
      required this.url});

  factory PokemonDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonDatabaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDatabaseEntityToJson(this);
}

abstract class PokemonDatabaseContract {
  static const String pokemonTable = "pokemon_table";
  static const String idColumn = "id";
  static const String nomeColumn = "nome";
  static const String tipoColumn = "tipo";
  static const String hpColumn = "hp";
  static const String attackColumn = "attack";
  static const String defenseColumn = "defense";
  static const String spAttackColumn = "spAttack";
  static const String spDefenseColumn = "spDefense";
  static const String speedColumn = "speed";
  static const String urlColumn = "url";
}
