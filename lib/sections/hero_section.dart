import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onWork, required this.onContact});

  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final copy = _HeroCopy(onWork: onWork, onContact: onContact);
    const portrait = _HeroPortrait();

    return SectionShell(
      verticalPadding: Responsive.value(context, mobile: 48, tablet: 72, desktop: 96),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 12, child: copy),
                const SizedBox(width: 64),
                const Expanded(flex: 8, child: portrait),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                copy,
                const SizedBox(height: 48),
                portrait,
              ],
            ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.onWork, required this.onContact});

  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final titleSize =
        Responsive.fluid(context, min: 38, max: 82, vwFactor: .062);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.violet.withOpacity(.1),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.violet.withOpacity(.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                    color: AppColors.cyan, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(AppData.availability,
                    style: AppText.mono(11, color: AppColors.violetPale)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Text(AppData.heroLine1, style: AppText.display(titleSize)),
        Text(AppData.heroLine2, style: AppText.display(titleSize)),
        GradientText(AppData.heroAccent, style: AppText.display(titleSize)),
        const SizedBox(height: 26),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(AppData.heroBody,
              style: AppText.body(
                  Responsive.value(context, mobile: 16, desktop: 19))),
        ),
        const SizedBox(height: 34),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _SolidButton(label: 'View selected work', onTap: onWork),
            _GhostButton(label: 'Get in touch', onTap: onContact),
          ],
        ),
        const SizedBox(height: 48),
        LayoutBuilder(
          builder: (context, c) {
            final cols = Responsive.columnsFor(c.maxWidth, 150, max: 3);
            const gap = 16.0;
            final tile = (c.maxWidth - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final s in AppData.stats)
                  SizedBox(
                    width: tile,
                    child: GlassCard(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 20),
                      radius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s[0],
                              style: AppText.heading(
                                  Responsive.value(context, mobile: 28, desktop: 34))),
                          const SizedBox(height: 8),
                          Text(s[1].toUpperCase(),
                              style: AppText.mono(10, color: AppColors.textFaint)),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  const _HeroPortrait();

  @override
  Widget build(BuildContext context) {
    final height =
        Responsive.value(context, mobile: 420.0, tablet: 480.0, desktop: 540.0);

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: AppGradients.brand,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ImageOrPlaceholder(
              asset: 'assets/images/portrait.jpg',
              label: 'Add assets/images/portrait.jpg',
            ),
            Positioned(
              left: 18,
              right: 18,
              bottom: 18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.bg.withOpacity(.72),
                      border: Border.all(color: Colors.white.withOpacity(.1)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jr. Flutter Developer',
                                  style: AppText.heading(15)),
                              const SizedBox(height: 3),
                              Text('Samruddh Bharat Technologies',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppText.body(12,
                                      color: AppColors.textFaint)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text('NOW', style: AppText.mono(10, color: AppColors.cyan)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SolidButton extends StatelessWidget {
  const _SolidButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(label,
              style: AppText.body(15, color: AppColors.bg)
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(.16)),
          ),
          child: Text(label,
              style: AppText.body(15, color: AppColors.text)
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
