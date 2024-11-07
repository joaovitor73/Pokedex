import 'package:app_pokedex/domain/pokemon.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeusPokemonsPageUi extends StatefulWidget {
  const MeusPokemonsPageUi({super.key});

  @override
  _MeusPokemonsPageUiState createState() => _MeusPokemonsPageUiState();
}

class _MeusPokemonsPageUiState extends State<MeusPokemonsPageUi> {
  late Future<List<Pokemon>> _pokemonsFuture;
  late PokemonRepositorImpl pokemonRepositorImpl;
  @override
  void initState() {
    super.initState();
    pokemonRepositorImpl =
        Provider.of<PokemonRepositorImpl>(context, listen: false);
    _pokemonsFuture = pokemonRepositorImpl.getMeusPokemonsComIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meus Pokémons")),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum Pokémon encontrado.'));
          } else {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                var pokemon = pokemons[index];
                return GestureDetector(
                  onTap: () async {
                    // Remover Pokémon da lista
                    await pokemonRepositorImpl
                        .removerPokemon(int.tryParse(pokemon.id ?? '0') ?? 0);

                    // Atualizar a tela com setState
                    setState(() {
                      // Recarregar os pokemons após a remoção
                      _pokemonsFuture =
                          pokemonRepositorImpl.getMeusPokemonsComIds();
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${pokemon.nome} foi excluído'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: pokemon.url,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(pokemon.nome),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
