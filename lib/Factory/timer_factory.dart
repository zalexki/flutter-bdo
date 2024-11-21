import 'package:bdotimers/Components/timer_card.dart';
import 'package:flutter/material.dart';

class TimerFactory
{
  static Card createTimerCard()
  {
    return const Card(
      margin: EdgeInsets.all(50),
      color: Colors.amber,
      child: Stack(
        children: [
          CloseButton(),
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                TimerCard()
              ],
            )
          )
        ]
      ) 
    );
  }
}