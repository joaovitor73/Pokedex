import 'package:app_pokedex/domain/pokemon.dart';
import 'package:app_pokedex/utils/cor_pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      color: pokemon.tipo != null
          ? CorPokemon.getTypeColor(pokemon.tipo[0]) ?? Colors.white
          : Colors.white,
      child: Row(
        children: [
          if (pokemon.url != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(imageUrl: pokemon.url),
                  ),
                ),
              ),
            )
          else
            const Icon(
              Icons.image_not_supported,
              size: 100,
              color: Colors.black,
            ),
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
                    "${pokemon.nome} (${pokemon.tipo})",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
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
