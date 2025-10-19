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

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
        builder: (context, state) {
          return _buildLayout(context);
        },
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: kDimens30,
      fontWeight: FontWeight.w700,
      color: _selectedDate == null ? Colors.grey : Colors.black,
    );

    final dateDisplay = _selectedDate != null
        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
        : kBirthdayText;

    return Scaffold(
      backgroundColor: kBeigeBackground,
      appBar: RegisterAppBar(
        showBackButton: true,
        onBackTap: () => context.pop(),
      ),
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
              kEnterBirthdayTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: kDimens20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                alignment: Alignment.center,
                height: kDimens40,
                child: Text(
                  dateDisplay,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            CustomButtonWidget(
              buttonText: kContinueTitle,
              isEnabled: _selectedDate != null,
              onTapButton: () => context.push(kAddressesScreen)
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2005),
      firstDate: DateTime(1900),
      lastDate: DateTime(2005),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      context.read<UserRegistrationBloc>().add(SaveBirthday(picked));
    }
  }
}
