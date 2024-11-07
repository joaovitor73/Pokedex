import 'package:app_pokedex/core/configure_providers.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/meus_pokemons.dart';
import 'package:app_pokedex/ui/pages/list_pokemon.dart';
import 'package:app_pokedex/ui/pages/meus_pokemos_ui.dart';
import 'package:app_pokedex/ui/pages/pokemon_diario_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final data = await ConfigureProviders.createDependencyTree();

  runApp(
    MultiProvider(
      providers: data.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListPokemon(),
        '/pokemonDiario': (context) => const PokemonDiarioUi(),
        '/meusPkemons': (context) => const MeusPokemonsPageUi()
      },
    );
  }
}
