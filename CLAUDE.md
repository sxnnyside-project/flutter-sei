# flutter_sei

Flutter widgets for [Sxnnyside Eloquent Icons (SEI)](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons).

## Topology

**Monolithic.** One publishable unit: the `flutter_sei` package. `example/`
is a demo consumer app (`publish_to: none`), not a second workspace member —
it does not warrant Melos or workspace tooling (DX-16: don't over-engineer
small projects).

## Stack Profile

Dart — see the DXQE Dart Stack Profile. Concretely:

- Formatter/linter: `dart format` + `flutter analyze` with `package:flutter_lints`
  plus `strict-casts`, `strict-inference`, `strict-raw-types` enabled in
  `analysis_options.yaml`.
- Dart has no separate type-checker from its linter — `flutter analyze` does
  both. The Justfile's `typecheck` and `lint` recipes intentionally run the
  same command; that's Dart's tooling reality, not a shortcut.
- Testing: `flutter test`.
- Task runner: `Justfile` at repo root — `just check` runs the full quality
  gate (format check, lint, typecheck, test, publish dry-run).

## Architecture

```
flutter-sei/
├── lib/
│   ├── flutter_sei.dart      # public exports only
│   └── src/
│       ├── sei_icon.dart          # SeiIcon widget (outline + filled ctor)
│       ├── sei_icons.dart         # SeiIcons enum — every icon, outline
│       ├── sei_icons_filled.dart  # SeiIconsFilled enum — icons with filled art
│       └── sei_style.dart         # SeiStyle enum + asset path resolution
├── assets/outline/, assets/filled/  # bundled SVGs (see "Assets" below)
├── example/                  # demo app, not published
└── test/                     # widget + unit tests
```

## Public API rules

- `SeiIcons` contains every icon (outline always exists). `SeiIconsFilled`
  contains only icons that have filled artwork — this is deliberate: it
  makes requesting a nonexistent filled icon a compile-time error via
  `SeiIcon.filled(icon: SeiIconsFilled.x)`, not a runtime crash.
- `SeiIcon`'s `style` parameter is `@Deprecated` but still supported.
  Don't remove it without a documented breaking-change rationale in
  CHANGELOG.md — see the 1.x→2.x and 2.0→2.1 migration notes in README.md
  for the expected format.
- Keep the public surface minimal. `lib/flutter_sei.dart` should only ever
  export what a consumer genuinely needs; internals stay in `lib/src/`.

## Assets

`assets/outline/` and `assets/filled/` are copies from
`../sxnnyside-eloquent-icons/icons/`, the single source of truth. **Synced
manually** (no script, by request) — when the icon collection changes:

1. Copy the changed/new `.svg` files from `sxnnyside-eloquent-icons/icons/{outline,filled}/`
   into this package's `assets/{outline,filled}/`.
2. Add any new icons to `SeiIcons` (`lib/src/sei_icons.dart`) and, if a
   filled asset was added, to `SeiIconsFilled` (`lib/src/sei_icons_filled.dart`).
   Both are alphabetically sorted — keep it that way.
3. Run `just check`.

A published Flutter package cannot reference a sibling directory outside
itself — bundling a copy of the SVGs is a hard constraint of pub.dev
packaging, not a choice.

## Release process

`v1.0.0` was published manually, so trusted (OIDC) publishing can be enabled
now — pub.dev only allows configuring it for a package with at least one
published version, which this one already has.

**One-time setup** (do this before the first tag-triggered release): on
pub.dev, package Admin tab → Automated publishing → repository
`sxnnyside-project/flutter-sei`, tag pattern `v{{version}}`. No GitHub
secret is needed — pub.dev exchanges the workflow's OIDC token for a
short-lived publish credential itself.

**Every release from `v2.0.0` onward:** bump `version` in `pubspec.yaml`,
add a `## [x.y.z]` section to `CHANGELOG.md`, then
`git tag vX.Y.Z && git push --tags`. `.github/workflows/release.yml` takes
it from there: runs the full check gate, publishes to pub.dev, then creates
a GitHub Release with that version's changelog section as the release body.

## Deliberate DXQE exceptions

- **`pubspec.lock` is not committed** for the root package (it *is*
  committed for `example/`). This follows [Dart's own guidance for
  libraries](https://dart.dev/guides/libraries/private-files#pubspeclock):
  a published package should be tested against its declared version
  *range*, not pinned to one resolution — which is also how
  `flutter pub downgrade` lower-bound testing (part of this repo's `check`
  gate) stays meaningful. `example/`, as an application rather than a
  library, follows the opposite convention and does commit its lockfile.

## Review criteria

- `just check` must pass before merge.
- New/changed public API needs a CHANGELOG.md entry and dartdoc.
- Icon additions/removals must keep `SeiIcons`/`SeiIconsFilled` in sync
  with `assets/` — a mismatch fails at runtime, not at analyze time.
