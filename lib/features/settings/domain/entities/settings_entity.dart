class SettingsEntity {
  bool? isPushNotificationsEnabled;
  String? state;
  String? licenseType;

  SettingsEntity({
    this.isPushNotificationsEnabled,
    this.state,
    this.licenseType,
  });

  factory SettingsEntity.fromJson(Map<String, dynamic> json) => SettingsEntity(
    isPushNotificationsEnabled: json['is_push_notifications_enabled'],
    state: json['state'],
    licenseType: json['license_type'],
  );

  Map<String, dynamic> toJson() => {
    'is_push_notifications_enabled': isPushNotificationsEnabled,
    'state': state,
    'license_type': licenseType,
  };

  SettingsEntity copyWith({
    bool? isPushNotificationsEnabled,
    String? state,
    String? licenseType,
  }) => SettingsEntity(
    isPushNotificationsEnabled:
        isPushNotificationsEnabled ?? this.isPushNotificationsEnabled,
    state: state ?? this.state,
    licenseType: licenseType ?? this.licenseType,
  );
}
