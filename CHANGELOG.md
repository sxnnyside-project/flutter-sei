# Changelog

All notable changes to **flutter_sei** are documented here.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

---

## [2.0.0] — 2026-08-19

Breaking API rename to match Flutter's own `Icon`/`Icons` convention, a
type-safe filled-icon API, and a pub.dev quality pass.

### Changed

- **Breaking:** `SxEloIcon` widget renamed to `SeiIcon`.
- **Breaking:** `SeiIcon` enum (icon identifiers) renamed to `SeiIcons`.
- `SeiIcons` is now an enhanced enum with a const `fileName` field, replacing
  a 120-case `switch` — same values, same `fileName` output, cleaner internals.
- Replaced the package's custom license with MIT (OSI-approved) for the
  Dart/Flutter code. Bundled SVG assets remain governed by SEI's own license.
- Updated `flutter_lints` to `^6.0.0`.
- Corrected the `flutter:` SDK lower bound in `pubspec.yaml`, previously an
  inconsistent, vestigial `>=1.17.0`.

### Added

- `SeiIcon.filled(icon: ...)` — a type-safe way to render filled icons.
  It only accepts `SeiIconsFilled`, so it's impossible to reference an
  icon that has no filled asset (previously a runtime crash via
  `SeiIcon(icon: ..., style: SeiStyle.filled)`).
- `SeiIconsFilled` enum — the 23 icons that currently ship a filled asset.
- 22 new outline icons, syncing `assets/outline/` with the current SEI
  collection: `arrowRight`, `book`, `box`, `bulb`, `compass`, `computer`,
  `device`, `downSmall`, `mail`, `palette`, `pause`, `planet`, `playCircle`,
  `puzzle`, `rotate`, `shoppingBag`, `store`, `tool`, `transfer`,
  `translate`, `tv`, `watch`. Assets are synced manually from
  `sxnnyside-eloquent-icons/icons/` when the icon set changes.
- `example/` app demonstrating basic usage, size/color/style configuration,
  and icons inside real widgets (`AppBar`, `IconButton`, `ListTile`, a grid).
- Widget tests for `SeiIcon` covering default and overridden parameters.

### Deprecated

- `SeiIcon`'s `style` parameter. Use `SeiIcon.filled(icon: ...)` for filled
  icons instead. `style` is still supported and not scheduled for removal
  in the near term, but new code should prefer the type-safe constructor.

---

## [1.0.0] — 2026-01-30

Initial stable release of flutter_sei.

### Added

- Complete adapter layer for Sxnnyside Eloquent Icons (SEI).
- Type-safe `SeiIcon` enum with 120+ icons.
- `SxEloIcon` widget for rendering icons.
- Support for outline and filled styles via `SeiStyle`.
- Customizable size and color.
- No Material dependency — works with any Flutter widget tree.
- SVG-based rendering using flutter_svg.
- Comprehensive inline documentation.

---

[Unreleased]: https://github.com/sxnnyside-project/flutter-sei/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/sxnnyside-project/flutter-sei/releases/tag/v2.0.0
[1.0.0]: https://github.com/sxnnyside-project/flutter-sei/releases/tag/v1.0.0
