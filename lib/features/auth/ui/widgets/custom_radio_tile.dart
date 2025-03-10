import 'package:flutter/material.dart';
import 'package:mobile_app_project/core/components/custom_text.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String text;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value), // Allows tapping the text to select
      child: Row(
        children: [
          Radio<T>(
            activeColor: Colors.blue,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          CustomText(text: text),
        ],
      ),
    );
  }
}
