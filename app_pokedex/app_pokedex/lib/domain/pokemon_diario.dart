import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/data/shared_preferences/prefres.dart';
import 'package:app_pokedex/domain/pokemon.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PokemonDiario extends ChangeNotifier {
  Pokemon? _pokemonDiario;
  Pokemon? get pokemonDiario => _pokemonDiario;

  Future<void> pokemonDia(
      Prefes prefes, PokemonRepositorImpl pokemonRepositorImpl) async {
    DateTime data = DateTime.now();
    bool novoDia = await prefes.novoDia(data);
    bool isNull = await prefes.isNullDate();
    if (novoDia || isNull) {
      prefes.setData(data);
      _gerarNovoPokemon(prefes, pokemonRepositorImpl);
    } else {
      var idPok = await prefes.getId();
      _pokemonDiario = await pokemonRepositorImpl.getPokemon(id: idPok!);
      print(_pokemonDiario!.nome);
      print("Não é um novo dia");
    }
    notifyListeners();
  }

  _gerarNovoPokemon(
      Prefes prefes, PokemonRepositorImpl pokemonRepositorImpl) async {
    var idPok = Random().nextInt(await pokemonRepositorImpl.getLength());
    prefes.setId(idPok);
    print(_pokemonDiario?.nome);
    _pokemonDiario = await pokemonRepositorImpl.getPokemon(id: idPok);
  }
}
