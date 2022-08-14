import 'package:floor/floor.dart';
import 'package:repository_anime_sub_indo/data/local/entity/episode_entity.dart';

@dao
abstract class EpisodeDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertData(EpisodeEntity data);

  @Query('SELECT * FROM Episode Where idAnime=:idAnime')
  Future<List<EpisodeEntity>> getByIdAnime(String idAnime);
}
