class DeviceStatus {
  int? isOnline;
  String? lastOnline;
  String? limitter;
  String? now;

  DeviceStatus({this.isOnline, this.lastOnline, this.limitter, this.now});

  DeviceStatus.fromJson(Map<String, dynamic> json) {
    isOnline = json['is_online'];
    lastOnline = json['last_online'];
    limitter = json['limitter'];
    now = json['now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_online'] = isOnline;
    data['last_online'] = lastOnline;
    data['limitter'] = limitter;
    data['now'] = now;
    return data;
  }
}
