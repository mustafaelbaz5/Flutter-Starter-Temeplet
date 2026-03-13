import 'package:flutter/material.dart';
import 'package:flutter_structure/core/utils/extensions/num_ext.dart';
import 'package:flutter_structure/core/utils/functions/app_setting_method.dart';
import 'package:flutter_structure/core/utils/spacing.dart';
import 'package:flutter_structure/core/widgets/custom_text_button.dart';
import 'package:flutter_structure/core/widgets/custom_text_form_.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(rr(16)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(5.toCurrency()),
              SizedBox(height: rh(32)),
              const Text("ازيكم يا جماعة"),
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
    );
  }
}
