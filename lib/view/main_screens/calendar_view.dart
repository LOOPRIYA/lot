import 'package:flutter/material.dart';
import 'package:lot/view/main_screens/statistics_view.dart';
import 'package:lot/widget/NewCalendar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/calendar_model.dart';
import '../../widget/calendar_widget.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

final now = DateTime.now();
final currentYear = now.year;
final boxTextStyle = TextStyle(fontSize: 10);

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFFF4),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 223,
              decoration: const BoxDecoration(
                  color: Color(0xff6388E3),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    currentYear.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  )),
            ),
          ),
           SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 148, bottom: 148),
              child: Center(
                child: Wrap(
                  runSpacing: 45,
                  children: List.generate(12, (index) => NewCalendar()),
                ),
              ),
            ),
          ),
          NavBar(),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 66,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xff6388E3),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StatisticsView())),
                child: SvgPicture.asset("assets/statistic.svg", height: 47,width: 47,)),
            ElevatedButton(
                onPressed: () => _editing(context),
                child: const Icon(Icons.stacked_bar_chart)),
            ElevatedButton(
                onPressed: () => _yourSchedule(context),
                child: const Icon(Icons.stacked_bar_chart)),
          ],
        ),
      ),
    );
  }
}

void _editing(BuildContext ctx) {
  showModalBottomSheet(
    // useRootNavigator: true,
    barrierColor: Colors.black.withOpacity(0),
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      isScrollControlled: true,
      elevation: 0,
      context: ctx,
      builder: (ctx) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(ctx).size.height * 0.23,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10)),
                      width: 55,
                      height: 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, bottom: 18),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text("Редактирование графика",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Wrap(
                                  spacing: 40,
                                  children: [
                                    Column(
                                      children: [
                                        WorkBox(),
                                        Text(
                                          "Работа",
                                          style: boxTextStyle,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        WeekendBox(),
                                        Text(
                                          "Выходной",
                                          style: boxTextStyle,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        MorningShiftBox(),
                                        Text(
                                          "Утренняя \nсмена",
                                          textAlign: TextAlign.center,
                                          style: boxTextStyle,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        DayShiftBox(),
                                        Text(
                                          "Дневная \nсмена",
                                          textAlign: TextAlign.center,
                                          style: boxTextStyle,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        NightShiftBox(),
                                        Text(
                                          "Ночная \nсмена",
                                          textAlign: TextAlign.center,
                                          style: boxTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const Text(
                          "Для внесения корректировок в график выберите одно из значений в списке выше и нажмите на день в календаре, который хотите поменять. Длительное удержание для выбора времени.",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6388E3)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
}

void _yourSchedule(BuildContext ctx) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      isScrollControlled: true,
      elevation: 0,
      context: ctx,
      builder: (ctx) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(ctx).size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10)),
                    width: 55,
                    height: 5,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 18),
                  child: Row(
                    children: [
                      Text("Ваш график",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ));
}
