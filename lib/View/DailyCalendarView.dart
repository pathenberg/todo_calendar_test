import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_calendar_test/Model/Task.dart';

class DailyCalendarView extends StatefulWidget {
  const DailyCalendarView({Key? key, required this.selectedDay});
  final DateTime selectedDay;



  @override
  State<DailyCalendarView> createState() => _DailyCalendarViewState();
}

class _DailyCalendarViewState extends State<DailyCalendarView> {

 
  @override
  Widget build(BuildContext context) {

  

   
  String formattedDate = DateFormat('EEEE dd/MM/yyyy', 'fr_FR').format(widget.selectedDay);
  
  formattedDate = formattedDate.replaceFirst(formattedDate[0], formattedDate[0].toUpperCase());

  return Scaffold(
    appBar: AppBar(
         title: Text(formattedDate),
   ) );
 

      }
      
 
    
  
  }

