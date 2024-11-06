import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:app_pokedex/domain/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';

class MeusPokemonsUI extends StatelessWidget {
  const MeusPokemonsUI({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo a instância do repositório usando o Provider
    PokemonRepositorImpl pokemonRepositorImpl =
        Provider.of<PokemonRepositorImpl>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pokémons'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonRepositorImpl
            .getMeusPokemons(), // Carrega a lista de Pokémon
        builder: (context, snapshot) {
          // Verifica se os dados estão prontos
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Exibe um indicador de progresso
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar Pokémons'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum Pokémon encontrado'));
          } else {
            // Lista de Pokémons carregada com sucesso
            var pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                var pokemon = pokemons[index];
                return ListTile(
                  leading: Image.network(
                    pokemon.url, // URL da imagem do Pokémon
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pokemon.nome), // Nome do Pokémon
                );
              },
            );
          }
        },
      ),
    );
  }
}
