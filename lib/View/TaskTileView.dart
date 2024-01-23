import 'package:flutter/material.dart';
import 'package:todo_calendar_test/Model/Task.dart';

class TaskTileView extends StatelessWidget {
  final Task task;
  TaskTileView({required this.task});
  @override
  Widget build(BuildContext context) {
return ListTile( //assignation de la vue d'une tâche qui est ensuite implémenter dans la vue DailyCalendarView pour alléger cette dernière et créer un nombre de tâche = à la liste de tâche assigné à ce jour
  title: Text(task.title),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${task.startTime.hour}:${task.startTime.minute} - ${task.endTime.hour}:${task.endTime.minute}'),
      Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
      Text(task.description),
    ],
  ),
  trailing: Checkbox(
    value: task.notification,
    onChanged: (value) {
     
    },
  ),
  
);
 

}
}