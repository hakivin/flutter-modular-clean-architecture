import 'package:flutter_modular_app/data/payload/contracts/profile_request_interface.dart';
import 'package:flutter_modular_app/domain/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile(GetProfileRequestInterface req);
}