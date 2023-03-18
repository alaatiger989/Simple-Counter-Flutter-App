class TaskDbEntity {
  static const fieldId = 'id';
  static const fieldName = 'task_name';
  static const fieldTime = 'task_time';
  static const fieldDate = 'task_date';
  static const fieldStatus = 'task_status';


  final String name;
  final String time;
  final String date;
  final String status;

  const TaskDbEntity({
    required this.name,
    required this.time,
    required this.date,
    required this.status,
  });

  TaskDbEntity.fromMap(Map<String, dynamic> map)
      : name = map[fieldName] as String,
        time = map[fieldTime] as String,
        date = map[fieldDate] as String,
        status = map[fieldStatus] as String ;

  Map<String, dynamic> toMap() => {
    fieldName: name,
    fieldTime: time,
    fieldDate: date,
    fieldStatus : status
  };
}