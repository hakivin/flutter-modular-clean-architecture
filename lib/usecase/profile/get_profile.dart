import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular_app/data/payload/contracts/profile_request_interface.dart';
import 'package:flutter_modular_app/data/persistences/repositories/profile_repository.dart';
import 'package:flutter_modular_app/domain/user.dart';

class GetProfileUseCase extends UseCase<User, GetProfileRequestInterface> {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Stream<User?>> buildUseCaseStream(
      GetProfileRequestInterface? params) async {
    final StreamController<User> _controller = StreamController();
    try {
      User user = await _repository.getProfile(params!);
      _controller.add(user);
      _controller.close();
    } catch (e) {
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
