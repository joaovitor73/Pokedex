import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/meus_pokemons_crud.dart';
import 'package:app_pokedex/domain/pokemon_diario.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:app_pokedex/ui/widget/my_card_pokemon.dart';
import 'package:app_pokedex/utils/cor_pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonDiarioUi extends StatelessWidget {
  const PokemonDiarioUi({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessando o Pokémon diário a partir do provider
    final PokemonDiario pokemonDiario = Provider.of<PokemonDiario>(context);
    final MeusPokemonsCrud meusPokemonsCrud =
        Provider.of<MeusPokemonsCrud>(context, listen: false);
    final PokemonRepositorImpl pokemonRepositorImpl =
        Provider.of<PokemonRepositorImpl>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: CorPokemon.getTypeColor(
                      pokemonDiario.pokemonDiario!.tipo[0]) ??
                  Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                    80.0), // Raio para o canto inferior esquerdo
                bottomRight:
                    Radius.circular(80.0), // Raio para o canto inferior direito
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
                            pokemonDiario.pokemonDiario!.url),
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
                // Nome do Pokémon
                Center(
                  child: Text(
                    pokemonDiario.pokemonDiario!.nome,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Tipos do Pokémon
                Center(
                  child: Text(
                    '${pokemonDiario.pokemonDiario!.tipo.join(', ')}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Barra de progresso para Ataque
                Text(
                  'Ataque: ${pokemonDiario.pokemonDiario!.attack}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.attack /
                      100, // Valor entre 0 e 1
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                const SizedBox(height: 8),

                // Barra de progresso para Defesa
                Text(
                  'Defesa: ${pokemonDiario.pokemonDiario!.defense}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.defense / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                const SizedBox(height: 8),

                // Barra de progresso para HP
                Text(
                  'HP: ${pokemonDiario.pokemonDiario!.hp}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.hp / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 8),

                // Barra de progresso para Ataque Especial
                Text(
                  'Ataque Especial: ${pokemonDiario.pokemonDiario!.spAttack}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.spAttack / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                const SizedBox(height: 8),

                // Barra de progresso para Defesa Especial
                Text(
                  'Defesa Especial: ${pokemonDiario.pokemonDiario!.spDefense}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.spDefense / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
                const SizedBox(height: 8),

                // Barra de progresso para Velocidade
                Text(
                  'Velocidade: ${pokemonDiario.pokemonDiario!.speed}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                LinearProgressIndicator(
                  value: pokemonDiario.pokemonDiario!.speed / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () async {
          final int quantidadePokemons =
              await pokemonRepositorImpl.getMeusPokemonsLength();
          if (quantidadePokemons < 6) {
            await meusPokemonsCrud.adicionarPokemon(
              int.parse(pokemonDiario.pokemonDiario!.id ?? '0'),
              pokemonRepositorImpl,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                    '${pokemonDiario.pokemonDiario!.nome} foi adicionado aos seus Pokémons'),
              ),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                    'Você já tem 6 Pokémons, exclua um para adicionar outro'),
              ),
            );
            Navigator.pop(context);
          }
        },
        backgroundColor:
            CorPokemon.getTypeColor(pokemonDiario.pokemonDiario!.tipo[0]) ??
                Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
