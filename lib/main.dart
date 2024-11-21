import 'dart:async';

import 'package:bdotimers/Factory/timer_factory.dart';
import 'package:bdotimers/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'BDO Timers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(
          title: 'BDO Timers',
        ),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  // List<Card> dynamicList = [];
  Map<String, TimerDto> timersMap = {};

  String addInList(int secondsLeft) {
    var uuid = const Uuid().v4();
    var card = TimerFactory.createTimerCard(uuid.toString());
    var timer = createTimer(uuid.toString());
    timersMap[uuid.toString()] = TimerDto(secondsLeft, card, timer);
    notifyListeners();

    return uuid.toString();
  }

  Timer createTimer(String uuid)
  {
    return Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      var seconds = timersMap[uuid]!.secondsLeft;
      if (seconds <= 0) {
        timersMap[uuid]?.timer.cancel();
      } else {
        timersMap[uuid]?.secondsLeft--; 
      }

      notifyListeners();
      print("$uuid $seconds");
    });
  }
}

class TimerDto
{
  TimerDto(this.secondsLeft, this.card, this.timer);

  late int secondsLeft;
  late Card card;
  late Timer timer;
}