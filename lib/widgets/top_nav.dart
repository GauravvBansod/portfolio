import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';

class NavItem {
  const NavItem(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;
}

class TopNav extends StatelessWidget {
  const TopNav({
    super.key,
    required this.items,
    required this.onResume,
    required this.onMenu,
  });

  final List<NavItem> items;
  final VoidCallback onResume;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final compact = !Responsive.isDesktop(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bg.withOpacity(.72),
            border: const Border(bottom: BorderSide(color: Color(0x12FFFFFF))),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.hPad(context), vertical: 14),
          child: ContentWidth(
            child: Row(
              children: [
                const _Wordmark(),
                const Spacer(),
                if (compact)
                  IconButton(
                    onPressed: onMenu,
                    icon: const Icon(Icons.menu_rounded, color: AppColors.text),
                    tooltip: 'Menu',
                  )
                else ...[
                  for (final item in items) _NavLink(item: item),
                  const SizedBox(width: 10),
                  _ResumeButton(onTap: onResume),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppGradients.brand,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text('GB',
              style: AppText.heading(15, color: AppColors.bg)
                  .copyWith(letterSpacing: 0)),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            AppData.name,
            overflow: TextOverflow.ellipsis,
            style: AppText.heading(17, color: AppColors.text),
          ),
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.item});
  final NavItem item;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.item.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          decoration: BoxDecoration(
            color: _hover ? Colors.white.withOpacity(.06) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.item.label,
            style: AppText.body(14,
                color: _hover ? AppColors.text : AppColors.textMuted),
          ),
        ),
      ),
    );
  }
}

class _ResumeButton extends StatelessWidget {
  const _ResumeButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          decoration: BoxDecoration(
            gradient: AppGradients.brand,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.violet.withOpacity(.35),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text('Download résumé',
              style: AppText.body(14, color: Colors.white)
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.items, required this.onResume});

  final List<NavItem> items;
  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B0D12),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppData.name, style: AppText.heading(20)),
              const SizedBox(height: 4),
              Text(AppData.role, style: AppText.mono(11)),
              const SizedBox(height: 28),
              for (final item in items)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(item.label, style: AppText.body(17, color: AppColors.text)),
                  onTap: () {
                    Navigator.of(context).maybePop();
                    item.onTap();
                  },
                ),
              const Spacer(),
              _ResumeButton(onTap: () {
                Navigator.of(context).maybePop();
                onResume();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
