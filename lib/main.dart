// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_calendar_test/Controller/TaskController.dart';
import 'package:todo_calendar_test/View/DailyCalendarView.dart';
import 'package:todo_calendar_test/View/MonthlyCalendarView.dart';
import 'package:todo_calendar_test/Controller/Services/NotificationService.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  initializeDateFormatting().then((_) => runApp(MyApp())); //on initialise ici le formattage de la date avant de lancer l'app sous peine de plantage de l'application en test.
  
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Calendrier',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();
  int _currentIndex = 0;
  final TaskController _taskController = TaskController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: (){ 
              Scaffold.of(context).openDrawer();},
            );
          }
        ),
        backgroundColor: Colors.deepPurple[300],
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 28),
        title: Text(''),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.shade100,
        child: Column(
         
          children:[
         
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Divider(
              color: Colors.deepPurple.shade100,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Calendrier'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Mon Profil'),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
            ),
          ),]
         
      ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [ // Initialisation de la logique permettant de changer de vue vers la vue Daily en fonction du jour seléctionné dans MonthlyCalendarView.
          MonthlyCalendarView(onDaySelectedCallback: _onDaySelectedInMonthly,), 
          DailyCalendarView(selectedDay: _selectedDay, taskController: _taskController),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[300],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white30,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // ON CREER ICI LES ICONES DE NAVIGATIONS ENTRE LA PAGE MENSUEL ET LA PAGE JOURNALIERE 
       items: [
           const BottomNavigationBarItem(
            icon:  Icon(Icons.calendar_today, color: Colors.white),
            label: 'Mois',
          ),
           const BottomNavigationBarItem(
            icon: Icon(Icons.today, color: Colors.white),
            label: "Jour",
          ),
        ],
      ),
    );
  }

  void _onDaySelectedInMonthly(String formattedDate, DateTime focusedDay) {
   

    setState(() {
     
      _selectedDay = focusedDay; // changement d'état du focusedday initial pour que le jour sélectionné renvoie un nouveau focusedDay
  
    });
  }
}