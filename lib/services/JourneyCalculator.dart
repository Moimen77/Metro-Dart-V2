import '../models/JourneyInfo.dart';
import '../models/station.dart';

class JourneyCalculator {
  // Configurable assumptions
  static const int minutesPerStation = 2;
  static const int minutesPerTransfer = 5;

  static JourneyInfo calculate(List<Station> route) {
    if (route.isEmpty) {
      throw ArgumentError('Route cannot be empty');
    }

    final int stationsInRoute = route.length;
    final int connections = stationsInRoute - 1;

    // عدد التحويلات بين المسارات
    int transfers = 0;

    for (int i = 1; i < route.length; i++) {
      if (route[i].lineId != route[i - 1].lineId) {
        transfers++;
      }
    }

    // عدد المحطات التي انتقلنا إليها
    final int stationsTravelled = connections;

    // حساب سعر التذكرة
    final int ticketPrice = calculateTicketPrice(
      stationsTravelled,
    );

    // حساب الوقت المتوقع
    final int estimatedMinutes =
        (connections * minutesPerStation) + (transfers * minutesPerTransfer);

    return JourneyInfo(
      stationsInRoute: stationsInRoute,
      stationsTravelled: stationsTravelled,
      connections: connections,
      transfers: transfers,
      ticketPrice: ticketPrice,
      estimatedMinutes: estimatedMinutes,
    );
  }

  static int calculateTicketPrice(int stations) {
    if (stations <= 9) return 10;
    if (stations <= 16) return 12;
    if (stations <= 23) return 15;
    return 20;
  }
}
