import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/dots.dart';

class DotsLoading extends StatefulWidget {
  final Color dotColor;
  const DotsLoading({
    super.key,
    required this.dotColor
  });

  @override
  State<DotsLoading> createState() => _DotsLoadingState();
}

class _DotsLoadingState extends State<DotsLoading> {
  int counter = 0;
  int milliseconds = 300;
  List<double> dots = <double>[1,1,1];
  Timer timer = Timer.periodic(const Duration(seconds: 30), (timer) {});
  
  ValueNotifier<int> notifier = ValueNotifier<int>(0);

  void changeSize(){
    switch(counter) {
      case 0:
        dots[0] = 2;
        dots[1] = 1;
        dots[2] = 1;
        break;
      case 1:
        dots[1] = 2;
        break;
      case 2:
        dots[0] = 1;
        dots[2] = 2;
        break;
    }

    counter++;
    if(counter > 2) counter = 0;

    notifier.value = 1;
  }

  void resetDots() {
    timer.cancel();

    dots = <double>[1,1,1];
    counter = 0;
    
    notifier.value = 1;
  }

  @override
  void initState() {
    super.initState();
    if(mounted){
      timer = Timer.periodic(Duration(milliseconds: milliseconds), (timer) => changeSize());
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots.map<Widget>((dot) => buildDot(dot)).toList()
    );
  }

  Widget buildDot(double dot) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: dot),
        duration: Duration(milliseconds: milliseconds),
        builder: (_, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Dots(dotColor: widget.dotColor)
      ),
    );
  }
}