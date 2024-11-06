import 'dart:convert';

import 'package:app_pokedex/data/database/entity/meus_pokemons_database_entity.dart';
import 'package:app_pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:app_pokedex/domain/exception/mapper_exception.dart';
import 'package:app_pokedex/domain/meus_pokemons.dart';
import 'package:app_pokedex/domain/pokemon.dart';

class DatabaseMapper {
  Pokemon toPokemon(PokemonDatabaseEntity entity) {
    try {
      return Pokemon(
          id: entity.id.toString(),
          nome: entity.nome,
          attack: entity.attack,
          defense: entity.defense,
          hp: entity.hp,
          spAttack: entity.spAttack,
          spDefense: entity.spDefense,
          speed: entity.speed,
          tipo: List<String>.from(jsonDecode(entity.tipo)),
          url: entity.url);
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  List<Pokemon> toPokemons(List<PokemonDatabaseEntity> entities) {
    final List<Pokemon> pokemons = [];
    for (var movieEntity in entities) {
      pokemons.add(toPokemon(movieEntity));
    }
    return pokemons;
  }

  PokemonDatabaseEntity toPokemonDatabaseEntity(Pokemon pokemon) {
    try {
      return PokemonDatabaseEntity(
          id: null,
          nome: pokemon.nome,
          tipo: jsonEncode(pokemon.tipo),
          attack: pokemon.attack,
          defense: pokemon.defense,
          hp: pokemon.hp,
          spAttack: pokemon.spAttack,
          spDefense: pokemon.spDefense,
          speed: pokemon.speed,
          url: pokemon.url);
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  List<PokemonDatabaseEntity> topokemonDatabaseEntities(
      List<Pokemon> pokemons) {
    final List<PokemonDatabaseEntity> pokemonDatabaseEntities = [];
    for (var p in pokemons) {
      pokemonDatabaseEntities.add(toPokemonDatabaseEntity(p));
    }
    return pokemonDatabaseEntities;
  }

  MeusPokemons toMeuPokemon(MeusPokemonsDatabaseEntity entity) {
    try {
      return MeusPokemons(
        id: entity.id,
      );
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, MeusPokemons>(e.toString());
    }
  }

  List<MeusPokemons> toMeusPokemons(List<MeusPokemonsDatabaseEntity> entities) {
    final List<MeusPokemons> meusPokemons = [];
    for (var pokemonEntity in entities) {
      meusPokemons.add(toMeuPokemon(pokemonEntity));
    }
    return meusPokemons;
  }

  MeusPokemonsDatabaseEntity toMeusPokemonsDatabaseEntity(
      MeusPokemons meuspokemons) {
    try {
      return MeusPokemonsDatabaseEntity(
        id: meuspokemons.id,
      );
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, MeusPokemons>(e.toString());
    }
  }

  List<MeusPokemonsDatabaseEntity> tomeuspokemonsDatabaseEntities(
      List<MeusPokemons> meuspokemons) {
    final List<MeusPokemonsDatabaseEntity> meuspokemonDatabaseEntities = [];
    for (var mp in meuspokemons) {
      meuspokemonDatabaseEntities.add(toMeusPokemonsDatabaseEntity(mp));
    }
    return meuspokemonDatabaseEntities;
  }
}
