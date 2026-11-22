import 'data/AllLines.dart';
import 'grafh/metroGrafh.dart';

void main() {
  final graph = MetroGraph();
  AddAllLinesToGraph(graph);

  // Print Graph
  for (final entry in graph.adjacencyList.entries) {
    final station = graph.stations[entry.key]!;

    final neighbors = entry.value.map((edge) {
      final neighbor = graph.stations[edge.destinationId]!;

      return neighbor.name;
    }).toList();

    print('${station.name} -> $neighbors');
  }
}
