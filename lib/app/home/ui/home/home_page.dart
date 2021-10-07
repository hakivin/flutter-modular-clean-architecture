import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/domain/user.dart';

import 'home_controller.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState(Modular.get());
  }
}

class _HomeState extends ViewState<HomePage, HomeController> {
  final HomeController _controller;

  _HomeState(this._controller) : super(_controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('This is home page'),
            const SizedBox(height: 20),
            MaterialButton(
              child: const Text('Go To Profile'),
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              onPressed: () {
                Modular.to
                    .pushNamed('/second/', arguments: User(isLoggedIn: true));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement view
  Widget get view => throw UnimplementedError();
}
