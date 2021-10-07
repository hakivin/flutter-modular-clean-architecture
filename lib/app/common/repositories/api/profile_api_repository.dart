import 'package:flutter_modular_app/data/payload/contracts/profile_request_interface.dart';
import 'package:flutter_modular_app/data/persistences/repositories/profile_repository.dart';
import 'package:flutter_modular_app/domain/user.dart';

class ProfileApiRepository implements ProfileRepository {
  @override
  Future<User> getProfile(GetProfileRequestInterface req) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(User(isLoggedIn: true, name: "Hakikid Amana"));
  }
}
