import 'package:app_pokedex/domain/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Text(
                    "${pokemon.nome} (${pokemon.hp})",
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
