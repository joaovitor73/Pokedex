// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_paged_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpPagedResult _$HttpPagedResultFromJson(Map<String, dynamic> json) =>
    HttpPagedResult(
      pokemon: (json['data'] as List<dynamic>)
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
      hp: (json['base']['HP'] as num).toInt(), // Acessa 'base' primeiro
      attack: (json['base']['Attack'] as num).toInt(),
      defense: (json['base']['Defense'] as num).toInt(),
      spAttack: (json['base']['Sp. Attack'] as num).toInt(),
      spDefense: (json['base']['Sp. Defense'] as num).toInt(),
      speed: (json['base']['Speed'] as num).toInt(),
      name: json['name']['english'] as String, // Especifica o nome em inglês
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PokemonEntityToJson(PokemonEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'HP': instance.hp,
      'Attack': instance.attack,
      'Defense': instance.defense,
      'Sp. Attack': instance.spAttack,
      'Sp. Defense': instance.spDefense,
      'Speed': instance.speed,
      'name': instance.name,
      'type': instance.type,
    };
