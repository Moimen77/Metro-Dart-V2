class Edge {
  final int destinationId;
  final bool isTransfer;

  const Edge({
    required this.destinationId,
    this.isTransfer = false,
  });
}
