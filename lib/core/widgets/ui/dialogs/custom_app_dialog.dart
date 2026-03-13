import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../utils/extensions/context_ext.dart';
import '../../custom_text_button.dart';

class CustomAppDialog extends StatelessWidget {
  const CustomAppDialog({
    super.key,
    this.title,
    required this.message,
    required this.primaryButtonText,
    this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.barrierDismissible = true,
  });

  final String? title;
  final String message;

  final String primaryButtonText;
  final VoidCallback? onPrimaryPressed;

  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  final bool barrierDismissible;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: colors.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─── Icon ───────────────────────────────────
            if (icon != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      (iconBackgroundColor ?? iconColor ?? AppColors.primary200)
                          .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: iconColor ?? AppColors.primary200,
                ),
              ),
              const SizedBox(height: 16),
            ],

            // ─── Title ──────────────────────────────────
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTextStyles.font18Bold.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
            ],

            // ─── Message ────────────────────────────────
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.font14Regular.copyWith(
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // ─── Buttons ────────────────────────────────
            if (secondaryButtonText != null)
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton.outlined(
                      text: secondaryButtonText!,
                      size: CustomButtonSize.small,
                      onPressed: () {
                        context.pop();
                        onSecondaryPressed?.call();
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextButton(
                      text: primaryButtonText,
                      size: CustomButtonSize.small,
                      onPressed: () {
                        context.pop();
                        onPrimaryPressed?.call();
                      },
                    ),
                  ),
                ],
              )
            else
              CustomTextButton(
                text: primaryButtonText,
                size: CustomButtonSize.small,
                onPressed: () {
                  context.pop();
                  onPrimaryPressed?.call();
                },
              ),
          ],
        ),
      ),
    );
  }
}
