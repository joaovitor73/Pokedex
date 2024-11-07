import 'package:app_pokedex/domain/pokemon.dart';
import 'package:app_pokedex/ui/widget/my_app_bar.dart';
import 'package:app_pokedex/ui/widget/pokemon_card.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pokedex/data/repository/pokemon_repository_impl.dart';

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
      appBar: const MyAppBar(title: "Meus Pokémons"),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum Pokémon encontrado.'));
          } else {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                var pokemon = pokemons[index];
                return GestureDetector(
                  onLongPress: () async {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      title: 'Deseja remover este Pokémon?',
                      desc:
                          'Tem certeza que deseja remover ${pokemon.nome} da sua lista?',
                      btnCancelText: 'Cancelar',
                      btnCancelOnPress: () {},
                      btnOkText: 'Remover',
                      btnOkOnPress: () async {
                        // Remover Pokémon da lista
                        await pokemonRepositorImpl.removerPokemon(
                            int.tryParse(pokemon.id ?? '0') ?? 0);
                        setState(() {
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
                    );
                  },
                  child: PokemonCard(pokemon: pokemon),
                );
              },
            );
          }
        },
      ),
    );
  }
}
