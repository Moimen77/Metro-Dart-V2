import '../models/JourneyInfo.dart';

void PrintJourneySummary(JourneyInfo journey) {
  print('\n========== JOURNEY SUMMARY ==========');

  print('Stations: ${journey.stationsInRoute}');
  print('Connections: ${journey.connections}');
  print('Transfers: ${journey.transfers}');

  print('Ticket Price: ${journey.ticketPrice} EGP');

  print(
    'Estimated Time: ${journey.estimatedMinutes} minutes',
  );

  print('=====================================');
}
