import 'package:app_pokedex/domain/exception/mapper_exception.dart';
import 'package:app_pokedex/domain/pokemon.dart';

import 'entity/http_paged_result.dart';

class NetworkMapper {
  Pokemon toPokemon(PokemonEntity entity) {
    try {
      return Pokemon(
          nome: entity.name,
          attack: entity.attack,
          defense: entity.defense,
          hp: entity.hp,
          spAttack: entity.spAttack,
          spDefense: entity.spDefense,
          speed: entity.speed,
          tipo: entity.type,
          url:
              "https://github.com/fanzeyi/pokemon.json/blob/master/images/${entity.id.toString().padLeft(3, '0')}.png");
    } catch (e) {
      throw MapperException<PokemonEntity, Pokemon>(e.toString());
    }
  }

  List<Pokemon> toPokemons(List<PokemonEntity> entities) {
    final List<Pokemon> pokemons = [];
    for (var pokemonEntity in entities) {
      pokemons.add(toPokemon(pokemonEntity));
    }
    return pokemons;
  }
}
