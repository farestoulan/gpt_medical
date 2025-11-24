import 'package:flutter/material.dart';
import 'package:gpt_model/core/common_widgets/singleclic_logo.dart';

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
    );
  }
}
