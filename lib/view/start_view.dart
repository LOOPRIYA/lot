import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lot/view/main_screens/calendar_view.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFFF4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.time,
                size: 101,
                color: Color(0xff6388E3),
              ),
              Text(
                "lot",
                style: TextStyle(fontSize: 110, color: Color(0xff6388E3)),
              ),
            ],
          ),
          const Text(
            "Вас приветсвует",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xff6388E3)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Container(
              width: 205,
              height: 49,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: <Color>[Color(0xffE4626F), Color(0xffFEB97A)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarView())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  "Начать",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
