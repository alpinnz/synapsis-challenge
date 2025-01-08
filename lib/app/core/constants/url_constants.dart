class UrlConstants {
  static const String baseApiUrl = "https://dev-api-fms.apps-madhani.com/v1";
  static const String baseSocketUrl = "wss://wss.apps-madhani.com/connection/websocket";
  static const String baseSocketChannelPrefix = "ws/fms-dev";
  static const String equipmentsDevices = "/equipments/devices";
  static const String monitoringSubjects = "/monitoring/subjects";
  static const String monitoringMessages = "/monitoring/messages";
  static const String loginTabletUnit = "/login-tablet-unit";
  static const String socketChannelEquipmentsDevicesActivated = "$baseSocketChannelPrefix/equipments/devices/{device_id}/activated";
  static const String socketChannelMonitoringMessagesEquipments = "$baseSocketChannelPrefix/monitoring/messages/equipments/{equipment_id}";

}
