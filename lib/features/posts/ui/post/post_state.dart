part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoaded extends PostState {
  final bool? isSearching;
  final int? rowsPerPage;
  final int? endIndex;
  final int? startIndex;
  final int? currentPage;

  const PostLoaded({
    this.isSearching,
    this.rowsPerPage,
    this.startIndex,
    this.endIndex,
    this.currentPage});

  @override
  List<Object?> get props => [
    isSearching,
    rowsPerPage,
    startIndex,
    endIndex,
    currentPage];
}


class PostFailure extends PostState {
  final String errorMessage;

  const PostFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}



