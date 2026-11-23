import 'Functions/MetroTransfer.dart';
import 'Functions/routeFormater.dart';
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

  if (route != null) {
    printFormattedRoute(route, allLines);
  } else {
    print('No route found!');
  }
}
