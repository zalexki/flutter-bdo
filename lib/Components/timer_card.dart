import 'package:bdotimers/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatefulWidget {
  TimerCard(this._uuid, {super.key});
  late String _uuid;

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var seconds = appState.timersMap[widget._uuid]?.secondsLeft;
    return Text('$seconds');
  }
}