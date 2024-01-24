import 'package:todo_calendar_test/Model/Task.dart';



class TaskController {
  List<Task> taskList = [];

  void deleteTask(int index) {
    if (index >= 0 && index < taskList.length) {
      taskList.removeAt(index);
    }
  }

  void addTask(String title, String description, DateTime startTime, DateTime endTime, bool notify) {
    Task newTask = Task(
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      notification: notify,
    );
    
    taskList.add(newTask);
  }

  List<Task> getTasksForDay(DateTime day) {
    return taskList.where((task) {
      return task.startTime.year == day.year &&
          task.startTime.month == day.month &&
          task.startTime.day == day.day;
    }).toList();
  }
}