import 'package:app_pokedex/data/database/dao/base_dao.dart';
import 'package:app_pokedex/data/database/entity/meus_pokemons_database_entity.dart';
import 'package:app_pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:sqflite/sqflite.dart';

class MeusPokemonsDao extends BaseDao {
  Future<List<int>> selectAll() async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      MeusPokemonsDatabaseContract.meusPokemonsTable,
      orderBy: '${MeusPokemonsDatabaseContract.idColumn} ASC',
    );
    return List.generate(maps.length, (i) {
      return maps[i][MeusPokemonsDatabaseContract.idColumn] as int;
    });
  }

  Future<void> insert(int id) async {
    final Database db = await getDb();
    print("adicionando o pokemon de id: ${id}");
    await db.insert(MeusPokemonsDatabaseContract.meusPokemonsTable,
        {MeusPokemonsDatabaseContract.idColumn: id});
  }

  Future<int> getRowCount() async {
    final db = await getDb();
    var result = await db.rawQuery(
        'SELECT COUNT(*) FROM ${MeusPokemonsDatabaseContract.meusPokemonsTable}');
    int count = Sqflite.firstIntValue(result) ?? 0; //
    return count;
  }
}
