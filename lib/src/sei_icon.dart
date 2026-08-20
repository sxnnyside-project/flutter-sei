import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sei_icons.dart';
import 'sei_icons_filled.dart';
import 'sei_style.dart';

/// Displays a [Sxnnyside Eloquent Icons](https://pub.dev/packages/flutter_sei)
/// (SEI) icon.
///
/// ```dart
/// SeiIcon(icon: SeiIcons.home)
///
/// SeiIcon(icon: SeiIcons.search, size: 32, color: Colors.blue)
///
/// // Filled style — only icons with filled artwork are accepted, so this
/// // can't reference an icon that doesn't have one.
/// SeiIcon.filled(icon: SeiIconsFilled.star)
/// ```
class SeiIcon extends StatelessWidget {
  /// Creates an outline SEI icon, or an icon in [style] if provided.
  ///
  /// The [style] parameter is deprecated: not every [SeiIcons] value has a
  /// filled asset, so requesting `style: SeiStyle.filled` here can fail at
  /// runtime for icons without one. Use [SeiIcon.filled] instead, which only
  /// accepts icons that are guaranteed to have filled artwork.
  const SeiIcon({
    super.key,
    required SeiIcons icon,
    this.size = 24.0,
    this.color,
    @Deprecated(
      'Use SeiIcon.filled(icon: ...) for a filled icon. It only accepts '
      'SeiIconsFilled, so it cannot reference an icon with no filled '
      'asset the way style: SeiStyle.filled can. '
      'This parameter will be removed in a future release.',
    )
    SeiStyle style = SeiStyle.outline,
  }) : _icon = icon,
       _filledIcon = null,
       _style = style;

  /// Creates a filled SEI icon.
  ///
  /// Only icons in [SeiIconsFilled] have filled artwork; this constructor's
  /// [icon] type reflects that, so it's not possible to request a filled
  /// icon that doesn't exist.
  const SeiIcon.filled({
    super.key,
    required SeiIconsFilled icon,
    this.size = 24.0,
    this.color,
  }) : _filledIcon = icon,
       _icon = null,
       _style = SeiStyle.filled;

  final SeiIcons? _icon;
  final SeiIconsFilled? _filledIcon;
  final SeiStyle _style;

  /// The width and height of the icon, in logical pixels.
  final double size;

  /// The color to tint the icon.
  ///
  /// If null, the icon renders with its SVG's own colors.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final filledIcon = _filledIcon;
    final assetPath = filledIcon != null
        ? resolveFilledAssetPath(filledIcon)
        : resolveAssetPath(_icon!, _style);

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
