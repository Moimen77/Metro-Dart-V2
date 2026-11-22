import 'station.dart';

class MetroLine {
  final int id;
  final String name;
  final int? parentLineId;
  final List<String> directions;
  final List<Station> stations;

  const MetroLine({
    required this.id,
    required this.name,
    this.parentLineId,
    required this.directions,
    required this.stations,
  });
}
