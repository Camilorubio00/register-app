import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/presentation/addresses/bloc/addresses_bloc.dart';
import 'package:register_app/presentation/addresses/bloc/addresses_event.dart';
import 'package:register_app/presentation/addresses/bloc/addresses_state.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _streetAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _streetAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesBloc, AddressesState>(
      listener: (context, state) {
        if (state is AddressSavedTemporary) {
          context.pop();
        } else if (state is AddressesError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: RegisterAppBar(onBackTap: () => context.pop()),
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
                  const SizedBox(height: 24),
                  // País (fijo por ahora)
                  /*_buildDropdown(
                        label: 'País',
                        value: state.selectedCountry,
                        items: state.countries,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<AddressBloc>().add(SelectCountry(value));
                          }
                        },
                        hint: 'Selecciona un país',
                      ),*/
                  Text("Pais"),
                  const SizedBox(height: 16),
                  Text("Departamento"),
                  // Departamento
                  /*_buildDropdown(
                        label: 'Departamento',
                        value: state.selectedDepartment,
                        items: state.departments,
                        onChanged: state.selectedCountry == null
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<AddressBloc>()
                                      .add(SelectDepartment(value));
                                }
                              },
                        hint: 'Selecciona un departamento',
                      ),*/
                  const SizedBox(height: 16),
                  Text("Municipio"),
                  // Municipio
                  /*_buildDropdown(
                        label: 'Municipio',
                        value: state.selectedMunicipality,
                        items: state.municipalities,
                        onChanged: state.selectedDepartment == null
                            ? null
                            : (value) {
                                if (value != null) {
                                  context
                                      .read<AddressBloc>()
                                      .add(SelectMunicipality(value));
                                }
                              },
                        hint: 'Selecciona un municipio',
                      ),*/
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
      onChanged: (value) => {
        BlocProvider.of<AddressesBloc>(context).add(
          ChangeAddress(
            address: _streetAddressController.text
          ),
        )
      },
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
        onPressed: () => context.pop(),
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
        onPressed: () {
          BlocProvider.of<AddressesBloc>(context).add(AddTemporaryAddress());
        },
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
