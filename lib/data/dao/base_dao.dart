import 'package:counter_app/data/entity/task_db_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseName = 'tasks_db.db';

  static const taskTableName = 'task';

  @protected
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createRecipeTable(batch);
        await batch.commit();
      },
      version: 1,
    );
  }

  void _createRecipeTable(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE $taskTableName(
      ${TaskDbEntity.fieldId} INTEGER PRIMARY KEY NOT NULL,
      ${TaskDbEntity.fieldName} TEXT NOT NULL,
      ${TaskDbEntity.fieldTime} TEXT NOT NULL,
      ${TaskDbEntity.fieldDate} TEXT NOT NULL,
      ${TaskDbEntity.fieldStatus} TEXT NOT NULL
      );
      ''',
    );
  }
}