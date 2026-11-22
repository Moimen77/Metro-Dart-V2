import 'MetroLine.dart';

class Station {
  final int id;
  final String name;
  final int lineId;

  const Station({
    required this.id,
    required this.name,
    required this.lineId,
  });

  @override
  String toString() => '$name (Line $lineId)';
}

Station? findStation(
  List<MetroLine> lines,
  int lineId,
  String stationName,
) {
  for (final line in lines) {
    if (line.id != lineId) continue;

    for (final station in line.stations) {
      if (station.name == stationName) {
        return station;
      }
    }
  }

  return null;
}
