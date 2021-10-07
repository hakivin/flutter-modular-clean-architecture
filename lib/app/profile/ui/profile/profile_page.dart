import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/app/profile/ui/profile/profile_controller.dart';
import 'package:flutter_modular_app/domain/user.dart';

class ProfilePage extends View {
  final User? arguments;

  ProfilePage({Key? key, this.arguments}) : super(key: key);

  @override
  _ProfileState createState() {
    return _ProfileState(Modular.get(), arguments);
  }
}

class _ProfileState extends ViewState<ProfilePage, ProfileController> {
  final ProfileController _controller;

  _ProfileState(this._controller, User? args) : super(_controller) {
    _controller.args = args;
  }

  @override
  Widget get view => ControlledWidgetBuilder<ProfileController>(
        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(title: const Text('Profile Page')),
            body: Center(
              child: _controller.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('This is Profile Page'),
                        const SizedBox(height: 20),
                        MaterialButton(
                          child: const Text('Go Forward'),
                          padding: const EdgeInsets.all(20),
                          color: Colors.red,
                          onPressed: () {
                            Modular.to.pushNamed('/third/');
                          },
                        ),
                      ],
                    ),
            ),
          );
        },
      );
}
