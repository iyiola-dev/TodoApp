import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:providers/models/todo.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class ToDodb {
  static final ToDodb _singleton = ToDodb._internal();

  ToDodb._internal();

  factory ToDodb() {
    return _singleton;
  }

  DatabaseFactory dbFactory = databaseFactoryIo;
  final store = intMapStoreFactory.store('todos');
  Database _database;
  Future<Database> get database async {
    if (_database == null) {
      await _openDb().then((db) {
        _database = db;
      });
    }
    return _database;
  }

  Future _openDb() async {
    final docspath = await getApplicationDocumentsDirectory();
    final dbpath = join(docspath.path, 'todos.db');
    return await dbFactory.openDatabase(dbpath);
  }

//deleting the task from all the tasks
  Future deleteTodo(ToDo todo) async {
    final finder = Finder(filter: Filter.byKey(todo.taskId));

    await store.delete(_database, finder: finder);
  }

//inserting the values in the database
  Future insertTodo(ToDo toDo) async {
    await store.add(_database, toDo.toMap());
  }

  ///updating the items that i display
  Future updateTodo(ToDo toDo) async {
    final finder = Finder(filter: Filter.byKey(toDo.taskId));

    await store.update(_database, toDo.toMap(), finder: finder);
  }

//getting the list of the items
  Future<List<ToDo>> getTodos() async {
    await database;
    final finder = Finder(sortOrders: [SortOrder('priority'), SortOrder('taskId')]);
    final todoSnapshot = await store.find(_database, finder: finder);

    return todoSnapshot.map((snapshot) {
      final todo = ToDo.fromMap(snapshot.value);
      todo.taskId = snapshot.key;
      return todo;
    }).toList();
  }
}
