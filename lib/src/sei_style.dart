import 'sei_icons.dart';
import 'sei_icons_filled.dart';

/// The visual style of a SEI icon.
enum SeiStyle {
  /// Outline (stroked) style. The default. Every [SeiIcons] value has an
  /// outline asset.
  outline,

  /// Filled (solid) style.
  ///
  /// Only [SeiIconsFilled] icons have a filled asset. Prefer
  /// `SeiIcon.filled(icon: ...)`, which only accepts [SeiIconsFilled] and
  /// so cannot request a filled asset that doesn't exist.
  filled,
}

/// Resolves the package asset path for an outline [icon].
///
/// This is exposed for consumers who need the raw asset path (for example
/// to precache it); most code should render icons with [SeiIcon] instead.
String resolveAssetPath(SeiIcons icon, SeiStyle style) {
  final stylePath = style == SeiStyle.outline ? 'outline' : 'filled';
  return 'packages/flutter_sei/assets/$stylePath/${icon.fileName}.svg';
}

/// Resolves the package asset path for a filled [icon].
String resolveFilledAssetPath(SeiIconsFilled icon) {
  return 'packages/flutter_sei/assets/filled/${icon.fileName}.svg';
}
