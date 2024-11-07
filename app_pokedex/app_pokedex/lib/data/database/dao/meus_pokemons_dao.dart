import 'package:app_pokedex/data/database/dao/base_dao.dart';
import 'package:app_pokedex/data/database/entity/meus_pokemons_database_entity.dart';
import 'package:sqflite/sqflite.dart';

class MeusPokemonsDao extends BaseDao {
  Future<List<Map<String, dynamic>>> selectAll() async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      MeusPokemonsDatabaseContract.meusPokemonsTable,
      orderBy: '${MeusPokemonsDatabaseContract.idPokemonColumn} ASC',
    );

    // Retorna a lista com ambos os IDs (id e idPokemon)
    return List.generate(maps.length, (i) {
      return {
        'id': maps[i][MeusPokemonsDatabaseContract.idColumn],
        'idPokemon': maps[i][MeusPokemonsDatabaseContract.idPokemonColumn],
      };
    });
  }

  Future<void> insert(int idPokemon) async {
    final Database db = await getDb();
    print("adicionando o pokemon de id: ${idPokemon}");
    await db.insert(MeusPokemonsDatabaseContract.meusPokemonsTable,
        {MeusPokemonsDatabaseContract.idPokemonColumn: idPokemon});
  }

  Future<void> delete(int id) async {
    final Database db = await getDb();
    print("removendo o pokemon de id: ${id}");
    await db.delete(
      MeusPokemonsDatabaseContract.meusPokemonsTable,
      where: '${MeusPokemonsDatabaseContract.idColumn} = ?',
      whereArgs: [id],
    );
  }

  Future<int> getRowCount() async {
    final db = await getDb();
    var result = await db.rawQuery(
        'SELECT COUNT(*) FROM ${MeusPokemonsDatabaseContract.meusPokemonsTable}');
    int count = Sqflite.firstIntValue(result) ?? 0; //
    return count;
  }
}
