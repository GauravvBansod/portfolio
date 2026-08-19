import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive.dart';
import 'package:portfolio/core/theme.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/glass_card.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return SectionShell(
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(flex: 85, child: _AboutCopy()),
                SizedBox(width: 56),
                Expanded(flex: 115, child: _AboutCards()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _AboutCopy(),
                SizedBox(height: 36),
                _AboutCards(),
              ],
            ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  const _AboutCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          index: '01',
          label: 'About',
          title: AppData.aboutHeading,
          titleSize: Responsive.fluid(context, min: 30, max: 48, vwFactor: .04),
        ),
        const SizedBox(height: 22),
        Text(AppData.aboutBody,
            style: AppText.body(
                Responsive.value(context, mobile: 16, desktop: 17))),
        const SizedBox(height: 30),
        GlassCard(
          radius: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EDUCATION & CERTIFICATION',
                  style: AppText.mono(10, color: AppColors.cyan)),
              const SizedBox(height: 14),
              Text(AppData.degree, style: AppText.heading(16)),
              const SizedBox(height: 4),
              Text(AppData.degreeMeta,
                  style: AppText.body(14, color: AppColors.textFaint)),
              const SizedBox(height: 14),
              const Divider(color: Color(0x14FFFFFF), height: 1),
              const SizedBox(height: 14),
              Text(AppData.certification, style: AppText.body(14)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutCards extends StatelessWidget {
  const _AboutCards();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        const gap = 18.0;

        Widget grid(List<Widget> children, double minTile, int max) {
          final cols = Responsive.columnsFor(c.maxWidth, minTile, max: max);
          final tile = (c.maxWidth - gap * (cols - 1)) / cols;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (final child in children) SizedBox(width: tile, child: child),
            ],
          );
        }

        return Column(
          children: [
            grid(
              [
                for (var i = 0; i < AppData.skillGroups.length; i++)
                  _SkillCard(
                    group: AppData.skillGroups[i],
                    accent: i == 0 ? AppColors.violetSoft : AppColors.cyan,
                  ),
              ],
              260,
              2,
            ),
            const SizedBox(height: gap),
            grid(
              [
                for (var i = 0; i < AppData.focuses.length; i++)
                  _FocusCard(
                    focus: AppData.focuses[i],
                    accent: i == 0
                        ? AppColors.violet
                        : (i == 2 ? AppColors.cyan : null),
                  ),
              ],
              210,
              3,
            ),
          ],
        );
      },
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.group, required this.accent});
  final SkillGroup group;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.title.toUpperCase(), style: AppText.mono(10, color: accent)),
          const SizedBox(height: 18),
          for (final item in group.items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(item, style: AppText.body(15)),
            ),
        ],
      ),
    );
  }
}

class _FocusCard extends StatelessWidget {
  const _FocusCard({required this.focus, this.accent});
  final FocusItem focus;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderColor: accent?.withOpacity(.28),
      gradient: accent == null
          ? null
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accent!.withOpacity(.1), accent!.withOpacity(.04)],
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(focus.title, style: AppText.heading(20), softWrap: true),
          const SizedBox(height: 10),
          Text(focus.body, style: AppText.body(14)),
        ],
      ),
    );
  }
}
