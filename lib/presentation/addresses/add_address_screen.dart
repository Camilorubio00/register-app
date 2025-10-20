import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/presentation/custom_widgets/custom_dropdown_widget.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_bloc.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_event.dart';
import 'package:register_app/presentation/user_registration/bloc/user_registration_state.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _streetAddressController = TextEditingController();

  @override
  void initState() {
    context.read<UserRegistrationBloc>().add(LoadCountries());
    super.initState();
  }

  @override
  void dispose() {
    _streetAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegistrationBloc, UserRegistrationState>(
      listener: (context, state) {
        if (state is AddressSaved) {
          context.pop();
        } else if (state is UserRegistrationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: RegisterAppBar(
            onBackTap: () {
              context.read<UserRegistrationBloc>().add(Cancel());
              context.pop();
            },
          ),
          backgroundColor: kBeigeBackground,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: kDimens45,
                left: kDimens30,
                right: kDimens30,
                top: kDimens20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _titleAddAddress(),
                  const SizedBox(height: kDimens20),
                  _dropdownCountries(state),
                  const SizedBox(height: kDimens16),
                  _dropdownDepartments(state),
                  const SizedBox(height: kDimens16),
                  _dropdownCities(state),
                  const SizedBox(height: kDimens20),
                  _textFieldAddAddress(),
                  const SizedBox(height: kDimens20),
                  Row(
                    children: [
                      _buttonCancel(),
                      const SizedBox(width: kDimens12),
                      _buttonSave(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dropdownCountries(UserRegistrationState state) {
    return CustomDropdownWidget(
      fields: state.countries,
      fieldSelected: state.selectedCountry,
      textHint: kSelectCountryText,
      onChanged: (value) {
        if (value != null) {
          context.read<UserRegistrationBloc>().add(
            ChangeCountry(country: value),
          );
        }
      },
    );
  }

  Widget _dropdownDepartments(UserRegistrationState state) {
    return CustomDropdownWidget(
      fields: state.departments,
      fieldSelected: state.selectedDepartment,
      textHint: kSelectStateText,
      onChanged: (value) {
        if (value != null) {
          context.read<UserRegistrationBloc>().add(
            ChangeDepartment(department: value),
          );
        }
      },
    );
  }

  Widget _dropdownCities(UserRegistrationState state) {
    return CustomDropdownWidget(
      fields: state.cities,
      fieldSelected: state.selectedCity,
      textHint: kSelectCityText,
      onChanged: (value) {
        if (value != null) {
          context.read<UserRegistrationBloc>().add(
            ChangeCity(city: value),
          );
        }
      },
    );
  }

  Widget _titleAddAddress() {
    return const Text(
      kAddNewAddressText,
      style: TextStyle(fontSize: kDimens20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _textFieldAddAddress() {
    return TextField(
      controller: _streetAddressController,
      onChanged: (value) => context.read<UserRegistrationBloc>().add(
        ChangeAddress(address: _streetAddressController.text),
      ),
      decoration: InputDecoration(
        labelText: kAddressText,
        hintText: kAddressExampleText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDimens12),
        ),
        prefixIcon: const Icon(Icons.home),
      ),
    );
  }

  Widget _buttonCancel() {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          context.read<UserRegistrationBloc>().add(Cancel());
          context.pop();
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: kDimens16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDimens12),
          ),
        ),
        child: const Text(kCancelText, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buttonSave() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () =>
            context.read<UserRegistrationBloc>().add(SaveAddress()),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: kDimens16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDimens12),
          ),
          backgroundColor: kRegisterAppColor,
        ),
        child: const Text(kSaveText, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
