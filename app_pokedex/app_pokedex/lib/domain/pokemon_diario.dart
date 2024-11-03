import 'package:app_pokedex/data/shared_preferences/prefres.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PokemonDiario extends ChangeNotifier {
  int _id = 2;

  int get id => _id;

  void pokemonDia(Prefes prefes) async {
    DateTime data = DateTime.now();
    bool novoDia = await prefes.novoDia(data);
    bool isNull = await prefes.isNullDate();
    if (novoDia || isNull) {
      prefes.setData(data);
      _gerarNovoPokemon(prefes);
    }
    notifyListeners();
  }

  _gerarNovoPokemon(Prefes prefes) {
    var idPok = Random().nextInt(10);
    prefes.setId(idPok);
    _id = idPok;
  }
}
