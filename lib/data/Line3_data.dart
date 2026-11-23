import '../models/MetroLine.dart';
import '../models/station.dart';

final MetroLine line3 = MetroLine(
  id: 3,
  name: 'Line 3',
  directions: ['Adly Mansour', 'Rod El Farag Corridor'],
  stations: List.generate(
    line3Stations.length,
    (index) => Station(
      id: 3000 + index + 1,
      name: line3Stations[index],
      lineId: 3,
    ),
  ),
);

// فرع جامعة القاهرة (بيتفرع من Kit Kat)
final MetroLine line3CairoUniBranch = MetroLine(
  id: 4,
  parentLineId: 3,
  name: 'Line 3 - Cairo University Branch',
  directions: ['Kit Kat', 'Cairo University'],
  stations: List.generate(
    line3CairoUniBranchStations.length,
    (index) => Station(
      id: 3100 + index + 1,
      name: line3CairoUniBranchStations[index],
      lineId: 4,
    ),
  ),
);

// من عدلي منصور لحد Kit Kat، وبعدها فرع رود الفرج
const List<String> line3Stations = [
  'Adly Mansour',
  'El-Haykestep',
  'Omar Ibn El-Khattab',
  'Qobaa',
  'Hesham Barakat',
  'El-Nozha',
  'Nadi El-Shams',
  'Alf Maskan',
  'Heliopolis Square',
  'Haroun',
  'Al-Ahram',
  'Koleyet El-Banat',
  'Stadium',
  'Fair Zone',
  'Abbassia',
  'Abdou Pasha',
  'El-Geish',
  'Bab El-Shaaria',
  'Attaba',
  'Nasser',
  'Maspero',
  'Safaa Hegazy',
  'Kit Kat',
  // فرع رود الفرج
  'Sudan',
  'Imbaba',
  'El-Bohy',
  'El-Qawmia',
  'Ring Road',
  'Rod El-Farag Corridor',
];

// فرع جامعة القاهرة (بعد Kit Kat)
const List<String> line3CairoUniBranchStations = [
  'Kit Kat',
  'Tawfikia',
  'Wadi El-Nil',
  'Gamaat El-Dowal',
  'Boulak El-Dakrour',
  'Cairo University',
];
