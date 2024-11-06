import 'package:app_pokedex/data/database/dao/meus_pokemons_dao.dart';
import 'package:app_pokedex/data/database/dao/pokemon_dao.dart';
import 'package:app_pokedex/data/database/database_mapper.dart';
import 'package:app_pokedex/data/network/client/api_client.dart';
import 'package:app_pokedex/data/network/network_mapper.dart';
import 'package:app_pokedex/data/repository/pokemon_repository.dart';
import 'package:app_pokedex/domain/meus_pokemons_crud.dart';
import 'package:app_pokedex/domain/pokemon.dart';

class PokemonRepositorImpl implements PokemonRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonDao pokemonDao;
  final DatabaseMapper databaseMapper;
  final MeusPokemonsDao meusPokemonsDao;
  final MeusPokemonsCrud meusPokemonsCrud;

  PokemonRepositorImpl({
    required this.pokemonDao,
    required this.databaseMapper,
    required this.apiClient,
    required this.networkMapper,
    required this.meusPokemonsDao,
    required this.meusPokemonsCrud,
  });

  Future<List<Pokemon>> getMeusPokemons() async {
    final dbEntity = await meusPokemonsDao.selectAll();
    return databaseMapper
        .toPokemons((await pokemonDao.selectAllById(dbEntity)));
  }

  Future<void> insertMeuPokemon(int id) async {
    await meusPokemonsDao.insert(id);
  }

  @override
  Future<Pokemon> getPokemon({required int id}) async {
    final dbEntity = await pokemonDao.selectById(id);
    return databaseMapper.toPokemon(dbEntity);
  }

  @override
  Future<int> getLength() async {
    return await pokemonDao.getRowCount();
  }

  @override
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
