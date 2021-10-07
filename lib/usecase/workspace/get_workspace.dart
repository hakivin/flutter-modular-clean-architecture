import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular_app/data/payload/contracts/workspace_request_interface.dart';
import 'package:flutter_modular_app/data/persistences/repositories/workspace_repository.dart';
import 'package:flutter_modular_app/domain/workspace.dart';

class GetWorkspaceUseCase extends UseCase<Workspace, GetWorkspaceRequestInterface> {
  final WorkspaceRepository _repository;

  GetWorkspaceUseCase(this._repository);

  @override
  Future<Stream<Workspace?>> buildUseCaseStream(
      GetWorkspaceRequestInterface? params) async {
    final StreamController<Workspace> _controller = StreamController();
    try {
      Workspace workspace = await _repository.getWorkspace(params!);
      _controller.add(workspace);
      _controller.close();
    } catch (e) {
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
