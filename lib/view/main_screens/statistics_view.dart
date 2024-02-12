import 'package:flutter/material.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
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
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(19),
                    child: Text(
                      "Статистика",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    height: 703,
                    width: 365,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(19),
                          child: Text(
                            "Январь 2024",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xffF8BF7C),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xffE6656A),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff6388E3),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              width: 160,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Color(0xff6388E3),
                                        Color(0xffC0E0A0)
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 100,
                              width: 160,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Color(0xffE4626F),
                                        Color(0xffFFA451)
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
