class SettingsEntity {
  bool? isPushEnabled;
  String? state;
  String? license;

  SettingsEntity({this.isPushEnabled, this.state, this.license});

  factory SettingsEntity.fromRow({
    required bool? isPushEnabled,
    required String? state,
    required String? license,
  }) => SettingsEntity(
    isPushEnabled: isPushEnabled,
    state: state,
    license: license,
  );
}
