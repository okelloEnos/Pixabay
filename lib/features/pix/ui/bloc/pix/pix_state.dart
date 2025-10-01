part of 'pix_bloc.dart';

abstract class PixState extends Equatable {
  const PixState();
}

class PixInitial extends PixState {
  @override
  List<Object> get props => [];
}

class PixLoading extends PixState {
  @override
  List<Object> get props => [];
}

class PixLoaded extends PixState {
  final bool? isSearching;
  final int? rowsPerPage;
  final int? endIndex;
  final int? startIndex;
  final int? currentPage;

  const PixLoaded({
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


class PixFailure extends PixState {
  final String errorMessage;

  const PixFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
