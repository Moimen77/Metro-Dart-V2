import 'Functions/MetroTransfer.dart';
import 'Functions/PrintJourneySummary.dart';
import 'Functions/routeFormater.dart';
import 'algorithm/bfs.dart';
import 'data/AllLines.dart';
import 'grafh/metroGrafh.dart';
import 'models/JourneyInfo.dart';
import 'models/station.dart';
import 'services/JourneyCalculator.dart';

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
    final JourneyInfo journey = JourneyCalculator.calculate(route);
    PrintJourneySummary(journey);
  } else {
    print('No route found!');
  }
}
