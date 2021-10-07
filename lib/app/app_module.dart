import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/app/common/infrastructure/persistence/api_service.dart';
import 'package:flutter_modular_app/app/home/home_module.dart';
import 'package:flutter_modular_app/app/profile/profile_module.dart';
import 'package:flutter_modular_app/domain/user.dart';
import 'package:flutter_modular_app/domain/workspace.dart';
import 'package:flutter_modular_app/usecase/profile/get_profile.dart';
import 'package:flutter_modular_app/usecase/workspace/get_workspace.dart';

import 'common/repositories/api/profile_api_repository.dart';
import 'common/repositories/api/workspace_api_repository.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) {
          var dio = Dio();
          var baseUrl = "https://google.com";
          dio.options.connectTimeout = 60000;
          dio.options.receiveTimeout = 60000;
          dio.options.baseUrl = baseUrl;
          dio.options.contentType = Headers.formUrlEncodedContentType;

          final uri = Uri.parse(baseUrl);
          dio.options.headers["host"] = uri.host;
          return dio;
        }),
        Bind.singleton((i) => ApiService(i())),
        Bind.singleton((i) => User()),
        Bind.singleton((i) => Workspace()),
        Bind.factory((i) => ProfileApiRepository()),
        Bind.factory((i) => GetProfileUseCase(i())),
        Bind.factory((i) => WorkspaceApiRepository()),
        Bind.factory((i) => GetWorkspaceUseCase(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/second/', module: ProfileModule()),
        ModuleRoute('/third/', module: ProfileModule(), guards: [AuthGuard(ModuleType.mock)]),
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular(); //added by extension
  }
}

class AuthGuard extends RouteGuard {
  final ModuleType authType;

  AuthGuard(this.authType) : super(redirectTo: '/asdasd');

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    Workspace workspace = Modular.get<Workspace>();
    return Future.value(filterGuard(workspace.modules, authType));
  }

  bool filterGuard(List<ModuleType> modules, ModuleType directedModule) {
    bool isFound = false;
    for (var module in modules) {
      if (module == directedModule) {
        isFound = true;
        break;
      }
    }
    return isFound;
  }
}
