import 'package:app_pokedex/domain/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({required int page, required int limit});
}
