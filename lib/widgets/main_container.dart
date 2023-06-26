import 'package:flutter/material.dart';
import 'package:refcoins_app/core/utils.dart';

class MainContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final double? padding;
  final Color? color;
  final double? margin;
  const MainContainer(
      {super.key,
      this.width,
      this.height,
      required this.child,
      this.padding,
      this.color,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(padding ?? defaultPadding),
      margin: EdgeInsets.all(margin ?? defaultPadding),
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
