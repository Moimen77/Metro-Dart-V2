import '../grafh/metroGrafh.dart';
import '../models/MetroLine.dart';
import '../models/station.dart';

void addMetroTransfers(
  MetroGraph graph,
  List<MetroLine> lines,
) {
  // Sadat: Line 1 <-> Line 2
  connectStations(
    graph,
    lines,
    line1Id: 1,
    station1Name: 'Sadat',
    line2Id: 2,
    station2Name: 'Sadat',
  );

  // Shohadaa: Line 1 <-> Line 2
  connectStations(
    graph,
    lines,
    line1Id: 1,
    station1Name: 'Al-Shohadaa',
    line2Id: 2,
    station2Name: 'Al-Shohadaa',
  );

  // Ataba: Line 2 <-> Line 3
  connectStations(
    graph,
    lines,
    line1Id: 2,
    station1Name: 'Attaba',
    line2Id: 3,
    station2Name: 'Attaba',
  );
  connectStations(
    graph,
    lines,
    line1Id: 3,
    station1Name: 'Kit Kat',
    line2Id: 4,
    station2Name: 'Kit Kat',
  );
  connectStations(
    graph,
    lines,
    line1Id: 2,
    station1Name: 'Cairo University',
    line2Id: 4,
    station2Name: 'Cairo University',
  );
}

void connectStations(
  MetroGraph graph,
  List<MetroLine> lines, {
  required int line1Id,
  required String station1Name,
  required int line2Id,
  required String station2Name,
}) {
  final station1 = findStation(
    lines,
    line1Id,
    station1Name,
  );

  final station2 = findStation(
    lines,
    line2Id,
    station2Name,
  );

  if (station1 == null || station2 == null) {
    throw Exception(
      'Transfer station not found: '
      '$station1Name / $station2Name',
    );
  }

  graph.addConnection(
    station1.id,
    station2.id,
    isTransfer: true,
  );
}
