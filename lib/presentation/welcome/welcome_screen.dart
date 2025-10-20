import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_app/constants/design_constants.dart';
import 'package:register_app/constants/strings_manager.dart';
import 'package:register_app/presentation/config/router/navigation_constants.dart';
import 'package:register_app/presentation/config/router/router.dart';
import 'package:register_app/presentation/custom_widgets/register_app_bar.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_event.dart';
import 'package:register_app/presentation/welcome/bloc/welcome_state.dart';
import 'package:register_app/presentation/welcome/model/user_ui_model.dart';

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
                Expanded(child: _userList(context, state)),
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
          kAddUserText,
          style: TextStyle(fontSize: kDimens20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Container(
          width: kDimens45,
          height: kDimens45,
          decoration: BoxDecoration(
            color: kRegisterAppColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.add, size: kDimens24),
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
            kEmptyUsersText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      } else {
        return ListView.separated(
          padding: const EdgeInsets.all(kDimens16),
          itemCount: state.users.length,
          separatorBuilder: (_, __) => const SizedBox(height: kDimens12),
          itemBuilder: (context, index) {
            final user = state.users[index];
            return _cardUser(user);
          },
        );
      }
    } else {
      return Container();
    }
  }

  Widget _cardUser(UserUiModel userUiModel) {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDimens6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDimens12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${userUiModel.name} ${userUiModel.lastname}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: kDimens4),
            Text('$kBirthdateText ${userUiModel.birthDate}'),

            if (userUiModel.addresses != null &&
                userUiModel.addresses!.isNotEmpty) ...[
              const SizedBox(height: kDimens12),
              Text(
                kAddressesText,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kDimens4),
              ...userUiModel.addresses!.map(
                (addr) => Padding(
                  padding: const EdgeInsets.only(bottom: kDimens4),
                  child: Text(
                    '${addr.country}, ${addr.state}, ${addr.city}, ${addr.description}',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
