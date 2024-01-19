import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendarView extends StatefulWidget {
  @override
  _MonthlyCalendarViewState createState() => _MonthlyCalendarViewState();
}

class _MonthlyCalendarViewState extends State<MonthlyCalendarView> {
  DateTime today= DateTime.now();
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier Mensuel')),
        body: content(),
  );
  }

  Widget content(){
    return Column(
      children: [
        Text("123"),
        Container(
          child: TableCalendar(
            focusedDay: today, 
            firstDay: DateTime.utc(2010, 10, 16), 
            lastDay: DateTime.utc(2030, 3, 14)),
          
        )
      ],
    );
  }
  }



