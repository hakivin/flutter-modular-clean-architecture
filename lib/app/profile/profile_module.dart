import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/app/common/infrastructure/persistence/api_service.dart';
import 'package:flutter_modular_app/app/profile/ui/profile/profile_controller.dart';
import 'package:flutter_modular_app/app/profile/ui/profile/profile_page.dart';
import 'package:flutter_modular_app/app/profile/ui/profile/profile_presenter.dart';
import 'package:flutter_modular_app/data/infrastructure/api_service_interface.dart';
import 'package:flutter_modular_app/domain/user.dart';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [
        Bind.factory((i) => ProfilePresenter(i())),
        Bind.factory((i) => ProfileController(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute(
          '/',
          child: (context, args) {
            return ProfilePage(arguments: args.data);
          },
        ),
        ChildRoute(
          '/third/',
          child: (context, args) => ProfilePage(),
        ),
      ];
}
