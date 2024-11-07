import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:flutter/material.dart';

class MeusPokemonsCrud {
  Future<void> adicionarPokemon(
      int id, PokemonRepositorImpl pokemonRepository) async {
    await pokemonRepository.insertMeuPokemon(id);
  }

  Future<void> removerPokemon(
      int id, PokemonRepositorImpl pokemonRepository) async {
    await pokemonRepository.removerPokemon(id);
  }
}
