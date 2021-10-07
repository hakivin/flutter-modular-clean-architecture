import 'package:flutter_modular_app/data/payload/contracts/workspace_request_interface.dart';
import 'package:flutter_modular_app/data/persistences/repositories/workspace_repository.dart';
import 'package:flutter_modular_app/domain/workspace.dart';

class WorkspaceApiRepository implements WorkspaceRepository {
  @override
  Future<Workspace> getWorkspace(
      GetWorkspaceRequestInterface requestInterface) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(
      Workspace(
        workspaceID: 'refactory',
        workspaceName: 'Refactory',
        modules: [
          ModuleType.project,
          ModuleType.ticket,
        ],
      ),
    );
  }
}
