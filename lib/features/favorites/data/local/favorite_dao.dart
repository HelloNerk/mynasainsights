import '../../../../shared/data/app_database.dart';
import 'favorite_model.dart';

class FavoriteDao {
  Future<List<FavoriteModel>> fetchAllFavorites() async {
    final db = await AppDatabase().openDb();
    List favorites = await db.query(AppDatabase().tableName);
    return favorites.map((map) => FavoriteModel.fromMap(map)).toList();
  }

  Future<void> insertFavorite(FavoriteModel favorite) async {
    final db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, favorite.toMap());
  }

  Future<void> deleteFavorite(String date) async {
    final db = await AppDatabase().openDb();
    await db.delete(AppDatabase().tableName, where: 'date = ?', whereArgs: [date]);
  }

  Future<bool> isFavorite(String date) async {
    final db = await AppDatabase().openDb();
    List result = await db.query(AppDatabase().tableName, where: 'date = ?', whereArgs: [date]);
    return result.isNotEmpty;
  }
}
