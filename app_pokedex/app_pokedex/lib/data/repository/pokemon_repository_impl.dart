import 'package:app_pokedex/data/database/dao/pokemon_dao.dart';
import 'package:app_pokedex/data/database/database_mapper.dart';
import 'package:app_pokedex/data/network/client/api_client.dart';
import 'package:app_pokedex/data/network/network_mapper.dart';
import 'package:app_pokedex/data/repository/pokemon_repository.dart';
import 'package:app_pokedex/domain/pokemon.dart';

class PokemonRepositorImpl implements PokemonRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonDao pokemonDao;
  final DatabaseMapper databaseMapper;

  PokemonRepositorImpl({
    required this.pokemonDao,
    required this.databaseMapper,
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<Pokemon>> getPokemons(
      {required int page, required int limit}) async {
    //Tentar carregar a partir do banco de dados
    final dbEntities = await pokemonDao.selectAll(
        limit: limit, offset: (page * limit) - limit);
    //Se o dado já existe, carregar esse dado.
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toPokemons(dbEntities);
    }
    //Caso contrário, buscar pela API remota
    final networkEntity = await apiClient.getPokemons(page: page, limit: limit);

    final pokemons = networkMapper.toPokemons(networkEntity);
    //E salvar os dados no banco local para cash
    pokemonDao.insertAll(databaseMapper.topokemonDatabaseEntities(pokemons));
    return pokemons;
  }
}
