class SettingsEntity {
  bool? isPushEnabled;
  String? state;
  String? license;
  bool isOnboardingComplete;

  SettingsEntity({
    this.isPushEnabled,
    this.state,
    this.license,
    this.isOnboardingComplete = false,
  });

  factory SettingsEntity.fromRow({
    required bool? isPushEnabled,
    required String? state,
    required String? license,
    required bool isOnboardingComplete,
  }) => SettingsEntity(
    isPushEnabled: isPushEnabled,
    state: state,
    license: license,
    isOnboardingComplete: isOnboardingComplete,
  );

  SettingsEntity copyWith({String? state, String? license}) => SettingsEntity(
    isPushEnabled: isPushEnabled,
    state: state ?? this.state,
    license: license ?? this.license,
    isOnboardingComplete: isOnboardingComplete,
  );
}
