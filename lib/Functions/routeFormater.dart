import '../models/MetroLine.dart';
import '../models/station.dart';

void printFormattedRoute(
  List<Station> route,
  List<MetroLine> lines,
) {
  if (route.isEmpty) {
    print('No route found!');
    return;
  }

  // تقسيم المسار إلى أجزاء حسب الخط
  final List<List<Station>> segments = [];

  for (final station in route) {
    if (segments.isEmpty || segments.last.last.lineId != station.lineId) {
      segments.add([station]);
    } else {
      segments.last.add(station);
    }
  }

  print('\n========== YOUR JOURNEY ==========');
  print('Stations: ${route.length}');
  print('Connections: ${route.length - 1}');
  print('Transfers: ${segments.length - 1}');
  print('==================================');

  for (int i = 0; i < segments.length; i++) {
    final segment = segments[i];

    final line = lines.firstWhere(
      (line) => line.id == segment.first.lineId,
    );

    final direction = getDirection(
      line,
      segment.first,
      segment.last,
    );

    print('\n${i + 1}. ${line.name}');
    print('   Direction: $direction');

    for (int j = 0; j < segment.length; j++) {
      print('   ${j + 1}. ${segment[j].name}');
    }

    // عرض التحويل بين الخطوط
    if (i < segments.length - 1) {
      final nextLine = lines.firstWhere(
        (line) => line.id == segments[i + 1].first.lineId,
      );

      print('\n   >>> TRANSFER at ${segment.last.name}');
      print('   From ${line.name} to ${nextLine.name}');
    }
  }

  print('\n========== END OF JOURNEY ==========');
}

String getDirection(
  MetroLine line,
  Station start,
  Station destination,
) {
  final startIndex = line.stations.indexWhere(
    (station) => station.id == start.id,
  );

  final destinationIndex = line.stations.indexWhere(
    (station) => station.id == destination.id,
  );

  if (startIndex == -1 || destinationIndex == -1) {
    return 'Unknown direction';
  }

  if (startIndex < destinationIndex) {
    return line.directions[1];
  }

  if (startIndex > destinationIndex) {
    return line.directions[0];
  }

  return 'Same station';
}
