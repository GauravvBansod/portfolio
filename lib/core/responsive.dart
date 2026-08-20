import 'package:flutter/widgets.dart';

enum ScreenSize { mobile, tablet, desktop }

class Breakpoints {
  static const double tablet = 760;
  static const double desktop = 1180;
  static const double maxContent = 1360;
}

class Responsive {
  const Responsive._();

  static ScreenSize of(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < Breakpoints.tablet) return ScreenSize.mobile;
    if (w < Breakpoints.desktop) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  static bool isMobile(BuildContext c) => of(c) == ScreenSize.mobile;
  static bool isTablet(BuildContext c) => of(c) == ScreenSize.tablet;
  static bool isDesktop(BuildContext c) => of(c) == ScreenSize.desktop;

  /// Pick a value per breakpoint; [tablet] falls back to [desktop].
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    switch (of(context)) {
      case ScreenSize.mobile:
        return mobile;
      case ScreenSize.tablet:
        return tablet ?? desktop;
      case ScreenSize.desktop:
        return desktop;
    }
  }

  static double hPad(BuildContext c) =>
      value(c, mobile: 20, tablet: 32, desktop: 40);

  static double sectionGap(BuildContext c) =>
      value(c, mobile: 72, tablet: 92, desktop: 112);

  /// Fluid font size that never goes below [min] or above [max].
  static double fluid(BuildContext c,
      {required double min, required double max, double vwFactor = .062}) {
    final w = MediaQuery.sizeOf(c).width;
    return (w * vwFactor).clamp(min, max);
  }

  /// Columns for a card grid given a minimum tile width.
  static int columnsFor(double available, double minTile, {int max = 3}) {
    final n = (available / minTile).floor();
    return n.clamp(1, max);
  }
}

/// Centers content and caps it at the layout max width.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.maxWidth});

  final Widget child;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? Breakpoints.maxContent),
        child: child,
      ),
    );
  }
}

/// Section wrapper: vertical rhythm + horizontal padding + max width.
class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.child,
    this.topBorder = false,
    this.verticalPadding,
  });

  final Widget child;
  final bool topBorder;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final v = verticalPadding ?? Responsive.sectionGap(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: topBorder
            ? const Border(top: BorderSide(color: Color(0x12FFFFFF)))
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.hPad(context), vertical: v),
        child: ContentWidth(child: child),
      ),
    );
  }
}
