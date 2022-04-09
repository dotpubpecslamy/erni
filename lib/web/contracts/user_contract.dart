import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_contract.g.dart';

@JsonSerializable()
class UserContract extends Equatable {
  const UserContract(this.id, this.name, this.imageUrl);

  final String id;
  final String name;
  final String imageUrl;

  factory UserContract.fromJson(Map<String, dynamic> json) => _$UserContractFromJson(json);

  Map<String, dynamic> toJson() => _$UserContractToJson(this);

  @override
  List<Object?> get props => [id, name, imageUrl];
}
