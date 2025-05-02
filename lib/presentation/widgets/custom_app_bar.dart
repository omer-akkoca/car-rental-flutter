import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/constants/icons.dart';
import 'package:car_rental/presentation/widgets/svg_asset.dart';
import 'package:flutter/material.dart';

class CAppbar extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Widget? leading;
  final bool showBackIcon;
  final List<Widget>? actions;

  const CAppbar({
    super.key,
    this.title,
    this.titleColor = Colors.white,
    this.showBackIcon = true,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.paddingOf(context).top + 45,
      color: CColors.gunmetal,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: MediaQuery.paddingOf(context).top,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IntrinsicWidth(
              child: _buildLeading(context),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _buildTitle(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IntrinsicWidth(child: _buildActions(context)),
          )
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const SvgAsset(
        path: CIcons.backIcon,
        width: 16,
        height: 16,
        color: Colors.white,
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    if (leading != null) {
      return leading!;
    } else if (showBackIcon) {
      return _buildBackButton(context);
    } else {
      return const SizedBox();
    }
  }

  Widget _buildTitle() {
    if (title != null) {
      return Text(
        title!,
        style: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      );
    }
    return const SizedBox();
  }

  Widget _buildActions(BuildContext context) {
    if (actions != null) {
      return Row(
        children: actions!
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: item,
              ),
            )
            .toList(),
      );
    }
    return const SizedBox();
  }
}
