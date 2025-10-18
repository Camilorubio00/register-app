import 'package:flutter/material.dart';
import 'package:register_app/constants//design_constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  bool isLoading;
  bool isEnabled;
  bool isVisible;
  Color buttonTextColor;
  Color buttonColor;
  Color loadingColor;
  Color buttonDisabledColor;
  final VoidCallback? onTapButton;

  CustomButtonWidget(
      {super.key,
      required this.buttonText,
      this.buttonTextColor = kGreyTextButtonColor,
      this.buttonColor = kRegisterAppColor,
      this.loadingColor = Colors.white,
      this.buttonDisabledColor = kDisabledButtonColor,
      this.isLoading = false,
      this.isEnabled = true,
      this.isVisible = true,
      this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return _button(context: context);
  }
      
  Widget _button({required BuildContext context}) {
    if (!isVisible) return const SizedBox();
    return FractionallySizedBox(
      widthFactor: kPercentage065,
      child: ElevatedButton(
          onPressed: isEnabled && !isLoading ? onTapButton : null,
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(kDimens0),
              backgroundColor: WidgetStatePropertyAll(isEnabled && !isLoading ? buttonColor : buttonDisabledColor),
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: kDimens4)),
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kDimens100))))),
          child: Container(height: kDimens40, alignment: Alignment.center, child: _getButtonState(context: context))),
    );
  }

  Widget _getButtonState({required BuildContext context}) {
    if (isLoading) {
      return CircularProgressIndicator(color: loadingColor);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(margin: const EdgeInsets.symmetric(horizontal: kDimens6),child: Text(buttonText, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: buttonTextColor)))
        ],
      );
    }
  }
}