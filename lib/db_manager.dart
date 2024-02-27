import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kotonosyky/objects/siteData.dart';

import 'objects/cat.dart';

class DBManager {
  final db = FirebaseFirestore.instance;

  Future<SiteData> fetchSiteData() async {
    final siteCollection = db.collection('site');
    Map<String, dynamic> siteDataMap = {};
    try {
      final querySnapshot = await siteCollection.get();
      for (final docSnapshot in querySnapshot.docs) {
        siteDataMap = docSnapshot.data();
      }
      return SiteData.fromMap(siteDataMap);
    } catch (e) {
      throw Exception('Failed to fetch site data: $e');
    }
  }

  Stream<List<Cat>> catsStream(int? limit) async* {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    await for (final chunk in db
        .collection('cats')
        .where('adopted', isEqualTo: false)
        .orderBy('pinned', descending: true)
        .orderBy('shelter_arrive_date')
        .limit(limit ?? 11)
        .snapshots(includeMetadataChanges: true)) {
      List<Cat> cats = [];
      cats = chunk.docs.map((e) => Cat.fromJson(e.data())).toList();
      final source = (!chunk.metadata.isFromCache) ? "local cache" : "server";
      if (kDebugMode) {
        print("Data fetched from $source");
      }
      yield cats;
    }
  }

  Future<List<Cat>> getAdopted({int? limit}) async {
    try {
      var querySnapshot = await db
          .collection('cats')
          .where('adopted', isEqualTo: true)
          .orderBy('shelter_arrive_date')
          .get();

      List<Cat> cats =
          querySnapshot.docs.map((e) => Cat.fromJson(e.data())).toList();
      return cats;
    } catch (e) {
      throw Exception('Failed to fetch cats: $e');
    }
  }

  Future<int> getCatsCount() async {
    int catsLength = 0;
    try {
      await db
          .collection("cats")
          .where('adopted', isEqualTo: false)
          .count()
          .get()
          .then((res) {
        catsLength = res.count;
      });
      return catsLength;
    } catch (e) {
      if (kDebugMode) {
        print("Error completing: $e");
      }
      return 0;
    }
  }

  Future<Cat> getCatById(String id) async {
    var response = await catRef.doc(id).get();
    return response.data!;
  }
}
