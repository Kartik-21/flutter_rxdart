import 'package:json_annotation/json_annotation.dart';
part 'Geo.g.dart';

@JsonSerializable()
class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;
}
