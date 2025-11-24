import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'singleclic_logo.dart';

/// A small helper that returns an [AppBar] with the SingleClic logo as the
/// title. Use this across pages to have a consistent header.
class AppHeader {
  /// Returns a standard AppBar containing the SingleClic logo centered.
  static AppBar standard({
    double logoWidth = 160,
    Color? backgroundColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: SingleClicLogo(width: logoWidth, semanticLabel: 'SingleClic'),
      elevation: 0,
      actions: actions,
      bottom: bottom,
      // Hide the implied leading widget on web (so no back/menu icon appears).
      // Use an explicit empty leading widget on web to ensure consistent behavior
      // across platforms. On non-web platforms we keep the default implied
      // behavior so back buttons and drawer icons appear as expected.
      automaticallyImplyLeading: !kIsWeb,
      leading: kIsWeb ? const SizedBox.shrink() : null,
    );
  }
}
