import 'Functions/MetroTransfer.dart';
import 'algorithm/bfs.dart';
import 'data/AllLines.dart';
import 'grafh/metroGrafh.dart';
import 'models/station.dart';

void main() {
  final graph = MetroGraph();
  AddAllLinesToGraph(graph);
  addMetroTransfers(graph, allLines);
  final route = bfs(
    graph,
    findStation(allLines, 4, 'Tawfikia')!.id,
    findStation(allLines, 3, 'El-Geish')!.id,
  );

  if (route == null) {
    print('No route found!');
  } else {
    print('Route:');

    for (int i = 0; i < route.length; i++) {
      print('${i + 1}. ${route[i]}');
    }

    print('Connections: ${route.length - 1}');
  }
}
