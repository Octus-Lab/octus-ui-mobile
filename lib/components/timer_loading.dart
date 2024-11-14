import 'package:flutter/material.dart';
import 'package:octus_ui_mobile/widgets/button.dart';

class TimerLoading extends StatelessWidget {
  const TimerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Button(
      customChild: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Close | "),
            Text(
              "00:00:00", 
              style: TextStyle(fontWeight: FontWeight.bold)
            )
          ]
        ),
      )
    );
  }
}