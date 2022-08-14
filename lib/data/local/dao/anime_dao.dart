import 'package:floor/floor.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';

@dao
abstract class AnimeDao {
  @Query(
      'SELECT * FROM Anime Where isFavorite=1 ORDER BY timeToAddFavorite DESC')
  Future<List<Anime>> getListFavorite();

  @Query(
      'SELECT * FROM Anime Where isFavorite=1 ORDER BY timeToAddFavorite DESC')
  Stream<List<Anime>> streamListFavorite();

  @Query('SELECT * FROM Anime WHERE animeId = :animeId AND isFavorite=1')
  Stream<Anime?> isFavorite(int animeId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertData(Anime data);

  @delete
  Future<void> deleteData(Anime data);
}
