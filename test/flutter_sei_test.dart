import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sei/flutter_sei.dart';

void main() {
  test('SeiIcon enum has correct fileName mapping', () {
    expect(SeiIcon.home.fileName, 'home');
    expect(SeiIcon.chartBar.fileName, 'chart-bar');
    expect(SeiIcon.creditCard.fileName, 'credit-card');
    expect(SeiIcon.layoutGrid.fileName, 'layout-grid');
    expect(SeiIcon.visibilityOff.fileName, 'visibility-off');
  });

  test('resolveAssetPath generates correct paths', () {
    final outlinePath = resolveAssetPath(SeiIcon.home, SeiStyle.outline);
    expect(outlinePath, 'packages/flutter_sei/assets/outline/home.svg');

    final filledPath = resolveAssetPath(SeiIcon.star, SeiStyle.filled);
    expect(filledPath, 'packages/flutter_sei/assets/filled/star.svg');
  });

  test('SeiIcon enum contains all expected icons', () {
    // Verify some key icons exist
    expect(SeiIcon.values.contains(SeiIcon.home), true);
    expect(SeiIcon.values.contains(SeiIcon.search), true);
    expect(SeiIcon.values.contains(SeiIcon.settings), true);
    expect(SeiIcon.values.contains(SeiIcon.user), true);

    // Verify enum has substantial number of icons
    expect(SeiIcon.values.length, greaterThan(100));
  });
}
