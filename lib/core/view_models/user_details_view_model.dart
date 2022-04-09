import 'package:flutter/cupertino.dart';
import 'package:flutter_tech_exam/core/view_models/base/view_model.dart';
import 'package:flutter_tech_exam/domain/entities/user_entity.dart';
import 'package:flutter_tech_exam/web/contracts/user_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDetailsViewModel extends ViewModel<UserEntity> {
  final ValueNotifier<UserEntity?> user = ValueNotifier(null);

  @override
  Future<void> onInitialize([UserEntity? parameter]) {
    user.value = parameter;
    // TODO: implement onInitialize
    return super.onInitialize(parameter);
  }
}
