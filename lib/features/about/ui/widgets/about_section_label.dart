import 'package:flutter/material.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/utils/extensions/context_ext.dart';

class AboutSectionLabel extends StatelessWidget {
  final String label;

  const AboutSectionLabel(this.label, {super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Text(
      label.toUpperCase(),
      style: AppTextStyles.font12Bold.copyWith(
        color: colors.textHint,
        letterSpacing: 1.2,
      ),
    );
  }
}
