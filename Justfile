# flutter_sei — Task Runner Abstraction Layer (DXQE Part 3)
#
# Dart has no separate type-checker from its linter — `dart analyze` does
# both in one pass — so `typecheck` and `lint` intentionally run the same
# underlying command here. That's Dart's tooling reality, not a shortcut.

install:
    flutter pub get
    cd example && flutter pub get

dev:
    cd example && flutter run

build:
    cd example && flutter build apk --debug

test:
    flutter test

typecheck:
    flutter analyze

lint:
    flutter analyze
    cd example && flutter analyze

format:
    dart format .

format-check:
    dart format --output=none --set-exit-if-changed .

check: format-check lint typecheck test
    flutter pub publish --dry-run

clean:
    flutter clean
    cd example && flutter clean
