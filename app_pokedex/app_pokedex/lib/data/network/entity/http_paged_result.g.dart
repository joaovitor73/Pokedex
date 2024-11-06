// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_paged_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpPagedResult _$HttpPagedResultFromJson(Map<String, dynamic> json) =>
    HttpPagedResult(
      pokemon: (json['pokemon'] as List<dynamic>)
          .map((e) => PokemonEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HttpPagedResultToJson(HttpPagedResult instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon,
    };

PokemonEntity _$PokemonEntityFromJson(Map<String, dynamic> json) =>
    PokemonEntity(
      id: json['id'] as String,
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      spAttack: (json['spAttack'] as num).toInt(),
      spDefense: (json['spDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      name: json['name'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PokemonEntityToJson(PokemonEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
      'name': instance.name,
      'type': instance.type,
    };
