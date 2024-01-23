import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_calendar_test/Controller/TaskController.dart';
import 'package:todo_calendar_test/View/TaskTileView.dart';
import 'package:todo_calendar_test/Model/Task.dart';

class DailyCalendarView extends StatefulWidget {
  const DailyCalendarView({Key? key, required this.selectedDay, required this.taskController});
  final DateTime selectedDay;
  final TaskController taskController;

  
 



  @override
  State<DailyCalendarView> createState() => _DailyCalendarViewState();
}

class _DailyCalendarViewState extends State<DailyCalendarView> {
   // méthode addTaskAndUpdateUi permettant de rafraichir la page avec la tâche créée sans rechargement de page
  void addTaskAndUpdateUI(String title, String description, DateTime startTime, DateTime endTime, bool notify) {
    widget.taskController.addTask(title, description, startTime, endTime, notify);
    setState(() {
     
    });
  }
  
 

   Future<void> _showAddTaskDialog() async { // nécéssaire ici de mettre async pour que l'await show Dialog fonctionne 
    
    // On initialise ici titre et description en renvoyant du vide 
    
    String title = '';
    String description = '';

    // On initialise ici startTime et endTime avec les valeurs du jours selectionné par défaut et l'heure à 00H00 par défaut
    DateTime startTime = DateTime(
      widget.selectedDay.year,
      widget.selectedDay.month,
      widget.selectedDay.day,
    );


    DateTime endTime = DateTime(
      widget.selectedDay.year,
      widget.selectedDay.month,
      widget.selectedDay.day,
    );

    bool notify = false;

    // Méthode asynchrone pour lancer la page de dialogue et permettre à l'utilisateur de créer une tâche à l'aide d'une alerte dialogue
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Ajouter une nouvelle tâche'),
              content: Column(
                children: [
                  TextField(
                    onChanged: (value) => title = value,
                    decoration: InputDecoration(labelText: 'Titre'),
                  ),
                  TextField(
                    onChanged: (value) => description = value,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  //Liste ici de widget permettant à l'utilisateur de choisir l'heure de début/fin
                  ListTile(
                    title: Text('Heure de début'),
                    subtitle: Text('${startTime.hour}:${startTime.minute}'),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(startTime),
                      );

                      if (pickedTime != null) {
                        setState(() {
                          startTime = DateTime(
                            startTime.year,
                            startTime.month,
                            startTime.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        });
                      
                      }
                   
                    },
                    
                  ),
                  ListTile(
                    title: Text('Heure de fin'),
                    subtitle: Text('${endTime.hour}:${endTime.minute}'),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(endTime),
                      );

                      if (pickedTime != null) {
                        setState(() {
                          endTime = DateTime(
                            endTime.year,
                            endTime.month,
                            endTime.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        });
                      }
                    },
                  ),
                  // Checkbox si l'utilisateur veut recevoir une notification pour sa tâche
                    Row(
                        children: [
                          Text('Recevoir une notification'),
                          Checkbox(
                            value: notify,
                            onChanged: (value) {
                              setState(() {
                                notify = value ?? false;
                              });
                            },
                          ),
                          ],
                      )
                ],
                
              ),
              
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // utilisation de la méthode addTaskAndUpdateUi permettant de rafraichir la page avec la tâche créée sans rechargement de page
                    addTaskAndUpdateUI(title, description, startTime, endTime, notify);
                    Navigator.of(context).pop();
                  },
                  child: Text('Ajouter'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();  
                  },
                  child: Text('Annuler'),
                ),
              ],
            );
          },
        );
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    // Implémentation de la logique permettant de convertir la date du jour séléctionné au format désiré (ici format français)
    String formattedDate = DateFormat('EEEE dd/MM/yyyy', 'fr_FR').format(widget.selectedDay);
    // Implémentation de la logique permettant de mettre la première lettre de la date selectionné en majuscule
    formattedDate = formattedDate.replaceFirst(formattedDate[0], formattedDate[0].toUpperCase());
    // Implémentation de la logique permettant de créér la tâche uniquement pour le jour selctionné selectedDay
    List<Task> tasksForDay = widget.taskController.getTasksForDay(widget.selectedDay);

    
    return Scaffold(
      appBar: AppBar(
        title: Text(formattedDate),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              
              itemCount: tasksForDay.length,
              itemBuilder: (context, index) {
                Task task = tasksForDay[index];
              
                return TaskTileView(taskController: widget.taskController, task: task, index: index, );
               
              },
            ),
          ),
        ],
      ),
    );
  }
}
      
 
    
  
  

