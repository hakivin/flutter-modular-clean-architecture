import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/domain/workspace.dart';

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