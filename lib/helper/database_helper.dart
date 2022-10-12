import 'package:local_sqflite/helper/constance.dart';
import 'package:local_sqflite/model/client_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  DatabaseHelper._();

  static late Database database;

  Future<Database> getDatabase() async {
    if (database != null) {
      return database;
    }
    database = await initDatabase();
    return database;
  }

  initDatabase() async {
    String path = join(await getDatabasesPath(), 'ClientData.db');

   return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
        CREATE TABLE $tableClient(
        $columnId INTEGER PRIMARY KEY ,
        $columnName TEXT ,
        $columnPhone TEXT ,
        $columnEmail TEXT)
        ''');
        });
  }

  Future<ClientModel> insertClient(ClientModel client) async {
    var dbClient =  database;
    await dbClient.insert(
        tableClient,
        client.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return client;
  }

  updateClient(ClientModel client)async{
    var dbClient = database;
    await dbClient.update(
        tableClient,
        client.toJson(),
      where: '$columnId = ?',
      whereArgs: [client.id],
    );
  }

  Future<ClientModel?> getClient(int id) async{
    var dbClient =  database;
   List<Map> maps = await dbClient.query(
      tableClient,
      where: '$columnId = ?',
      whereArgs: [id],
    );
   if(maps.isNotEmpty) {
     return ClientModel.fromJson(maps.first);
   }else{
     return null;
   }
  }

  Future<List<ClientModel>>getAllClient()async{
    var dbClient =  database;
    List<Map> maps = await dbClient.query(tableClient);

    return maps.isNotEmpty
        ? maps.map((client) => ClientModel.fromJson(client)).toList()
        : [];
  }

  Future<void> deleteClient(int id) async{

    var dbClient = database;
    dbClient.delete(
      tableClient,
      where: '$columnId = ?',
      whereArgs: [id],
    );

  }

}