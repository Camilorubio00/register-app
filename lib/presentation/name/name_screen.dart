import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constans/design_constants.dart';
import 'package:register_app/constans/strings_manager.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/custom_widgets/custom_button_widget.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/name/bloc/name_bloc.dart';
import 'package:register_app/presentation/name/bloc/name_event.dart';
import 'package:register_app/presentation/name/bloc/name_state.dart';

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
      body: BlocConsumer<NameBloc, NameState>(
        listener: (context, state) {
          if (state is NameSaved) {
            context.push(kLastnameScreen);
          }
        },
        builder: (context, state) {
          return _buildForm(context, state);
        }
      )
    );
  }

  Widget _buildForm(BuildContext context, NameState state) {
    return Scaffold(
      backgroundColor: kBeigeBackground,
      appBar: RegisterAppBar(showBackButton: false),
      body: Container(
        padding: const EdgeInsets.only(bottom: kDimens45, left: kDimens30, right: kDimens30, top: kDimens30),
        child: Column(
          children: [
            Text(kEnterNameTitle, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
            const SizedBox(height: kDimens20),
            TextFormField(
              autofocus: true,
              controller: _nameController,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: kDimens40, fontWeight: FontWeight.w700),
              keyboardType: TextInputType.name,
              maxLength: 30,
              onChanged: (value) {
                BlocProvider.of<NameBloc>(context).add(
                    ChangeName(_nameController.text),
                );
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: kYourNameText, hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: kDimens40, color: kGreyHintTextColor, fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            CustomButtonWidget(
              buttonText: kContinueTitle,
              isLoading: state is NameLoading,
              isEnabled: _nameController.text.isNotEmpty,
              onTapButton: () {
                BlocProvider.of<NameBloc>(context).add(
                    SaveName(_nameController.text),
                );
              },
            )
          ],
        ),
      )
    );
  }
}