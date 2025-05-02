import 'package:flutter/material.dart';

class SafeAreaBottomSpace extends StatelessWidget {

  final int bottom;

  const SafeAreaBottomSpace({super.key, this.bottom = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.paddingOf(context).bottom + bottom,
    );
  }
}
