import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.green)),
      child: DropdownButton<String>(
          style: TextStyle(color: Colors.green),
          value: context.locale.languageCode,
          isExpanded: true,
          underline: SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.green,
          ),
          items: [
            DropdownMenuItem<String>(
              value: 'ar',
              child: Text('arabic'.tr()),
            ),
            DropdownMenuItem<String>(
              value: 'en',
              child: Text('english'.tr()),
            ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              context.setLocale(Locale(value));
            }
          }),
    );
  }
}
