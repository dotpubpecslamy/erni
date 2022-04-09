import 'dart:convert';

import 'package:flutter_tech_exam/common/api_endpoints.dart';
import 'package:flutter_tech_exam/web/contracts/user_contract.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class UserService {
  Future<List<UserContract>> getUsers();
}

@LazySingleton(as: UserService)
class UserServiceImpl implements UserService {
  @override
  Future<List<UserContract>> getUsers() async {
    // TODO: Implement getUsers, use endpoints from `ApiEndpoints` class
    const String url = '${ApiEndpoints.baseUrl}/${ApiEndpoints.getUser}';

    final http.Response response = await http.get(Uri.parse(url));
    final List<dynamic> decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    final List<UserContract> userContractList =
        decodedResponse.map((dynamic user) => UserContract.fromJson(user as Map<String, dynamic>)).toList();

    return userContractList.toSet().toList();
    // return Future<List<UserContract>>.delayed(const Duration(seconds: 3), () async => []);
  }
}
