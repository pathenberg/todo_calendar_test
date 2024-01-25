// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_calendar_test/Model/Task.dart';
import 'package:todo_calendar_test/Controller/TaskController.dart';


class TaskTileView extends StatefulWidget {
  final TaskController taskController;
  final Task task;
  final int index;

  TaskTileView({
    required this.taskController,
    required this.task,
    required this.index,
  });

  @override
  _TaskTileViewState createState() => _TaskTileViewState();
}

class _TaskTileViewState extends State<TaskTileView> {
  
  onPressedDelete(index) { // tentative de rechargement d'interface post delete pour le moment sans succès
    widget.taskController.deleteTask(widget.index);
     setState(() {});;
    
  }
  

  @override
  Widget build(BuildContext context) {
 
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
           
            onPressed: onPressedDelete,
             // appel de la fonction quand on slide pour pouvoir supprimer la tâche concernée par le slide
            icon: Icons.delete,
            backgroundColor: Colors.red.shade200,
          )
        ],
      ),
      
      child: ListTile(
        title: Text(widget.task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${widget.task.startTime.hour}:${widget.task.startTime.minute} - ${widget.task.endTime.hour}:${widget.task.endTime.minute}'),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.task.description),
          ],
        ),
        trailing: Checkbox(
          value: widget.task.notification,
          onChanged: (value) {
          
          },
        ),
      ),
    );
  }
}
