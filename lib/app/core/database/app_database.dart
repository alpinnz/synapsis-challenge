import 'package:sembast/sembast.dart';

abstract class AppDatabase {
  Future initialize();

  Future<void> create({String? id, String? store, required AppDatabaseModel data});

  Future<T?> read<T>({Finder? finder, String? id, String? store, T Function(Map<String, dynamic> json)? fromJsonT});

  Future<void> update({String? id, String? store, required AppDatabaseModel data});

  Future<void> delete({String? id, String? store});

  Future<void> clearStore({String? store});
}

abstract class AppDatabaseModel {
  const AppDatabaseModel();

  toJson();
}
