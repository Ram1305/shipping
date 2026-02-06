class LogModel {
  final String id;
  final DateTime timestamp;
  final String message;
  final String type;

  LogModel({
    required this.id,
    required this.timestamp,
    required this.message,
    required this.type,
  });

  String get formattedTime {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  static List<LogModel> getDummyLogs() {
    final now = DateTime.now();
    final logMessages = [
      'New shipment registered from Mumbai to New York',
      'Customs clearance completed for shipment #12345',
      'Container loaded at port',
      'Air freight booking confirmed',
      'Road transport vehicle dispatched',
      'Warehouse inventory updated',
      'Courier package delivered',
      'Shipping documents processed',
      'Cargo inspection completed',
      'Export license approved',
      'Import declaration filed',
      'Container tracking updated',
      'Delivery scheduled for tomorrow',
      'Payment received for shipment',
      'Insurance claim processed',
      'New company registered',
      'User enquiry received',
      'Quote generated for customer',
      'Route optimization completed',
      'Fuel surcharge updated',
      'Port fees calculated',
      'Customs duty assessed',
      'Shipping label printed',
      'Package picked up',
      'In transit to destination',
      'Arrived at sorting facility',
      'Out for delivery',
      'Delivery attempted',
      'Successfully delivered',
      'Customer feedback received',
      'Shipment delayed due to weather',
      'Alternative route selected',
      'Customs hold released',
      'Documentation verified',
      'Container unloaded',
    ];

    return List.generate(35, (index) {
      return LogModel(
        id: 'log_${index + 1}',
        timestamp: now.subtract(Duration(hours: index, minutes: index * 5)),
        message: logMessages[index % logMessages.length],
        type: ['info', 'success', 'warning', 'error'][index % 4],
      );
    });
  }
}
