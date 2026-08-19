import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      topBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            index: '02',
            label: 'Experience',
            title: "Where I've been building",
            titleSize: Responsive.fluid(context, min: 30, max: 48, vwFactor: .04),
            trailing: Text('May 2024 → Present',
                style: AppText.mono(12).copyWith(letterSpacing: .6)),
          ),
          const SizedBox(height: 44),
          for (final job in AppData.jobs)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _JobCard(job: job),
            ),
        ],
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final accent = job.current ? AppColors.violetSoft : AppColors.cyan;

    final meta = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PillBadge(job.badge,
            color: job.current ? AppColors.cyan : const Color(0xFF8B93A7)),
        const SizedBox(height: 16),
        Text(job.role, style: AppText.heading(22)),
        const SizedBox(height: 6),
        Text(job.company, style: AppText.body(16, color: AppColors.textMuted)),
        const SizedBox(height: 14),
        Text('${job.period}\n${job.location}',
            style: AppText.mono(12).copyWith(height: 1.7, letterSpacing: .4)),
      ],
    );

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final bullet in job.bullets)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 14),
                  child: Text('›', style: AppText.body(18, color: accent)),
                ),
                Expanded(child: Text(bullet, style: AppText.body(16))),
              ],
            ),
          ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final tag in job.stack) TagChip(tag)],
        ),
      ],
    );

    return GlassCard(
      padding: EdgeInsets.all(Responsive.value(context, mobile: 24, desktop: 36)),
      radius: 24,
      borderColor: job.current ? AppColors.violet.withOpacity(.3) : null,
      gradient: job.current
          ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.violet.withOpacity(.12),
                Colors.white.withOpacity(.02),
              ],
            )
          : null,
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 280, child: meta),
                const SizedBox(width: 48),
                Expanded(child: body),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [meta, const SizedBox(height: 26), body],
            ),
    );
  }
}
