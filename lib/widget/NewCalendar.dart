import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_widget.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key});

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

class _NewCalendarState extends State<NewCalendar> {
  void _sch(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        showDragHandle: false,
        isScrollControlled: true,
        enableDrag: true,
        elevation: 0,
        context: ctx,
        builder: (ctx) {
          return const BOX();
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _sch(context),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff555555).withOpacity(0.47))
              ]),
          height: 348,
          width: 348,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () => _sch(context),
              child: TableCalendar(
                  availableGestures: AvailableGestures.none,
                  weekendDays: [DateTime.sunday, DateTime.saturday],
                  daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      weekendStyle: TextStyle(
                          color: Color(0xff17A1FA),
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  locale: 'ru_RU',
                  calendarStyle: const CalendarStyle(
                    outsideTextStyle: TextStyle(
                        color: Color(0xffC2C0C0),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    defaultTextStyle: TextStyle(
                        color: Color(0xff555555),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    weekendTextStyle: TextStyle(
                        color: Color(0xff17A1FA),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    isTodayHighlighted: false,
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleCentered: true,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2025, 31, 1)),
            ),
          )),
    );
  }
}
