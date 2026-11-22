import '../models/MetroLine.dart';
import '../models/edge.dart';
import '../models/station.dart';

class MetroGraph {
  final Map<int, List<Edge>> adjacencyList = {};

  final Map<int, Station> stations = {};

  // Add Node
  void addStation(Station station) {
    stations[station.id] = station;

    adjacencyList.putIfAbsent(station.id, () => []);
  }

  // Add Connection
  void addConnection(
    int station1,
    int station2, {
    bool isTransfer = false,
  }) {
    adjacencyList[station1]!.add(
      Edge(
        destinationId: station2,
        isTransfer: isTransfer,
      ),
    );

    adjacencyList[station2]!.add(
      Edge(
        destinationId: station1,
        isTransfer: isTransfer,
      ),
    );
  }

  // Build Line
  void addLine(MetroLine line) {
    // Add all stations
    for (final station in line.stations) {
      addStation(station);
    }

    // Connect consecutive stations
    for (int i = 0; i < line.stations.length - 1; i++) {
      final currentStation = line.stations[i];
      final nextStation = line.stations[i + 1];

      addConnection(
        currentStation.id,
        nextStation.id,
      );
    }
  }

  // Get Neighbors
  List<Edge> getNeighbors(int stationId) {
    return adjacencyList[stationId] ?? [];
  }
}
