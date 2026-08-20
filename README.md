# flutter_sei

Flutter widgets for [Sxnnyside Eloquent Icons](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons) (SEI) — a curated, platform-agnostic SVG icon system.

## Features

- **`SeiIcon` widget** — a single, small widget for rendering any icon.
- **`SeiIcons` enum** — type-safe, autocomplete-friendly icon identifiers.
- **Type-safe filled icons** via `SeiIcon.filled` and `SeiIconsFilled` — only
  icons that actually have filled artwork are accepted, so there's no
  runtime crash for requesting one that doesn't exist.
- **Size and color customization**, with `currentColor`-style tinting via `ColorFilter`.
- **No Material dependency** — works with any Flutter widget tree.
- **140+ icons**, SVG-based for crisp rendering at any size.

## Getting started

```yaml
dependencies:
  flutter_sei: ^2.0.0
```

```bash
flutter pub get
```

## Usage

```dart
import 'package:flutter_sei/flutter_sei.dart';

// Basic usage
const SeiIcon(icon: SeiIcons.home)

// With customization
SeiIcon(
  icon: SeiIcons.search,
  size: 32,
  color: Colors.blue,
)

// Filled style — SeiIconsFilled only contains icons that have filled
// artwork, so this can't reference one that doesn't exist.
SeiIcon.filled(icon: SeiIconsFilled.star)

// Inside a button
IconButton(
  icon: const SeiIcon(icon: SeiIcons.settings),
  onPressed: () {},
)
```

See the [example app](example/lib/main.dart) for a fuller demonstration, including icon grids and list usage.

### Parameters

`SeiIcon(...)` — outline icons (every `SeiIcons` value):

| Parameter | Type        | Default             | Description                       |
|-----------|-------------|----------------------|------------------------------------|
| `icon`    | `SeiIcons`  | required             | The icon to render.                |
| `size`    | `double`    | `24.0`                | Width and height, in logical pixels. |
| `color`   | `Color?`    | `null`                | Tint applied to the icon.          |
| `style`   | `SeiStyle`  | `SeiStyle.outline`    | ⚠️ Deprecated — use `SeiIcon.filled` for filled icons. |

`SeiIcon.filled(...)` — filled icons (only `SeiIconsFilled` values):

| Parameter | Type              | Default   | Description              |
|-----------|-------------------|-----------|---------------------------|
| `icon`    | `SeiIconsFilled`  | required  | The icon to render.       |
| `size`    | `double`          | `24.0`    | Width and height, in logical pixels. |
| `color`   | `Color?`          | `null`    | Tint applied to the icon. |

## Migrating from 1.x

Version 2.0.0 renamed the public API to match Flutter's own `Icon`/`Icons`
convention:

- `SxEloIcon` → `SeiIcon`
- `SeiIcon` (the enum) → `SeiIcons`

```dart
// Before (1.x)
SxEloIcon(icon: SeiIcon.home)

// After (2.x)
SeiIcon(icon: SeiIcons.home)
```

It also deprecated `SeiIcon`'s `style` parameter in favor of `SeiIcon.filled`:

```dart
// Deprecated
SeiIcon(icon: SeiIcons.star, style: SeiStyle.filled)

// Preferred — icon: SeiIconsFilled.star, not SeiIcons.star
SeiIcon.filled(icon: SeiIconsFilled.star)
```

## License

The Dart/Flutter code in this package is MIT-licensed — see [LICENSE](LICENSE).

The bundled SVG assets are Sxnnyside Eloquent Icons (SEI) and remain governed
by [SEI's own license](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons/blob/main/LICENSE)
(free to use in your apps with attribution; not for standalone resale or
rebranding as a competing icon set).

## Issues

Report bugs or request icons on the [SEI repository](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons/issues).
