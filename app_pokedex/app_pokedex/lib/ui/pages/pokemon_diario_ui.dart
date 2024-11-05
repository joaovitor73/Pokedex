import 'package:app_pokedex/domain/pokemon_diario.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonDiarioUi extends StatelessWidget {
  const PokemonDiarioUi({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonDiario pokemonDiario =
        Provider.of<PokemonDiario>(context, listen: true);
    return Scaffold(
      appBar: MyAppBar(title: "Encontro Diário"),
      body: Center(
        child: pokemonDiario.pokemonDiario == null
            ? CircularProgressIndicator() // Exibe um indicador de carregamento até o Pokémon ser carregado.
            : Text('Pokémon do dia: ${pokemonDiario.pokemonDiario!.nome}'),
      ),
    );
  }
}
