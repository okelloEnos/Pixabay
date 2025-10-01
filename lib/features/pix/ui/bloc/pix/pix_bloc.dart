import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/features/pix/data/repository/pix_repository.dart';

part 'pix_event.dart';
part 'pix_state.dart';

class PixBloc extends Bloc<PixEvent, PixState> {
  final PixRepository _quotesRepository;

  int rowsPerPage = 10;
  int startIndex = 0;
  int endIndex = 9;

  PixBloc({required PixRepository quotesRepository}) : _quotesRepository = quotesRepository, super(PixInitial()) {
    on<FetchAllQuotesEvent>(_onFetchAllQuotesEvent);
  }

  void _onFetchAllQuotesEvent(FetchAllQuotesEvent event, Emitter<PixState> emit) async{
    emit(PixLoading());
    try{
      int iRowsPerPage = 10;
      int iStartIndex = 0;
      int iEndIndex = 9;

      var quotes = await _quotesRepository.fetchAllQuotesRequest();
      // allQuotes = quotes;
      // allQuotes = [...quotes, ...quotes, ...quotes, ...quotes, ...quotes];
      // quotes = allQuotes;

      if(quotes.isNotEmpty && quotes.length < rowsPerPage){
        iRowsPerPage = quotes.length;
        iEndIndex = iRowsPerPage - 1;
      }

      // await Future.delayed(const Duration(seconds: 1));
      emit(PixLoaded(
          rowsPerPage: iRowsPerPage,
          startIndex: iStartIndex,
          endIndex: iEndIndex
      ));
    }
    on DioException catch(e){
      debugPrint(e.toString());
      // emit(QuotesFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      debugPrint(e.toString());
      // emit(QuotesFailure(errorMessage: e.toString()));
    }
  }
}
