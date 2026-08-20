import 'package:flutter/material.dart';
import 'package:flutter_sei/flutter_sei.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SeiIcons', () {
    test('exposes the correct fileName for hyphenated names', () {
      expect(SeiIcons.home.fileName, 'home');
      expect(SeiIcons.chartBar.fileName, 'chart-bar');
      expect(SeiIcons.creditCard.fileName, 'credit-card');
      expect(SeiIcons.layoutGrid.fileName, 'layout-grid');
      expect(SeiIcons.visibilityOff.fileName, 'visibility-off');
    });

    test('contains a substantial, de-duplicated icon set', () {
      expect(SeiIcons.values.length, greaterThan(100));
      final fileNames = SeiIcons.values.map((e) => e.fileName).toSet();
      expect(fileNames.length, SeiIcons.values.length);
    });
  });

  group('SeiIconsFilled', () {
    test('every value has a matching SeiIcons entry', () {
      final outlineNames = SeiIcons.values.map((e) => e.fileName).toSet();
      for (final filled in SeiIconsFilled.values) {
        expect(
          outlineNames.contains(filled.fileName),
          isTrue,
          reason: '${filled.fileName} has a filled asset but no outline entry',
        );
      }
    });
  });

  group('resolveAssetPath', () {
    test('builds the outline asset path', () {
      expect(
        resolveAssetPath(SeiIcons.home, SeiStyle.outline),
        'packages/flutter_sei/assets/outline/home.svg',
      );
    });
  });

  group('resolveFilledAssetPath', () {
    test('builds the filled asset path', () {
      expect(
        resolveFilledAssetPath(SeiIconsFilled.star),
        'packages/flutter_sei/assets/filled/star.svg',
      );
    });
  });

  group('SeiIcon widget', () {
    testWidgets('builds an outline icon at the default size', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: SeiIcon(icon: SeiIcons.home),
        ),
      );

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.width, 24.0);
      expect(svg.height, 24.0);
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('honors size and color overrides', (tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: SeiIcon(icon: SeiIcons.search, size: 40, color: Colors.blue),
        ),
      );

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.width, 40);
      expect(svg.height, 40);
      expect(svg.colorFilter, isNotNull);
    });

    testWidgets('SeiIcon.filled only accepts icons with filled artwork', (
      tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: SeiIcon.filled(icon: SeiIconsFilled.star),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      // Pumping to settle proves the referenced asset actually loads —
      // SeiIconsFilled makes it impossible to reference one that doesn't.
      await tester.pumpAndSettle();
    });
  });
}
