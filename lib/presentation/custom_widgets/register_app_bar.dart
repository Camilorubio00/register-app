import 'package:flutter/material.dart';
import 'package:register_app/constants/design_constants.dart';

class RegisterAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback? onBackTap;
  final bool showBackButton;

  const RegisterAppBar({super.key, this.onBackTap, this.showBackButton = true})
    : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      title: Text("App de Registro"),
      elevation: kDimens0,
      backgroundColor: kBeigeBackground,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      leadingWidth: MediaQuery.of(context).size.width * 0.29,
      leading: _getBackButton(context: context),
    );
  }

  Widget _getBackButton({required BuildContext context}) {
    return showBackButton == true
        ? ElevatedButton.icon(
            onPressed: onBackTap,
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            label: Text(
              "",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(
              elevation: kDimens0,
              backgroundColor: Colors.transparent,
            ),
          )
        : const SizedBox();
  }
}
