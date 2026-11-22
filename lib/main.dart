import 'Functions/GeneralFunctions.dart';
import 'Functions/MetroTransfer.dart';
import 'data/AllLines.dart';
import 'grafh/metroGrafh.dart';

void main() {
  final graph = MetroGraph();
  AddAllLinesToGraph(graph);
  addMetroTransfers(graph, allLines);
  graph.adjacencyList.forEach((stationId, edges) {
    final station = graph.stations[stationId];
    if (station != null) {
      print(
          'Station: ${station.name} (ID: ${station.id}) Line: ${station.lineId})');
      for (final edge in edges) {
        final destinationStation = graph.stations[edge.destinationId];
        if (destinationStation != null) {
          print(
              '  Connected to: ${destinationStation.name} (ID: ${destinationStation.id}), Transfer: ${edge.isTransfer}');
        }
      }
    }
  });

  printTransfers(graph);
}
