import 'package:flutter/material.dart';

import '../model/calendar_model.dart';

class Calendar extends StatefulWidget {
  final month;

  const Calendar({
    super.key,
    this.month,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  void _schedule(BuildContext ctx) {
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
      onTap: () => _schedule(context),
      child: CalendarMonth(
        month: widget.month,
      ),
    );
  }
}

class CalendarMonth extends StatelessWidget {
  final Month month;

  CalendarMonth({
    super.key,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 344,
      width: 344,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: const Color(0xff555555).withOpacity(0.47))
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              width: 70,
              height: 24,
              decoration: BoxDecoration(
                  color: const Color(0xffE4626F),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    month.name,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )),
                ],
              ),
            ),
          ),
          Wrap(
            runSpacing: 36,
            spacing: 36,
            children: List.generate(days.length, (index) => Text(days[index])),
          )
        ],
      ),
    );
  }
}

class BOX extends StatefulWidget {
  const BOX({super.key});

  @override
  State<BOX> createState() => _BOXState();
}

class _BOXState extends State<BOX> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.58,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
          padding: EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Text("Выберите график",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.topLeft,
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: _createListView,
                      itemCount: 7,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )),
      ]),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          LimitedBox(
            maxWidth: 185,
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, left: 6),
                              child: Text("1/2"),
                            )),
                        Container(
                          height: 47,
                          width: 185,
                          color: Colors.transparent,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  spacing: 8,
                                  children: [
                                    WorkBox(),
                                    WeekendBox(),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeekendBox extends StatelessWidget {
  const WeekendBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Color(0xff616161).withOpacity(0.53), width: 1.5)),
      child: const Center(
          child: Text(
        "B",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff555555)),
      )),
    );
  }
}

class WorkBox extends StatelessWidget {
  const WorkBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Color(0xff90C1FB),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xff6388E3), width: 1.5)),
      child: const Center(
          child: Text(
        "P",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}

class MorningShiftBox extends StatelessWidget {
  const MorningShiftBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Color(0xffFCC08A),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xffFFA451), width: 1.5)),
      child: const Center(
          child: Text(
        "У",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}

class DayShiftBox extends StatelessWidget {
  const DayShiftBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Color(0xffE4626F),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xffED828D), width: 1.5)),
      child: const Center(
          child: Text(
        "Д",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}

class NightShiftBox extends StatelessWidget {
  const NightShiftBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Color(0xff7889E0),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0x9EA8DB), width: 1.5)),
      child: const Center(
          child: Text(
        "Н",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}
