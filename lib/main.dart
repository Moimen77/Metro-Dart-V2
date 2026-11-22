import 'grafh/metroGrafh.dart';

void main() {
  final graph = MetroGraph();

  graph.addConnection(1, 2);
  graph.addConnection(2, 3);
  graph.addConnection(3, 4);

  graph.addConnection(
    2,
    10,
    isTransfer: true,
  );

  for (final entry in graph.adjacencyList.entries) {
    print(
      '${entry.key} -> '
      '${entry.value.map((e) => '${e.destinationId}${e.isTransfer ? " (Transfer)" : ""}').toList()}',
    );
  }
}
