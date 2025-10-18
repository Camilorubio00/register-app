import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/custom_widgets/custom_button_widget.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_bloc.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_event.dart';
import 'package:register_app/presentation/lastname/bloc/lastname_state.dart';

class LastnameScreen extends StatefulWidget {
  const LastnameScreen({super.key});

  @override
  State<LastnameScreen> createState() => _LastnameScreenState();
}

class _LastnameScreenState extends State<LastnameScreen> {

  final _lastnameController = TextEditingController();

  @override
  void dispose() {
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LastnameBloc, LastnameState>(
        listener: (context, state) {
          if (state is LastnameSaved) {
            context.push(kBirthdayScreen);
          }
        },
        builder: (context, state) {
          return _buildForm(context, state);
        }
      )
    );
  }

  Widget _buildForm(BuildContext context, LastnameState state) {
    return Scaffold(
      backgroundColor: kBeigeBackground,
      appBar: RegisterAppBar(showBackButton: false),
      body: Container(
        padding: const EdgeInsets.only(bottom: kDimens45, left: kDimens30, right: kDimens30, top: kDimens30),
        child: Column(
          children: [
            Text(kEnterLastnameTitle, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
            const SizedBox(height: kDimens20),
            TextFormField(
              autofocus: true,
              controller: _lastnameController,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: kDimens40, fontWeight: FontWeight.w700),
              keyboardType: TextInputType.name,
              maxLength: 30,
              onChanged: (value) {
                BlocProvider.of<LastnameBloc>(context).add(
                    ChangeLastname(_lastnameController.text),
                );
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: kYourLastnameText, hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: kDimens40, color: kGreyHintTextColor, fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            CustomButtonWidget(
              buttonText: kContinueTitle,
              isLoading: state is LastnameLoading,
              isEnabled: _lastnameController.text.isNotEmpty,
              onTapButton: () {
                BlocProvider.of<LastnameBloc>(context).add(
                    SaveLastname(_lastnameController.text),
                );
              },
            )
          ],
        ),
      )
    );
  }
}