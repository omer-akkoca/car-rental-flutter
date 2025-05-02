import 'package:flutter/material.dart';

class CScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final Color backgroundColor;

  const CScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: body,
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return appBar != null ? appBar! : const SizedBox();
  }
}
