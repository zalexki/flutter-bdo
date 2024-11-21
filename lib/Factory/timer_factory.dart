import 'package:bdotimers/Components/timer_card.dart';
import 'package:flutter/material.dart';

class TimerFactory
{
  void RemoveTimer(String)
  {

  }
  static Card createTimerCard(String uuid)
  {

  
    return Card(
      margin: const EdgeInsets.all(50),
      color: Colors.amber,
      child: Stack(
        children: [
          const CloseButton(
            // onPressed: RemoveTimer(uuid),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                TimerCard(uuid)
              ],
            )
          )
        ]
      ) 
    );
  }
}