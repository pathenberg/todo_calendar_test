// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MonthlyCalendarView extends StatefulWidget {
  final void Function(String formattedDate, DateTime focusedDay) onDaySelectedCallback;

  const MonthlyCalendarView({required this.onDaySelectedCallback});

  @override
  _MonthlyCalendarViewState createState() => _MonthlyCalendarViewState();
}

class _MonthlyCalendarViewState extends State<MonthlyCalendarView> {
  DateTime _today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _today = day;
    });

  
    String formattedDate = DateFormat('EEEE/dd/MM/yyyy', 'fr_FR').format(day);

    widget.onDaySelectedCallback(formattedDate, focusedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              locale: 'fr_FR',
              rowHeight: 80,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _today),
              focusedDay: _today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
