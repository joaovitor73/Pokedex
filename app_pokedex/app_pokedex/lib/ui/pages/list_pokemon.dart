import 'dart:async';

import 'package:app_pokedex/data/database/dao/base_dao.dart';
import 'package:app_pokedex/data/database/dao/pokemon_dao.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/pokemon.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:app_pokedex/ui/widget/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({super.key});

  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  late final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 1);
  late final PokemonRepositorImpl pokemonRepositorImpl;
  final PokemonDao pokemonDao = PokemonDao();
  @override
  void initState() {
    super.initState();
    pokemonRepositorImpl =
        Provider.of<PokemonRepositorImpl>(context, listen: false);
    //pokemonDao.deleteAndRecreateDatabase();
    _pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          final pokemons =
              await pokemonRepositorImpl.getPokemons(page: pageKey, limit: 5);
          _pagingController.appendPage(pokemons, pageKey + 1);
          print(pokemons.first.tipo);
        } catch (e) {
          _pagingController.error = e;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Pokemons",
      ),
      body: PagedListView<int, Pokemon>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Pokemon>(
          itemBuilder: (context, pokemon, index) =>
              PokemonCard(pokemon: pokemon),
        ),
      ),
    );
  }
}
