import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sei_icon.dart';
import 'sei_icon_data.dart';

/// A widget that displays a Sxnnyside Eloquent Icon.
///
/// This widget renders SVG icons from the SEI icon system using [SvgPicture].
/// Icons can be customized with size, color, and style (outline or filled).
///
/// Example:
/// ```dart
/// SxEloIcon(
///   icon: SeiIcon.home,
///   size: 32,
///   color: Colors.blue,
///   style: SeiStyle.filled,
/// )
/// ```
class SxEloIcon extends StatelessWidget {
  /// Creates an SEI icon widget.
  ///
  /// The [icon] parameter is required and specifies which icon to display.
  /// The [size] defaults to 24.0 pixels.
  /// The [color] is optional and will tint the icon.
  /// The [style] defaults to [SeiStyle.outline].
  const SxEloIcon({
    super.key,
    required this.icon,
    this.size = 24.0,
    this.color,
    this.style = SeiStyle.outline,
  });

  /// The icon to display.
  final SeiIcon icon;

  /// The size of the icon in logical pixels.
  final double size;

  /// The color to apply to the icon.
  ///
  /// If null, the icon will use its default colors from the SVG.
  final Color? color;

  /// The style of the icon (outline or filled).
  final SeiStyle style;

  @override
  Widget build(BuildContext context) {
    final assetPath = resolveAssetPath(icon, style);

    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
