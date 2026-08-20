import 'package:flutter/material.dart';
import '../core/theme.dart';

class GlassCard extends StatefulWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(26),
    this.radius = 20,
    this.gradient,
    this.borderColor,
    this.hoverBorderColor,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? hoverBorderColor;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final border = _hover
        ? (widget.hoverBorderColor ?? AppColors.violet.withOpacity(.45))
        : (widget.borderColor ?? AppColors.border);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: widget.padding,
        decoration: BoxDecoration(
          gradient: widget.gradient ?? AppGradients.glass,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: border),
        ),
        child: widget.child,
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(.12)),
      ),
      child: Text(label,
          style: AppText.mono(11, color: AppColors.textMuted)
              .copyWith(letterSpacing: .4)),
    );
  }
}

class PillBadge extends StatelessWidget {
  const PillBadge(this.label, {super.key, this.color = AppColors.cyan});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(.32)),
      ),
      child: Text(label.toUpperCase(), style: AppText.mono(10, color: color)),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key, required this.style, this.textAlign});
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppGradients.brand.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style, textAlign: textAlign),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.index,
    required this.label,
    required this.title,
    this.trailing,
    this.titleSize = 48,
  });

  final String index;
  final String label;
  final String title;
  final Widget? trailing;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    final head = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$index — ${label.toUpperCase()}',
            style: AppText.mono(11, color: AppColors.violet)),
        const SizedBox(height: 18),
        Text(title, style: AppText.display(titleSize)),
      ],
    );

    if (trailing == null) return head;

    return Wrap(
      spacing: 32,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: head),
        trailing!,
      ],
    );
  }
}

class ImageOrPlaceholder extends StatelessWidget {
  const ImageOrPlaceholder({
    super.key,
    required this.asset,
    required this.label,
    this.fit = BoxFit.cover,
  });

  final String? asset;
  final String label;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    Widget placeholder() => ColoredBox(
          color: const Color(0xFF11141B),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: AppText.mono(11, color: AppColors.textFaint)),
            ),
          ),
        );

    if (asset == null) return placeholder();
    return Image.asset(
      asset!,
      fit: fit,
      errorBuilder: (_, __, ___) => placeholder(),
    );
  }
}
