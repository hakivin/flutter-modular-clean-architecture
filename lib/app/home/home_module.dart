import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/app/home/ui/home/home_controller.dart';
import 'package:flutter_modular_app/app/home/ui/home/home_page.dart';
import 'package:flutter_modular_app/app/home/ui/home/home_presenter.dart';
import 'package:flutter_modular_app/app/profile/profile_module.dart';
import 'package:flutter_modular_app/domain/user.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => HomePresenter(i())),
    Bind.factory((i) => HomeController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(),
        ),
      ];
}
