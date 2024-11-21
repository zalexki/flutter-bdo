import 'dart:async';
import 'package:flutter/material.dart';

class TimerCard extends StatefulWidget {
  const TimerCard({super.key});

  @override
  State<TimerCard> createState() => _TimerCard();
}

class _TimerCard extends State<TimerCard> {
  late Timer _timer;
  int _counter = 20;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void autoCleanAfterXSeconds(int secondsToWait) {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timer.tick >= secondsToWait)
      {
        _timer.cancel();
      }
    });
  }

  void createNewCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_counter <= 0) {
        setState(() { _timer.cancel(); });
      } else {
        setState(() { 
          _counter--; 
          // autoCleanAfterXSeconds(10); 
        });
      }

      print(_counter);
    });
  }

  @override
  initState() {
    super.initState();
    createNewCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_counter');
  }
}