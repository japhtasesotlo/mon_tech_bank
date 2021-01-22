import 'package:json_annotation/json_annotation.dart';
import 'package:mon_tech_bank/src/networking/data/entities/account.dart';

import 'account.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  List<Account> accounts;

  User({this.id, this.name, this.accounts});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
