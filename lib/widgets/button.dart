import 'package:flutter/material.dart';
import 'package:octus_ui_mobile/enums/loading_type.dart';
import 'package:octus_ui_mobile/widgets/loading.dart';

import '../enums/button_type.dart';

class Button extends StatelessWidget {
  final ButtonType buttonType;
  final LoadingType loadingType;
  final String? title;
  final Widget? customChild;
  final VoidCallback? action;
  final double? radius;
  final Color? color;
  final double? width;
  final bool isLoading;

  const Button({
    super.key,
    this.buttonType = ButtonType.primary,
    this.loadingType = LoadingType.dots,
    this.title,
    this.customChild,
    this.action,
    this.radius,
    this.color,
    this.width,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = color ?? buttonType.color;  

    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(radius ?? 8)
          ),
          child: isLoading ? Loading(loadingColor: buttonColor) : customChild ?? Text(
            title ?? '',
          )
        )
      ),
    );
  }
}