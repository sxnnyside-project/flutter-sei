# flutter_sei

Adapter layer for Sxnnyside Eloquent Icons (SEI) - a comprehensive icon system for Flutter applications. This package provides a type-safe, widget-based API to use SEI icons with support for multiple styles and customization options.

## Features

- **Type-safe icon access** through the `SeiIcon` enum
- **Multiple styles** - outline and filled variants
- **Easy customization** - control size and color
- **No Material dependency** - works with any Flutter widget tree
- **120+ icons** covering common UI needs
- **SVG-based** - crisp rendering at any size

## Getting started

Add `flutter_sei` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_sei: ^1.0.0
```

Run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:flutter_sei/flutter_sei.dart';
```

Use icons in your widgets:

```dart
// Basic usage
SxEloIcon(
  icon: SeiIcon.home,
)

// With customization
SxEloIcon(
  icon: SeiIcon.search,
  size: 32,
  color: Colors.blue,
  style: SeiStyle.filled,
)

// In a button
IconButton(
  icon: SxEloIcon(
    icon: SeiIcon.settings,
    color: Colors.grey,
  ),
  onPressed: () {},
)
```

Available parameters:

- `icon` (required) - The icon to display from `SeiIcon` enum
- `size` (optional, default: 24.0) - Icon size in logical pixels
- `color` (optional) - Color to apply to the icon
- `style` (optional, default: `SeiStyle.outline`) - Icon style variant

## Additional information

**Documentation**: All public APIs are documented with inline documentation. Use your IDE's autocomplete to explore available icons and options.

**Contributing**: This is an adapter layer for the SEI design system. Icon requests should be directed to the main SEI project.

**Issues**: Report bugs or request features on the [GitHub repository](https://github.com/sxnnyside/flutter_sei/issues).

**Package development**: This package follows semantic versioning. Expect stable APIs and backward compatibility within major versions.

