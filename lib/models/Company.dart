import 'package:json_annotation/json_annotation.dart';

part 'Company.g.dart';

@JsonSerializable()
class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String name;
  String catchPhrase;
  String bs;
}
