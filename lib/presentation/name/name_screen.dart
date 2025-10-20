import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/custom_widgets/custom_button_widget.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_bloc.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_event.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_state.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
        builder: (context, state) {
          return _buildForm(context, state);
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, UserRegistrationState state) {
    return Scaffold(
      backgroundColor: kBeigeBackground,
      appBar: RegisterAppBar(showBackButton: false),
      body: Container(
        padding: const EdgeInsets.only(
          bottom: kDimens45,
          left: kDimens30,
          right: kDimens30,
          top: kDimens30,
        ),
        child: Column(
          children: [
            Text(
              kEnterNameTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: kDimens20),
            _textFieldName(),
            const Spacer(),
            CustomButtonWidget(
              buttonText: kContinueTitle,
              isLoading: state is UserRegistrationLoading,
              isEnabled: _nameController.text.isNotEmpty,
              onTapButton: () {
                context.push(kLastnameScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return TextFormField(
      autofocus: true,
      controller: _nameController,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: kDimens40,
        fontWeight: FontWeight.w700,
      ),
      keyboardType: TextInputType.name,
      maxLength: 30,
      onChanged: (value) {
        context.read<UserRegistrationBloc>().add(
          SaveName(_nameController.text),
        );
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: kYourNameText,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: kDimens40,
          color: kGreyHintTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
