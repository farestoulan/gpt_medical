import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? web;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.web,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isWeb(context) && web != null) {
      return web!;
    } else if (ResponsiveHelper.isDesktop(context) && desktop != null) {
      return desktop!;
    } else if (ResponsiveHelper.isTablet(context) && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

class AdaptiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const AdaptiveContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveHelper.getDeviceType(context);

    double? containerMaxWidth;
    EdgeInsets containerPadding;
    Color containerBackgroundColor = backgroundColor ?? Colors.transparent;

    switch (deviceType) {
      case DeviceType.mobile:
        containerMaxWidth = null; // Full width
        containerPadding = const EdgeInsets.all(16);
        break;
      case DeviceType.tablet:
        containerMaxWidth = 800;
        containerPadding = const EdgeInsets.all(24);
        break;
      case DeviceType.desktop:
        containerMaxWidth = 1200;
        containerPadding = const EdgeInsets.all(32);
        break;
    }

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? containerMaxWidth ?? double.infinity,
      ),
      padding: padding ?? containerPadding,
      color: containerBackgroundColor,
      child: child,
    );
  }
}

class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  const AdaptiveGrid({
    super.key,
    required this.children,
    this.spacing = 16,
    this.runSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveHelper.getResponsiveColumns(context);

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children:
          children.map((child) {
            return SizedBox(
              width:
                  (MediaQuery.of(context).size.width -
                      (spacing * (columns - 1)) -
                      (ResponsiveHelper.getResponsivePadding(
                        context,
                      ).horizontal)) /
                  columns,
              child: child,
            );
          }).toList(),
    );
  }
}

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const AdaptiveAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveHelper.getDeviceType(context);

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveHelper.getResponsiveFontSize(
            context,
            mobile: 18,
            tablet: 20,
            desktop: 22,
          ),
        ),
      ),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      elevation: deviceType == DeviceType.desktop ? 0 : 4,
      backgroundColor: const Color(0xFF2E7D32),
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
