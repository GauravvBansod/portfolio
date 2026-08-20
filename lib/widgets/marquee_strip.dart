import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 34),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  List<Widget> _items() {
    final accents = [AppColors.violetSoft, AppColors.cyan];
    return [
      for (var i = 0; i < AppData.marquee.length; i++)
        Padding(
          padding: const EdgeInsets.only(right: 52),
          child: Text(
            AppData.marquee[i].toUpperCase(),
            style: AppText.mono(12,
                color: i.isOdd ? accents[(i ~/ 2) % 2] : AppColors.textFaint),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.02),
        border: const Border.symmetric(
            horizontal: BorderSide(color: Color(0x12FFFFFF))),
      ),
      child: SizedBox(
        height: 54,
        child: ClipRect(
          child: Builder(
            builder: (context) {
              final row = Row(mainAxisSize: MainAxisSize.min, children: _items());
              return AnimatedBuilder(
                animation: _c,
                builder: (context, _) {
                  return OverflowBox(
                    alignment: Alignment.centerLeft,
                    maxWidth: double.infinity,
                    child: FractionalTranslation(
                      translation: Offset(-_c.value / 2, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [row, row],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
