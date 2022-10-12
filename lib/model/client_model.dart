import 'package:local_sqflite/helper/constance.dart';

class ClientModel{
  int? id;
  String? name, phone, email ;

  ClientModel({this.id, this.name, this.phone, this.email});

  toJson(){
    return{
      name : columnName,
      phone: columnPhone,
      email: columnEmail,
    };
  }

  ClientModel.fromJson(Map<dynamic, dynamic>map){
    id = map[columnId];
    name = map[columnName];
    phone = map[columnPhone];
    email = map[columnEmail];
  }


}