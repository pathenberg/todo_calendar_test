// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_calendar_test/Controller/TaskController.dart';
import 'package:todo_calendar_test/View/DailyCalendarView.dart';
import 'package:todo_calendar_test/View/MonthlyCalendarView.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
  
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
  
  void createNewTask(){
     showDialog(context: context, builder: (context) {

      return AlertDialog();
       
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 28),
        title: Text('Calendrier'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask ,
        child: Icon(Icons.add)
        ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MonthlyCalendarView(onDaySelectedCallback: _onDaySelectedInMonthly,),
          DailyCalendarView(selectedDay: _selectedDay),
          
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
     
      _selectedDay = focusedDay;
  
    });
  }
}