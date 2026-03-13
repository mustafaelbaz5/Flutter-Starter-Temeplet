import 'package:flutter/material.dart';
import 'package:flutter_structure/core/themes/app_text_styles.dart';
import 'package:flutter_structure/core/utils/extensions/context_ext.dart';

import '../../../core/utils/extensions/num_ext.dart';
import '../../../core/utils/functions/app_setting_method.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(rr(16)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Hello World", style: AppTextStyles.font20SemiBold),
                Text(5.toCurrency()),
                verticalSpacing(32),
                Text(
                  "السلام عليكم ورحمة",
                  style: AppTextStyles.font18Light.copyWith(
                    color: context.customColors.info,
                  ),
                ),
                Text(
                  "صلي على نبينا محمد",
                  style: AppTextStyles.font18Light.copyWith(
                    color: context.customColors.error,
                  ),
                ),
                SizedBox(height: rh(32)),
                const CustomTextForm(
                  hintText: 'Email',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                ),
                verticalSpacing(56),
                const CustomTextForm(
                  hintText: 'password',
                  isPassword: true,
                  keyboardType: TextInputType.number,
                ),
                verticalSpacing(56),
                Center(
                  child: CustomTextButton(
                    isFullWidth: false,
                    text: "Swith Theme",
                    onPressed: () {
                      switchTheme(context);
                    },
                  ),
                ),
                verticalSpacing(32),
                Center(
                  child: CustomTextButton.outlined(
                    isFullWidth: false,
                    text: "Switch lan",
                    onPressed: () {
                      switchLanguage(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
