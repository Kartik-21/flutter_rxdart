import 'package:flutter_rxdart/models/Geo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Address.g.dart';

@JsonSerializable()
class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory
}
