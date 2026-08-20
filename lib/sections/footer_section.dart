import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.02),
        border: const Border(top: BorderSide(color: Color(0x12FFFFFF))),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.hPad(context), vertical: 28),
        child: ContentWidth(
          child: Wrap(
            spacing: 24,
            runSpacing: 12,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(AppData.name, style: AppText.heading(16, color: AppColors.text)),
              Text('${AppData.role} · ${AppData.location}'.toUpperCase(),
                  style: AppText.mono(11)),
            ],
          ),
        ),
      ),
    );
  }
}
