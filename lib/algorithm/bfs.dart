import 'dart:collection';

import '../grafh/metroGrafh.dart';
import '../models/station.dart';

List<Station>? bfs(
  MetroGraph graph,
  int startId,
  int destinationId,
) {
  // التأكد إن المحطتين موجودتين
  if (!graph.stations.containsKey(startId) ||
      !graph.stations.containsKey(destinationId)) {
    return null;
  }

  // لو محطة البداية هي نفسها الوجهة
  if (startId == destinationId) {
    return [graph.stations[startId]!];
  }

  final Queue<int> queue = Queue<int>();

  // كل محطة وصلنا لها، نسجل وصلنا لها منين
  final Map<int, int?> parent = {};

  queue.add(startId);
  parent[startId] = null;

  while (queue.isNotEmpty) {
    final currentId = queue.removeFirst();

    // البحث في المحطات المجاورة
    for (final edge in graph.getNeighbors(currentId)) {
      final neighborId = edge.destinationId;

      // لو المحطة اتزارت قبل كده نتخطاها
      if (parent.containsKey(neighborId)) {
        continue;
      }

      // نسجل المحطة اللي وصلنا منها
      parent[neighborId] = currentId;

      // لو وصلنا للوجهة
      if (neighborId == destinationId) {
        return reconstructPath(
          graph,
          parent,
          destinationId,
        );
      }

      queue.add(neighborId);
    }
  }

  // مفيش مسار بين المحطتين
  return null;
}

List<Station> reconstructPath(
  MetroGraph graph,
  Map<int, int?> parent,
  int destinationId,
) {
  final List<Station> path = [];

  int? currentId = destinationId;

  while (currentId != null) {
    path.add(graph.stations[currentId]!);
    currentId = parent[currentId];
  }

  // عكس المسار عشان يبدأ من محطة البداية
  return path.reversed.toList();
}
