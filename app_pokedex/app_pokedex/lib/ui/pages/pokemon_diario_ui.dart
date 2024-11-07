import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/meus_pokemons_crud.dart';
import 'package:app_pokedex/domain/pokemon_diario.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:app_pokedex/utils/cor_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonDiarioUi extends StatelessWidget {
  const PokemonDiarioUi({super.key});
  @override
  Widget build(BuildContext context) {
    late int quantidadePokemons;
    final PokemonDiario pokemonDiario =
        Provider.of<PokemonDiario>(context, listen: true);
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
                  top: 60,
                  child: Text(
                    pokemonDiario.pokemonDiario!.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 7,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pokemonDiario.pokemonDiario!.url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () async => {
          quantidadePokemons =
              await pokemonRepositorImpl.getMeusPokemonsLength(),
          if (quantidadePokemons < 6)
            {
              await meusPokemonsCrud.adicionarPokemon(
                  int.parse(pokemonDiario.pokemonDiario!.id ?? '0'),
                  pokemonRepositorImpl),
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                      '${pokemonDiario.pokemonDiario!.nome} foi adicionado aos seus Pokémons'),
                ),
              ),
              Navigator.pop(context),
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                      'Você já tem 6 Pokémons, exclua um para adicionar outro'),
                ),
              ),
              Navigator.pop(context)
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
