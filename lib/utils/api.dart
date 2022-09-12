const String mainUrl = 'https://ems.service.lectro.id';

/// Auth
const String registerUrl = '/v1/auth/signup';
const String loginUrl = '/v1/auth/signin';
const String apiFCMToken = '';
const String apiRefreshToken = '/v1/auth/refresh-token';
const String loginGoogle = '/v1/auth/signin-oauth';
const String signUpSocmed = '/v1/auth/signup-oauth';
const String signInSocmed = '/v1/auth/signin-oauth';
const String verifyEmail = '/v1/auth/verify-email';
const String resendVerifEmail = '/v1/auth/resend-verification-email';

// Profil
const String profilUrl = '/v1/user/profile';
const String updateProfile = '/v1/user/update-profile';

// Sensor Priority Load
const String lastPriorityData = '/v1/sensor-priority-load/view-last-record';
const String viewSettingPriority = '/v1/sensor-priority-load/setting-view';
const String updateSettingPriority = '/v1/sensor-priority-load/setting-update';

// Sensor Non Priority
const String lastNonPriorityData =
    '/v1/sensor-non-priority-load/view-last-record';
const String viewSettingNonPriority =
    '/v1/sensor-non-priority-load/setting-view';
const String updateSettingNonPriority =
    '/v1/sensor-non-priority-load/setting-update';

// Sensor Grid
const String lastGridData = '/v1/sensor-grid/view-last-record';

// Sensor Battery
const String lastBatteryData = '/v1/bms-sensor/view-last-record';

//Device User
const String deviceUserUrl = '/v1/device-user/index?';

//Device
const String isOnlineDevice = '/v1/device/is-online';

//Price Packet
const String indexPacket = '/v1/price-packet/index';
