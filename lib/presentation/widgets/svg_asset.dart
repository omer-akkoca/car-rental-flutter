import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Color? color;
  final BoxFit? fit;

  const SvgAsset({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      height: height,
      width: width,
      fit: fit!,
    );
  }
}
