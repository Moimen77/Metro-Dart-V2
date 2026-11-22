import 'station.dart';

class MetroLine {
  final int id;
  final String name;
  final List<String> directions;
  final List<Station> stations;

  const MetroLine({
    required this.id,
    required this.name,
    required this.directions,
    required this.stations,
  });
}
