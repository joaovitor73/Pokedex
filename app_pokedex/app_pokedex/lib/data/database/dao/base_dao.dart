import 'package:app_pokedex/data/database/entity/meus_pokemons_database_entity.dart';
import 'package:app_pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseVersion = 1;
  static const _databaseName = 'pokemon_database.db';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createPokemonsTableV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
  }

  void _createPokemonsTableV1(Batch batch) {
    // Criação da tabela principal de Pokémon
    batch.execute('''
    CREATE TABLE ${PokemonDatabaseContract.pokemonTable} (
      ${PokemonDatabaseContract.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PokemonDatabaseContract.nomeColumn} TEXT NOT NULL,
      ${PokemonDatabaseContract.tipoColumn} TEXT NOT NULL,
      ${PokemonDatabaseContract.hpColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.attackColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.defenseColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.spAttackColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.spDefenseColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.speedColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.urlColumn} TEXT NOT NULL
    );
    ''');

    // Criação da tabela para os Pokémon do usuário
    batch.execute('''
    CREATE TABLE ${MeusPokemonsDatabaseContract.meusPokemonsTable} (
      ${MeusPokemonsDatabaseContract.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT, 
      ${MeusPokemonsDatabaseContract.idPokemonColumn} INTEGER NOT NULL  
    );
''');
  }

  Future<void> deleteAndRecreateDatabase() async {
    Database db = await _getDatabase();
    final batch = db.batch();
    batch.execute(
        'DROP TABLE IF EXISTS ${PokemonDatabaseContract.pokemonTable}');
    _createPokemonsTableV1(batch);
    await batch.commit();
  }
}
