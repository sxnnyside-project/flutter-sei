import 'sei_icon.dart';

/// Enum representing the available icon styles.
enum SeiStyle {
  /// Outline style icons.
  outline,

  /// Filled style icons.
  filled,
}

/// Resolves the asset path for a given [icon] and [style].
///
/// Returns the complete asset path as expected by Flutter's asset system.
/// The path is relative to the package assets directory.
///
/// Example:
/// ```dart
/// final path = resolveAssetPath(SeiIcon.home, SeiStyle.outline);
/// // Returns: 'packages/flutter_sei/assets/outline/home.svg'
/// ```
String resolveAssetPath(SeiIcon icon, SeiStyle style) {
  final stylePath = style == SeiStyle.outline ? 'outline' : 'filled';
  final fileName = icon.fileName;
  return 'packages/flutter_sei/assets/$stylePath/$fileName.svg';
}
