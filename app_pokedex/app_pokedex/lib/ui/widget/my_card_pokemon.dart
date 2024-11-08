import 'package:app_pokedex/domain/pokemon_diario.dart';
import 'package:app_pokedex/utils/cor_pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCardPokemon extends StatelessWidget {
  const MyCardPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDiario pokemon =
        Provider.of<PokemonDiario>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              color:
                  CorPokemon.getTypeColor(pokemon.pokemonEscolhido!.tipo[0]) ??
                      Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80.0),
                bottomRight: Radius.circular(80.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 7,
                  right: 55,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            pokemon.pokemonEscolhido!.url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    pokemon.pokemonEscolhido!.nome,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    '${pokemon.pokemonEscolhido!.tipo.join(', ')}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ataque: ${pokemon.pokemonEscolhido!.attack}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.attack /
                      100, // Valor entre 0 e 1
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                const SizedBox(height: 8),
                Text(
                  'Defesa: ${pokemon.pokemonEscolhido!.defense}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.defense / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                const SizedBox(height: 8),
                Text(
                  'HP: ${pokemon.pokemonEscolhido!.hp}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.hp / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ataque Especial: ${pokemon.pokemonEscolhido!.spAttack}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.spAttack / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                const SizedBox(height: 8),
                Text(
                  'Defesa Especial: ${pokemon.pokemonEscolhido!.spDefense}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.spDefense / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
                const SizedBox(height: 8),
                Text(
                  'Velocidade: ${pokemon.pokemonEscolhido!.speed}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemon.pokemonEscolhido!.speed / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
