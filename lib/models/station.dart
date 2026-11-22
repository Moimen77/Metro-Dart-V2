class Station {
  final int id;
  final String name;
  final int lineId;

  const Station({
    required this.id,
    required this.name,
    required this.lineId,
  });

  @override
  String toString() => '$name (Line $lineId)';
}
