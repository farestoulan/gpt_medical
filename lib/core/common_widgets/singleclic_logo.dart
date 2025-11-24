import 'package:flutter/material.dart';

/// Simple widget to display the SingleClic logo from assets.
///
/// Usage:
/// ```dart
/// SingleClicLogo(width: 200);
/// ```
class SingleClicLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final String semanticLabel;

  const SingleClicLogo({
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel = 'SingleClic logo',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Image.asset(
        'assets/images/singleclic_logo.jpeg',
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (ctx, error, stack) => _missingAssetPlaceholder(),
      ),
    );
  }

  Widget _missingAssetPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      width: width,
      height: height,
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_not_supported,
        size: 24,
        color: Colors.black26,
      ),
    );
  }
}
