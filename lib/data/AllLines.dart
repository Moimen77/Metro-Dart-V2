import '../grafh/metroGrafh.dart';
import '../models/MetroLine.dart';
import 'Line1_data.dart';
import 'Line2_data.dart';
import 'Line3_data.dart';

final List<MetroLine> allLines = [line1, line2, line3, line3CairoUniBranch];

void AddAllLinesToGraph(MetroGraph graph) {
  for (final line in allLines) {
    graph.addLine(line);
  }
}
