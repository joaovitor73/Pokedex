import 'package:app_pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:app_pokedex/domain/exception/mapper_exception.dart';
import 'package:app_pokedex/domain/pokemon.dart';

class DatabaseMapper {
  Pokemon toPokemon(PokemonDatabaseEntity entity) {
    try {
      return Pokemon(
          nome: entity.nome,
          attack: entity.attack,
          defense: entity.defense,
          hp: entity.hp,
          spAttack: entity.spAttack,
          spDefense: entity.spDefense,
          speed: entity.speed,
          // tipo: entity.typeColumn,
          url: entity.url);
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  List<Pokemon> toPokemons(List<PokemonDatabaseEntity> entities) {
    final List<Pokemon> movies = [];
    for (var movieEntity in entities) {
      movies.add(toPokemon(movieEntity));
    }
    return movies;
  }

  PokemonDatabaseEntity toPokemonDatabaseEntity(Pokemon pokemon) {
    try {
      return PokemonDatabaseEntity(
          id: null,
          nome: pokemon.nome,
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
    final List<PokemonDatabaseEntity> movieDatabaseEntities = [];
    for (var p in pokemons) {
      movieDatabaseEntities.add(toPokemonDatabaseEntity(p));
    }
    return movieDatabaseEntities;
  }
}
