import 'package:app_pokedex/data/database/dao/meus_pokemons_dao.dart';
import 'package:app_pokedex/data/database/dao/pokemon_dao.dart';
import 'package:app_pokedex/data/database/database_mapper.dart';
import 'package:app_pokedex/data/network/client/api_client.dart';
import 'package:app_pokedex/data/network/network_mapper.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/data/shared_preferences/prefres.dart';
import 'package:app_pokedex/domain/meus_pokemons_crud.dart';
import 'package:app_pokedex/domain/pokemon_diario.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    final api_client =
        ApiClient(baseUrl: "https://71e0-177-20-152-121.ngrok-free.app");
    final network_mapper = NetworkMapper();
    final database_mapper = DatabaseMapper();
    final pokemonDao = PokemonDao();
    final sharedPreferences = Prefes();
    final pokemonDiario = PokemonDiario();
    final meusPokemonsDao = MeusPokemonsDao();
    final meusPokemonsCrud = MeusPokemonsCrud();

    final pokemons_repository = PokemonRepositorImpl(
      apiClient: api_client,
      networkMapper: network_mapper,
      databaseMapper: database_mapper,
      pokemonDao: pokemonDao,
      meusPokemonsDao: meusPokemonsDao,
      meusPokemonsCrud: meusPokemonsCrud,
    );

    return ConfigureProviders(providers: [
      Provider<ApiClient>.value(value: api_client),
      Provider<NetworkMapper>.value(value: network_mapper),
      Provider<DatabaseMapper>.value(value: database_mapper),
      Provider<PokemonDao>.value(value: pokemonDao),
      Provider<PokemonRepositorImpl>.value(value: pokemons_repository),
      Provider<Prefes>.value(value: sharedPreferences),
      ChangeNotifierProvider<PokemonDiario>.value(value: pokemonDiario),
      Provider<MeusPokemonsCrud>.value(value: meusPokemonsCrud),
    ]);
  }
}
