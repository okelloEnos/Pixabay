import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    super.id,
    super.thumbnail,
    super.photographerName,
    super.tags,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'].toString(),
      thumbnail: json['webformatURL'],
      photographerName: json['user'],
      tags: (json['tags'] as String).split(', '),
    );
  }

  factory PhotoModel.fromEntity({required PhotoEntity entity}) {
    return PhotoModel(
      id: entity.id,
      thumbnail: entity.thumbnail,
      photographerName: entity.photographerName,
      tags: entity.tags,
    );
  }
}
