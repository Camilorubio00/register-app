import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? fieldSelected;
  final List<String> fields;
  final String textHint;
  final bool isEnabled;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownWidget({
    super.key,
    this.fieldSelected,
    required this.fields,
    required this.textHint,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isEnabled ? Colors.white : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEnabled ? Colors.grey.shade300 : Colors.grey.shade200,
          width: 1.5,
        ),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: fieldSelected,
          isExpanded: true,
          hint: Row(
            children: [
              Text(textHint, style: TextStyle(color: Colors.grey.shade500)),
            ],
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: isEnabled ? Colors.grey.shade700 : Colors.grey.shade400,
          ),
          items: fields
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Row(
                    children: [
                      Text(item, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (isEnabled && onChanged != null) ? onChanged : null,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          menuMaxHeight: 300,
        ),
      ),
    );
  }
}
