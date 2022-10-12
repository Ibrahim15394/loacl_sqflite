import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);



  void initDatabase() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');

    openAppDatabase(path: path);

    print('AppDatabaseCreated');
    emit(AppDatabaseCreated());
  }

  void openAppDatabase({required String path}) async{
     openDatabase(
       path,
       version: 1,
       onCreate: (Database db, int version) async{
         print('Table Created');
         await db.execute('''
         CREATE TABLE users(
         id INTEGER PRIMARY KEY,
          name TEXT)
         ''');
       },
       onOpen: (Database db) {
        print('Database open');
        emit(AppDatabaseOpened());
       }
     );
  }

  TextEditingController usersNameController = TextEditingController();

  void insertUserData(Database database) async{
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO users(name) VALUES("some name")');

    });
  }

  void getUsersData(){}

  void updateUserData(){}


}
