import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/utils/extensions/context_ext.dart';
import '../../../../core/utils/spacing.dart';

class AboutAppHeader extends StatelessWidget {
  const AboutAppHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Row(
      children: [
        // App icon
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primary200.withOpacity(0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.apps_rounded, // TODO: replace with your app icon
            color: AppColors.primary200,
            size: 30,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConfig.appName,
              style: AppTextStyles.font20Bold.copyWith(
                color: colors.textPrimary,
              ),
            ),
            verticalSpacing(2),
            Text(
              'v${AppConfig.appVersion} (${AppConfig.buildNumber})',
              style: AppTextStyles.font14Regular.copyWith(
                color: colors.textHint,
              ),
            ),
            // Only show in development
            if (AppConfig.isDevelopment) ...[
              verticalSpacing(6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.amber200.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Development',
                  style: AppTextStyles.font12Regular.copyWith(
                    color: AppColors.amber200,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
