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

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {

  @override
  void initState() {
    context.read<UserRegistrationBloc>().add(FetchAddresses());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegistrationBloc, UserRegistrationState>(
      listener: (context, state) {
        if (state is UserRegistrationSuccess) {
          context.read<UserRegistrationBloc>().add(ResetAll());
          context.go(kWelcomeScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: RegisterAppBar(onBackTap: () => context.pop()),
          backgroundColor: kBeigeBackground,
          body: Container(
            padding: const EdgeInsets.only(
              bottom: kDimens45,
              left: kDimens20,
              right: kDimens20,
              top: kDimens20,
            ),
            child: Column(
              children: [
                _addAddressRow(),
                Expanded(
                  child: _addressList(context, state),
                ),
                const SizedBox(height: kDimens12),
                CustomButtonWidget(
                  buttonText: kSaveAddressesText,
                  isLoading: false,
                  isEnabled: true,
                  onTapButton: () {
                    context.read<UserRegistrationBloc>().add(SaveUser());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _addAddressRow() {
    return Row(
      children: [
        const Text(
          'Agregar Nueva Dirección',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: kRegisterAppColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.add, size: 24),
            color: Colors.white,
            onPressed: () {
              context.pushNamed('add').then((_) {
                context.read<UserRegistrationBloc>().add(FetchAddresses());
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _addressList(context, state) {
    if (state is AddressesLoaded) {
      final addresses = state.addresses;
      if (addresses.isEmpty) {
        return Center(
          child: Text(
            'No hay direcciones agregadas.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            final address = addresses[index];
            return ListTile(
              title: Text(address.description ?? ''),
              subtitle: Text('${address.description} ${address.description}'),
            );
          },
        );
      }
    } else {
        return Container();
    }
  }
}
