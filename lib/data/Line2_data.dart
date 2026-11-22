import '../models/MetroLine.dart';
import '../models/station.dart';

final MetroLine line2 = MetroLine(
  id: 2,
  name: 'Line 2',
  directions: ['El Moneeb', 'Shubra El Kheima'],
  stations: List.generate(
    line2Stations.length,
    (index) => Station(
      id: 2000 + index + 1,
      name: line2Stations[index],
      lineId: 2,
    ),
  ),
);
const List<String> line2Stations = [
  'Shubra El-Kheima',
  'Kolleyet El-Zeraa',
  'El-Mazallat',
  'El-Khalafawi',
  'St. Teresa',
  'Rod El-Farag',
  'Masarra',
  'Al-Shohadaa',
  'Attaba',
  'Mohamed Naguib',
  'Sadat',
  'Opera',
  'Dokki',
  'El-Bohoth',
  'Cairo University',
  'Faisal',
  'Giza',
  'Omm El-Misryeen',
  'Sakiat Mekki',
  'El-Mounib',
];
