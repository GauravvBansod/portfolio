import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.onGithub});
  final VoidCallback onGithub;

  @override
  Widget build(BuildContext context) {
    final flagship = AppData.projects.firstWhere((p) => p.flagship);
    final rest = AppData.projects.where((p) => !p.flagship).toList();

    return SectionShell(
      topBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            index: '03',
            label: 'Selected work',
            title: 'Three apps, three problems',
            titleSize: Responsive.fluid(context, min: 30, max: 48, vwFactor: .04),
            trailing: _GithubButton(onTap: onGithub),
          ),
          const SizedBox(height: 44),
          _FlagshipCard(project: flagship),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, c) {
              const gap = 20.0;
              final cols = Responsive.columnsFor(c.maxWidth, 340, max: 2);
              final tile = (c.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (var i = 0; i < rest.length; i++)
                    SizedBox(
                      width: tile,
                      child: _ProjectCard(
                        project: rest[i],
                        accent: i == 0 ? AppColors.violetSoft : AppColors.cyan,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FlagshipCard extends StatelessWidget {
  const _FlagshipCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(project.kicker.toUpperCase(),
            style: AppText.mono(10, color: AppColors.cyan)),
        const SizedBox(height: 16),
        Text(project.name,
            style: AppText.display(
                Responsive.value(context, mobile: 32, desktop: 42))),
        const SizedBox(height: 8),
        Text(project.subtitle, style: AppText.body(16)),
        const SizedBox(height: 20),
        Text(project.summary,
            style: AppText.body(
                Responsive.value(context, mobile: 16, desktop: 17),
                color: const Color(0xB8EDEFF5))),
        const SizedBox(height: 26),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final tag in project.stack) TagChip(tag)],
        ),
      ],
    );

    final phone = Center(child: _PhoneMock(asset: project.image));

    return GlassCard(
      padding: EdgeInsets.all(Responsive.value(context, mobile: 24, desktop: 44)),
      radius: 28,
      gradient: AppGradients.accentCard,
      borderColor: const Color(0x1AFFFFFF),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: copy),
                const SizedBox(width: 48),
                Expanded(flex: 9, child: phone),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [copy, const SizedBox(height: 36), phone],
            ),
    );
  }
}

class _PhoneMock extends StatelessWidget {
  const _PhoneMock({this.asset});
  final String? asset;

  @override
  Widget build(BuildContext context) {
    final w = Responsive.value(context, mobile: 210.0, desktop: 246.0);
    return Container(
      width: w,
      height: w * (500 / 246),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0C11),
        borderRadius: BorderRadius.circular(38),
        border: Border.all(color: const Color(0xFF0A0C11), width: 9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.6),
            blurRadius: 80,
            offset: const Offset(0, 40),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ImageOrPlaceholder(
          asset: asset,
          label: 'Add assets/images/smartforce.png',
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.accent});
  final Project project;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.all(Responsive.value(context, mobile: 24, desktop: 36)),
      radius: 24,
      hoverBorderColor: accent.withOpacity(.45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.kicker.toUpperCase(), style: AppText.mono(10, color: accent)),
          const SizedBox(height: 14),
          Text(project.name,
              style: AppText.heading(
                  Responsive.value(context, mobile: 26, desktop: 30))),
          const SizedBox(height: 14),
          Text(project.summary, style: AppText.body(16)),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final tag in project.stack) TagChip(tag)],
          ),
        ],
      ),
    );
  }
}

class _GithubButton extends StatelessWidget {
  const _GithubButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(.14)),
          ),
          child: Text('github.com/GauravvBansod ↗',
              style: AppText.mono(12, color: AppColors.text)
                  .copyWith(letterSpacing: .6)),
        ),
      ),
    );
  }
}
