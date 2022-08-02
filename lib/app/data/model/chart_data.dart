class ChartData {
  ChartData({
    required this.date,
    required this.nominal,
  });

  final DateTime date;
  final int nominal;

  ChartData copyWith({
    DateTime? date,
    int? nominal,
  }) {
    return ChartData(
      date: date ?? this.date,
      nominal: nominal ?? this.nominal,
    );
  }

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      date: DateTime.parse(json["date"] ?? ""),
      nominal: json["nominal"] ?? 0,
    );
  }

  @override
  String toString() {
    return '$date, $nominal';
  }

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "nominal": nominal,
      };
}
