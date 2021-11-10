// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:optify/constants/colors.dart';
import 'package:optify/widgets/app_bars/home_app_bar.dart';
import 'package:optify/widgets/bottom_navigation_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils.dart';

class MealsCalendarScreen extends StatefulWidget {
  @override
  _MealsCalendarScreenState createState() => _MealsCalendarScreenState();
}

class _MealsCalendarScreenState extends State<MealsCalendarScreen>
    with AutomaticKeepAliveClientMixin {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text(
                "Meal calendar",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: DARK_COLOR),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: DARK_COLOR,
                  fontWeight: FontWeight.bold,
                ),
                weekendStyle: TextStyle(
                  color: DARK_COLOR,
                  fontWeight: FontWeight.bold,
                )),
            headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(21.0),
              ),
              formatButtonTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: WHITE_COLOR),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: DARK_COLOR, fontSize: 20),
              rightChevronIcon: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Container(
                  color: Colors.white,
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.arrow_right,
                    size: 20,
                    color: DARK_COLOR,
                  ),
                ),
              ),
              leftChevronIcon: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Container(
                  color: Colors.white,
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.arrow_left,
                    size: 20,
                    color: DARK_COLOR,
                  ),
                ),
              ),
            ),
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.all(6.0),
              // cells decorations
              defaultDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
              ),
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(21.0),
              ),
              todayDecoration: BoxDecoration(
                color: Color.fromRGBO(216, 146, 22, 0.7),
                borderRadius: BorderRadius.circular(21.0),
              ),
              weekendDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
              ),
              // cells decorations
              // textStyle decorations
              defaultTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: GRAY_COLOR),
              selectedTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: WHITE_COLOR),
              todayTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: WHITE_COLOR),
              weekendTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: GRAY_COLOR),

              // textStyle decorations
              //markerDecoration: BoxDecoration(),
              markerMargin: EdgeInsets.symmetric(horizontal: 2),
              markerSize: 0,
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.0),
                          border: Border.all(width: 1.0, color: WHITE_COLOR)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage('assets/images/breakfast1.jpg'),
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.black.withOpacity(0.25),
                                        Colors.black87.withOpacity(0.25),
                                        Colors.black54.withOpacity(0.25),
                                        Colors.black38.withOpacity(0.25),
                                      ],
                                      stops: [
                                        0.1,
                                        0.2,
                                        0.4,
                                        0.6
                                      ]))),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Color.fromRGBO(34, 40, 49, 0.8),
                              ),
                              child: Center(
                                child: Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: WHITE_COLOR),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 25,
                              left: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("English breakfast",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: WHITE_COLOR,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("867 cal, \$1.24",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: WHITE_COLOR,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("6:00-10:00 AM",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: WHITE_COLOR,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ))
                        ],
                      ));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
