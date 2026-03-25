import 'package:flutter/material.dart';
import 'package:flutter_structure/core/utils/functions/app_setting_method.dart';
import 'package:flutter_structure/core/utils/functions/url_launcher.dart';

import '../../../core/config/app_config.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/utils/extensions/context_ext.dart';
import '../../../core/utils/spacing.dart';
import '../data/about_constants.dart';
import 'widgets/about_app_header.dart';
import 'widgets/about_flat_row.dart';
import 'widgets/about_section_label.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(16),

              // ── Back ──────────────────────────────────────────────
              GestureDetector(
                onTap: () => context.pop(),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: colors.textPrimary,
                  ),
                ),
              ),
              verticalSpacing(32),

              // ── App Header ────────────────────────────────────────
              const AboutAppHeader(),
              verticalSpacing(40),

              // ── App Info ──────────────────────────────────────────
              const AboutSectionLabel('App Info'),
              verticalSpacing(12),
              AboutFlatRow(
                icon: Icons.smartphone_rounded,
                label: 'Platform',
                trailing: isIos ? 'iOS' : 'Android',
              ),
              AboutFlatRow(
                icon: Icons.grid_view_rounded,
                label: 'Package',
                trailing: isIos
                    ? AboutConstants.iosStoreUrl.split('/').last
                    : AboutConstants.androidStoreUrl.split('=').last,
              ),
              AboutFlatRow(
                icon: Icons.update_rounded,
                label: 'Last Updated',
                trailing: _currentYear,
                showDivider: false,
              ),
              verticalSpacing(40),

              // ── Developer ─────────────────────────────────────────
              const AboutSectionLabel('Developer'),
              verticalSpacing(12),
              const AboutFlatRow(
                icon: Icons.person_outline_rounded,
                label: AppConfig.developerName,
              ),
              AboutFlatRow(
                icon: Icons.email_outlined,
                label: AppConfig.developerEmail,
                onTap: () => switchLanguage(context),
                // onTap: () => AppLauncher.openEmail(
                //   to: AppConfig.developerEmail,
                //   subject: AboutConstants.contactSubject,
                // ),
              ),

              verticalSpacing(40),

              // ── Support ───────────────────────────────────────────
              const AboutSectionLabel('Support'),
              verticalSpacing(12),
              AboutFlatRow(
                icon: Icons.star_outline_rounded,
                label: 'Rate the App',
                onTap: () => AppLauncher.openStore(
                  androidUrl: AboutConstants.androidStoreUrl,
                  iosUrl: AboutConstants.iosStoreUrl,
                  isIos: isIos,
                ),
              ),
              AboutFlatRow(
                icon: Icons.bug_report_outlined,
                label: 'Report a Bug',
                onTap: () => AppLauncher.openEmail(
                  to: AppConfig.developerEmail,
                  subject: AboutConstants.bugReportSubject,
                  body: AboutConstants.bugReportBody,
                ),
              ),
              AboutFlatRow(
                icon: Icons.mail_outline_rounded,
                label: 'Contact Us',
                onTap: () => AppLauncher.openEmail(
                  to: AppConfig.developerEmail,
                  subject: AboutConstants.contactSubject,
                ),
                showDivider: false,
              ),
              verticalSpacing(40),

              // ── Legal ─────────────────────────────────────────────
              const AboutSectionLabel('Legal'),
              verticalSpacing(12),
              AboutFlatRow(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy Policy',
                onTap: () => AppLauncher.openUrl(
                  AboutConstants.privacyPolicyUrl,
                ),
              ),
              AboutFlatRow(
                icon: Icons.description_outlined,
                label: 'Terms of Service',
                onTap: () => AppLauncher.openUrl(
                  AboutConstants.termsOfServiceUrl,
                ),
              ),
              AboutFlatRow(
                icon: Icons.article_outlined,
                label: 'Open Source Licenses',
                onTap: () => showLicensePage(
                  context: context,
                  applicationName: AppConfig.appName,
                  applicationVersion: AppConfig.appVersion,
                ),
                showDivider: false,
              ),
              verticalSpacing(56),

              // ── Footer ────────────────────────────────────────────
              Center(
                child: Column(
                  children: [
                    Text(
                      '© $_currentYear ${AppConfig.appName}',
                      style: AppTextStyles.font12Regular.copyWith(
                        color: colors.textHint,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(
                      'Made with ❤ by ${AppConfig.developerName}',
                      style: AppTextStyles.font12Regular.copyWith(
                        color: colors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(32),
            ],
          ),
        ),
      ),
    );
  }

  String get _currentYear => DateTime.now().year.toString();
}
