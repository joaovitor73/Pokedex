import 'package:json_annotation/json_annotation.dart';

part 'http_paged_result.g.dart';

@JsonSerializable()
class HttpPagedResult {
  List<PokemonEntity> pokemon;

  HttpPagedResult({
    required this.pokemon,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) =>
      _$HttpPagedResultFromJson(json);
}

@JsonSerializable()
class PokemonEntity {
  int id;
  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;
  String name;
  List<String> type;

  PokemonEntity({
    required this.id,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
    required this.name,
    required this.type,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);
}
