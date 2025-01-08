import 'dart:developer';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart' as db;
import 'package:sembast/sembast_io.dart';
import 'package:synapsis/app/core/database/app_database.dart';

class AppDatabaseImpl implements AppDatabase {
  static String dbName = 'synapsis-challenge.db';
  static String defaultKey = 'defaultKey';

  db.Database? database;
  StoreRef<String, Map<String, Object?>>? store;

  /// Membuka database berarti memuat kontennya ke dalam memori.
  /// Ini adalah operasi yang mahal. Dalam aplikasi (flutter, web),
  /// cara yang disarankan adalah membuka database saat mulai dan tetap membukanya selama masa pakai aplikasi.
  @override
  Future<void> initialize() async {
    try {
      final factory = databaseFactoryIo;
      final dir = await getApplicationDocumentsDirectory();
      database = await factory.openDatabase(join(dir.path, dbName));

      store = db.stringMapStoreFactory.store();
    } catch (err) {
      log('Error trying to open database: $store: $err', name: 'Database');
      rethrow;
    }
  }

  /// Buat data di database.
  ///
  /// Params:
  ///  * [id] Primary Key jika null secara default [defaultKey].
  ///  * [store] prefix di database ,[store] jika null secara default tersimpan di store main.
  ///  * [data] json data yang tersimpan.
  @override
  Future<void> create({String? id, String? store, required AppDatabaseModel data}) async {
    try {
      if (database == null) await initialize();

      var ref = db.stringMapStoreFactory.store(store);
      await ref.record(id ?? defaultKey).put(database!, data.toJson(), merge: true);
    } catch (err) {
      log('Error trying to write data $store: $store: $err', name: 'Database');
      rethrow;
    }
  }

  /// Membaca record yang sudah dibuat.
  ///
  /// Params:
  ///  * [id] Primary Key jika null secara default [defaultKey].
  ///  * [store] prefix di database ,[store] jika null secara default tersimpan di store main.
  ///
  /// Return => sesusai model generic data yang ditentukan
  @override
  Future<T?> read<T>({db.Finder? finder, String? id, String? store, T Function(Map<String, dynamic> json)? fromJsonT}) async {
    try {
      if (database == null) await initialize();

      var ref = db.stringMapStoreFactory.store(store);
      if (finder != null) {
        final res = await ref.findFirst(database!, finder: finder);
        if (res != null) {
          if (fromJsonT != null) {
            return fromJsonT(res.value);
          } else {
            return res.value as T;
          }
        }
        return null;
      }

      final res = await ref.record(id ?? defaultKey).get(database!);
      if (res != null) {
        if (fromJsonT != null) {
          return fromJsonT(res);
        } else {
          return res as T;
        }
      }
      return null;
    } catch (err) {
      log('Error trying to read data ${database?.path} $store: $store: $store: $err', name: 'Database');
      rethrow;
    }
  }

  /// Mengupdate record yang sudah dibuat.
  ///
  /// Params:
  ///  * [id] Primary Key jika null secara default [defaultKey].
  ///  * [store] prefix di database ,[store] jika null secara default tersimpan di store main.
  ///  * [data] json data yang diupdate.
  ///
  /// Return => updated data
  @override
  Future update({String? id, String? store, required AppDatabaseModel data}) async {
    try {
      if (database == null) await initialize();

      var ref = db.stringMapStoreFactory.store(store);
      var res = await ref.record(id ?? defaultKey).update(database!, data.toJson());
      return res;
    } catch (err) {
      log('Error trying to update data: $store: $store: $err', name: 'Database');
      rethrow;
    }
  }

  /// Menghapus record.
  ///
  /// Params:
  ///  * [id] Primary Key jika null secara default [defaultKey].
  ///  * [store] prefix di database ,[store] jika null secara default tersimpan di store main.
  ///
  /// Return => id jika berhasil dihapus, null jika tidak ditemukan
  @override
  Future delete({String? id, String? store}) async {
    try {
      if (database == null) await initialize();

      var ref = db.stringMapStoreFactory.store(store);
      var data = await ref.record(id ?? defaultKey).delete(database!);
      return data;
    } catch (err) {
      log('Error trying to delete data: $store: $store: $err', name: 'Database');
      rethrow;
    }
  }

  @override
  Future clearStore({String? store}) async {
    try {
      if (database == null) await initialize();

      var ref = db.stringMapStoreFactory.store(store);
      var data = await ref.delete(database!);
      return data;
    } catch (err) {
      log('Error trying to delete data: $store: $store: $err', name: 'Database');
      rethrow;
    }
  }
}
