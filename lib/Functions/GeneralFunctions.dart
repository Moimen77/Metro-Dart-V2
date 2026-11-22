import '../grafh/metroGrafh.dart';

void printTransfers(MetroGraph graph) {
  for (final entry in graph.adjacencyList.entries) {
    final station = graph.stations[entry.key]!;

    for (final edge in entry.value) {
      if (edge.isTransfer) {
        final destination = graph.stations[edge.destinationId]!;

        print(
          '${station.name} (Line ${station.lineId}) '
          '<-> '
          '${destination.name} (Line ${destination.lineId})',
        );
      }
    }
  }
}
