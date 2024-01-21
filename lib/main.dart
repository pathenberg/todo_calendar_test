import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar_test/view/MonthlyCalendarView.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_calendar_test/View/DailyCalendarView.dart';







void main() {
   initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calendar',
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
  int _currentIndex = 0;
  final List<Widget> _pages = [MonthlyCalendarView(), DailyCalendarView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 28),
        title: Text('Calendrier'),
        
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[300],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white30 ,


        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },


        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            label: 'Monthly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today, color: Colors.white),
            label: "Jour", 
            
            
          ),
        ],
      ),
    );
  }
}
