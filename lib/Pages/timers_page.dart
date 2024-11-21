import 'package:bdotimers/Factory/timer_factory.dart';
import 'package:bdotimers/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimersPage extends StatefulWidget {
  const TimersPage({super.key});

  @override
  State<TimersPage> createState() => _TimersPage();
}

class _TimersPage extends State<TimersPage> {
  List<Card> dynamicList = [];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
     
    void onAddTimerClick()
    {
      var protoCard = TimerFactory.createTimerCard();

      setState(() {
        appState.addInList(protoCard);
      });
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.all(20),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            onPressed: onAddTimerClick, 
            child: const Center(child: Icon(Icons.add)
          )
        ),
      ),
      body: ListView(
        children: [
          Wrap(
            children: appState.dynamicList
          ),
        ]
      )
    );
  }
}