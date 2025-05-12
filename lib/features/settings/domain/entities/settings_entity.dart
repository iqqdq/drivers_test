class SettingsEntity {
  bool? isPushNotificationsEnabled;
  String? state;
  String? license;

  SettingsEntity({this.isPushNotificationsEnabled, this.state, this.license});

  factory SettingsEntity.fromJson(Map<String, dynamic> json) => SettingsEntity(
    isPushNotificationsEnabled: json['is_push_notifications_enabled'],
    state: json['state'],
    license: json['license'],
  );

  Map<String, dynamic> toJson() => {
    'is_push_notifications_enabled': isPushNotificationsEnabled,
    'state': state,
    'license': license,
  };

  SettingsEntity copyWith({
    bool? isPushNotificationsEnabled,
    String? state,
    String? license,
  }) => SettingsEntity(
    isPushNotificationsEnabled:
        isPushNotificationsEnabled ?? this.isPushNotificationsEnabled,
    state: state ?? this.state,
    license: license ?? this.license,
  );
}
