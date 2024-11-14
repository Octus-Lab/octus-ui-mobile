import 'package:flutter/material.dart';

import '../components/dots_loading.dart';
import '../components/timer_loading.dart';
import '../enums/loading_type.dart';

class Loading extends StatelessWidget {
  final LoadingType loadingType;
  final Color loadingColor;

  const Loading({
    super.key,
    this.loadingType = LoadingType.dots,
    required this.loadingColor
  });

  @override
  Widget build(BuildContext context) {
    return switch(loadingType) {
      LoadingType.dots => DotsLoading(dotColor: loadingColor),
      LoadingType.timer => const TimerLoading(),
      _ => CircularProgressIndicator(
        color: loadingColor
      )
    };
  }
}