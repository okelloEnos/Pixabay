import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
  final String? id;
  final String? thumbnail;
  final String? photographerName;
  final List<String>? tags;

  const PhotoEntity({
    this.id,
    this.thumbnail,
    this.photographerName,
    this.tags,
  });

  @override
  List<Object?> get props => [id, thumbnail, photographerName, tags];
}
