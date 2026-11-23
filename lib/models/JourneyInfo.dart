class JourneyInfo {
  final int stationsInRoute;
  final int stationsTravelled;
  final int connections;
  final int transfers;
  final int ticketPrice;
  final int estimatedMinutes;

  const JourneyInfo({
    required this.stationsInRoute,
    required this.stationsTravelled,
    required this.connections,
    required this.transfers,
    required this.ticketPrice,
    required this.estimatedMinutes,
  });
}
