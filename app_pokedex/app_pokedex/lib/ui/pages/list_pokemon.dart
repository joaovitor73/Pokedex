import 'dart:async';

import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/pokemon.dart';
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
  @override
  void initState() {
    super.initState();
    pokemonRepositorImpl =
        Provider.of<PokemonRepositorImpl>(context, listen: false);

    _pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          final pokemons =
              await pokemonRepositorImpl.getPokemons(page: pageKey, limit: 10);
          _pagingController.appendPage(pokemons, pageKey + 1);
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
