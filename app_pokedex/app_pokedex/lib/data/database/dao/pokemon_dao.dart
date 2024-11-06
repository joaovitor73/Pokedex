import 'package:app_pokedex/data/database/dao/base_dao.dart';
import 'package:app_pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDao extends BaseDao {
  Future<List<PokemonDatabaseEntity>> selectAll({
    int? limit,
    int? offset,
  }) async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonDatabaseContract.pokemonTable,
      limit: limit,
      offset: offset,
      orderBy: '${PokemonDatabaseContract.idColumn} ASC',
    );
    return List.generate(maps.length, (i) {
      return PokemonDatabaseEntity.fromJson(maps[i]);
    });
  }

  Future<PokemonDatabaseEntity> selectById(int id) async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonDatabaseContract.pokemonTable,
      where: '${PokemonDatabaseContract.idColumn} = ?',
      whereArgs: [id],
    );
    return PokemonDatabaseEntity.fromJson(maps.first);
  }

  Future<List<PokemonDatabaseEntity>> selectAllById(List<int> ids) async {
    final List<PokemonDatabaseEntity> pokemons = [];
    for (int id in ids) {
      pokemons.add(await selectById(id));
    }
    return pokemons;
  }

  Future<void> insert(PokemonDatabaseEntity entity) async {
    final Database db = await getDb();
    await db.insert(PokemonDatabaseContract.pokemonTable, entity.toJson());
  }

  Future<void> insertAll(List<PokemonDatabaseEntity> entities) async {
    final Database db = await getDb();

    await db.transaction((transaction) async {
      for (final entity in entities) {
        print(
            'Inserindo entidade: ${entity.toJson()}'); // Print antes da inserção
        await transaction.insert(
            PokemonDatabaseContract.pokemonTable, entity.toJson());
        print('Entidade inserida com sucesso.'); // Print após a inserção
      }
    });

    print('Todas as entidades foram inseridas.');
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(PokemonDatabaseContract.pokemonTable);
  }

  Future<int> getRowCount() async {
    final db = await getDb();
    var result = await db.rawQuery(
        'SELECT COUNT(*) FROM ${PokemonDatabaseContract.pokemonTable}');
    int count = Sqflite.firstIntValue(result) ?? 0; //
    return count;
  }
}
