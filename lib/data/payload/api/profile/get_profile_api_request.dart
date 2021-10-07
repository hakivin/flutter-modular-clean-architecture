import 'package:flutter_modular_app/data/payload/contracts/api_request_interface.dart';
import 'package:flutter_modular_app/data/payload/contracts/profile_request_interface.dart';

class GetProfileApiRequest
    implements GetProfileRequestInterface, ApiRequestInterface {
  @override
  Map<dynamic, dynamic> encode() {
    var req = <dynamic, dynamic>{};
    return req;
  }
}
