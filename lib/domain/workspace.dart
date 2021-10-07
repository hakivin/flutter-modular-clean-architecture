class Workspace {
  String? workspaceName;
  String? workspaceID;
  String? token;
  List<ModuleType> modules;

  Workspace({
    this.workspaceName,
    this.workspaceID,
    this.token,
    this.modules = const [],
  });

  copy(Workspace workspace) {
    workspaceName = workspace.workspaceName;
    workspaceID = workspace.workspaceID;
    token = workspace.token;
    modules = workspace.modules;
  }
}

enum ModuleType {
  ticket,
  event,
  project,
  mock,
}
