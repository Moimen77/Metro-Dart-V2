import '../models/edge.dart';

class MetroGraph {
  final Map<int, List<Edge>> adjacencyList = {};

  // Add Node
  void addStation(int stationId) {
    adjacencyList.putIfAbsent(stationId, () => []);
  }

  // Add Connection
  void addConnection(
    int station1,
    int station2, {
    bool isTransfer = false,
  }) {
    addStation(station1);
    addStation(station2);

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

  // Get Neighbors
  List<Edge> getNeighbors(int stationId) {
    return adjacencyList[stationId] ?? [];
  }
}
