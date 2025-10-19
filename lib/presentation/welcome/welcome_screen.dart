import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/config/router/router.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_event.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with RouteAware {

  @override
  void initState() {
    context.read<WelcomeBloc>().add(FetchUsers());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<WelcomeBloc>().add(FetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: RegisterAppBar(showBackButton: false),
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
                _addUserRow(),
                Expanded(
                  child: _userList(context, state),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _addUserRow() {
    return Row(
      children: [
        const Text(
          'Agregar un usuario',
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
              context.push(kNameScreen).then((_) {
                context.read<WelcomeBloc>().add(FetchUsers());
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _userList(context, state) {
    if (state is UsersLoaded) {
      if (state.users.isEmpty) {
        return Center(
          child: Text(
            'No hay usuarios agregados.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            final user = state.users[index];
            return ListTile(
              title: Text(user.name ?? ''),
              subtitle: Text('${user.lastname} ${user.birthDate}'),
            );
          },
        );
      }
    } else {
      return Container();
    }
  }
}