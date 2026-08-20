import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/glass_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.onOpen});
  final void Function(String url) onOpen;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final left = _ContactCopy(onOpen: onOpen);
    const form = ContactForm();

    return SectionShell(
      topBorder: true,
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: left),
                const SizedBox(width: 64),
                const Expanded(child: form),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [left, const SizedBox(height: 40), form],
            ),
    );
  }
}

class _ContactCopy extends StatelessWidget {
  const _ContactCopy({required this.onOpen});
  final void Function(String url) onOpen;

  @override
  Widget build(BuildContext context) {
    final size = Responsive.fluid(context, min: 34, max: 56, vwFactor: .045);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('04 — CONTACT', style: AppText.mono(11, color: AppColors.violet)),
        const SizedBox(height: 18),
        Text("Let's build", style: AppText.display(size)),
        GradientText('something good', style: AppText.display(size)),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Text(
            'Open to Flutter roles and freelance app work. Email is the '
            'fastest way to reach me — I reply within a day.',
            style: AppText.body(17),
          ),
        ),
        const SizedBox(height: 32),
        for (final link in AppData.contactLinks)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _ContactRow(link: link, onTap: () => onOpen(link.url)),
          ),
      ],
    );
  }
}

class _ContactRow extends StatefulWidget {
  const _ContactRow({required this.link, required this.onTap});
  final ContactLink link;
  final VoidCallback onTap;

  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final stack = Responsive.isMobile(context);

    final label = Text(widget.link.label.toUpperCase(),
        style: AppText.mono(10, color: AppColors.textFaint));
    final value = Text(widget.link.value,
        overflow: TextOverflow.ellipsis,
        style: AppText.body(16, color: AppColors.text));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: _hover
                ? AppColors.violet.withOpacity(.1)
                : Colors.white.withOpacity(.025),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hover ? AppColors.violet.withOpacity(.5) : AppColors.border,
            ),
          ),
          child: stack
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [label, const SizedBox(height: 6), value],
                )
              : Row(
                  children: [
                    label,
                    const SizedBox(width: 16),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight, child: value),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _sent = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: AppText.body(16, color: const Color(0x66EDEFF5)),
        filled: true,
        fillColor: AppColors.bg.withOpacity(.55),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(.14)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.violet),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF7A7A)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFF7A7A)),
        ),
      );

  Widget _field(String label, TextEditingController c,
      {int lines = 1, String? hint, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppText.mono(10, color: AppColors.textFaint)),
        const SizedBox(height: 8),
        TextFormField(
          controller: c,
          maxLines: lines,
          minLines: lines,
          validator: validator,
          onChanged: (_) {
            if (_sent) setState(() => _sent = false);
          },
          style: AppText.body(16, color: AppColors.text),
          decoration: _dec(hint ?? ''),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.all(Responsive.value(context, mobile: 24, desktop: 40)),
      radius: 24,
      borderColor: const Color(0x1AFFFFFF),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.violet.withOpacity(.1), Colors.white.withOpacity(.02)],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _field('Your name', _name,
                hint: 'Jane Doe',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Please add your name' : null),
            _field('Email', _email,
                hint: 'jane@company.com',
                validator: (v) => (v == null || !v.contains('@'))
                    ? 'Please add a valid email'
                    : null),
            _field('Message', _message, lines: 5, hint: 'What are you building?'),
            _SubmitButton(
              label: _sent ? "Thanks — I'll be in touch" : 'Send message',
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() => _sent = true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 17),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppGradients.brand,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.violet.withOpacity(.35),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Text(label, style: AppText.heading(16, color: AppColors.bg)),
        ),
      ),
    );
  }
}
