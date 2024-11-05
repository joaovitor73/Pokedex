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
        body: Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.only(
              bottomLeft:
                  Radius.circular(80.0), // Raio para o canto inferior esquerdo
              bottomRight:
                  Radius.circular(80.0), // Raio para o canto inferior direito
            ),
            image: DecorationImage(
                image: NetworkImage(pokemonDiario.pokemonDiario!.url),
                scale: 1,
                fit: BoxFit.cover),
          ),
        ));
  }
}
