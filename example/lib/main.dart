import 'package:flutter/material.dart';
import 'package:flutter_sei/flutter_sei.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_sei example',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      home: const IconGalleryPage(),
    );
  }
}

/// Demonstrates the core ways to use [SeiIcon]: as a plain icon, sized and
/// colored, toggled between outline and filled, and inside common Flutter
/// widgets like [AppBar], [IconButton], and [ListTile].
class IconGalleryPage extends StatefulWidget {
  const IconGalleryPage({super.key});

  @override
  State<IconGalleryPage> createState() => _IconGalleryPageState();
}

class _IconGalleryPageState extends State<IconGalleryPage> {
  bool _filled = false;

  // SeiIconsFilled, not SeiIcons: every value here is guaranteed to have a
  // filled asset, so the gallery below can toggle style safely.
  static const _gallery = [
    SeiIconsFilled.home,
    SeiIconsFilled.heart,
    SeiIconsFilled.star,
    SeiIconsFilled.user,
    SeiIconsFilled.lock,
    SeiIconsFilled.shield,
    SeiIconsFilled.success,
    SeiIconsFilled.warning,
  ];

  /// Renders [icon] in the currently selected style.
  Widget _icon(SeiIconsFilled icon, {double size = 24, Color? color}) {
    return _filled
        ? SeiIcon.filled(icon: icon, size: size, color: color)
        : SeiIcon(
            icon: SeiIcons.values.byName(icon.name),
            size: size,
            color: color,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // A plain icon at its default size, used like any other Flutter icon.
        leading: const SeiIcon(icon: SeiIcons.apps),
        title: const Text('flutter_sei'),
        actions: [
          // A larger, tinted icon inside an IconButton toggles the style.
          IconButton(
            icon: SeiIcon(
              icon: SeiIcons.refresh,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            tooltip: 'Toggle style',
            onPressed: () => setState(() => _filled = !_filled),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Style: ${_filled ? 'filled' : 'outline'}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            // A grid of icons sharing the current style and a custom size.
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final icon in _gallery)
                  Center(child: _icon(icon, size: 32)),
              ],
            ),
            const Divider(height: 32),
            // Icons composed inside a real list, one common consumption pattern.
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: _icon(SeiIconsFilled.notification),
                    title: const Text('Notifications'),
                  ),
                  ListTile(
                    leading: _icon(SeiIconsFilled.shield, color: Colors.green),
                    title: const Text('Security'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
