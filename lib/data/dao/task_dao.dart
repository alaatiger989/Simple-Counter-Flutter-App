import 'package:counter_app/data/entity/task_db_entity.dart';

import 'base_dao.dart';

class TaskDao extends BaseDao {
  Future<List<TaskDbEntity>> selectAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps =
    await db.query(BaseDao.taskTableName);
    return List.generate(maps.length, (i) => TaskDbEntity.fromMap(maps[i]));
  }

  Future<void> insertAll(List<TaskDbEntity> assets) async {
    final db = await getDatabase();
    final batch = db.batch();

    for (final asset in assets) {
      batch.insert(BaseDao.taskTableName, asset.toMap());
    }
    await batch.commit();
  }
  
  Future insertTask(TaskDbEntity singleTask) async{
    final db = await getDatabase();
    final batch = db.batch();
    batch.execute('INSERT INTO task (task_name , task_time , task_date , task_status) VALUES ("${singleTask.name}","${singleTask.time}","${singleTask.date}","${singleTask.status}")');
    await batch.commit();
  }
}