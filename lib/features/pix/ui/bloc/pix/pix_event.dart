part of 'pix_bloc.dart';

abstract class PixEvent extends Equatable {
  const PixEvent();
}

class FetchAllQuotesEvent extends PixEvent {
  @override
  List<Object> get props => [];
}
