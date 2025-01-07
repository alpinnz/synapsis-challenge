class UrlConstants {
  static const String baseApiUrl = "https://dev-api-fms.apps-madhani.com/v1";
  static const String baseSocketUrl = "wss://wss.apps-madhani.com/connection/websocket";
  static const String baseSocketChannelPrefix = "ws/fms-dev";
  static const String equipmentsDevices = "/equipments/devices";
  static const String socketChannelEquipmentsDevicesActivated = "$baseSocketChannelPrefix/equipments/devices/{device_id}/activated";
}
