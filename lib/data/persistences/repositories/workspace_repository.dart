import 'package:flutter_modular_app/data/payload/contracts/workspace_request_interface.dart';
import 'package:flutter_modular_app/domain/workspace.dart';

abstract class WorkspaceRepository {
  Future<Workspace> getWorkspace(GetWorkspaceRequestInterface requestInterface);
}