/// The subset of [SeiIcons] that also has a filled asset.
///
/// Passing a [SeiIconsFilled] value to [SeiIcon.filled] is always valid —
/// unlike requesting an arbitrary [SeiIcons] value with
/// `style: SeiStyle.filled` on the deprecated constructor, it cannot
/// reference an icon that has no filled artwork.
enum SeiIconsFilled {
  badge('badge'),
  check('check'),
  crown('crown'),
  error('error'),
  flame('flame'),
  folder('folder'),
  globe('globe'),
  heart('heart'),
  help('help'),
  home('home'),
  info('info'),
  lock('lock'),
  message('message'),
  more('more'),
  notification('notification'),
  shield('shield'),
  sound('sound'),
  star('star'),
  success('success'),
  user('user'),
  verified('verified'),
  warning('warning'),
  wifi('wifi');

  const SeiIconsFilled(this.fileName);

  /// The SVG file name for this icon, without path or extension.
  final String fileName;
}
