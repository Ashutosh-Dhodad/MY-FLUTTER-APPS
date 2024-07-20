import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 dynamic database;

class player{
  final int jerno;
  final String name;

  player({required this.jerno, required this.name});

  Map<String, dynamic> playerMap(){
    return{
      'jerno':jerno,
      'name':name,
    };
  }
  @override
  String toString(){
    return '{jerno:$jerno, name:$name}';
  }
}


Future<void> insertplayerdata(player obj) async {
  final localDB = await database;
  localDB.insert(
    'team',
    obj.playerMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<player>> getplayerdata() async {
  final localDB = await database;
  List<Map<String, dynamic>> players = await localDB.query("team");
  return List.generate(players.length, (i) {

    return player(
      jerno: players[i]["jerno"],
      name: players[i]["name"],
     
    );
  });
}


Future<void> createDatabase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), "playersDB.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE team(
        jerno INT PRIMARY KEY,
        name Text
        )''');
    },
  );
}
