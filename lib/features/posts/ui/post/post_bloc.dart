import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/features/posts/data/repository/post_repository.dart';
import 'package:pixabay_web/features/posts/domain/entity/post_entity.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _quotesRepository;

  int rowsPerPage = 10;
  int startIndex = 0;
  int endIndex = 9;

  PostBloc({required PostRepository quotesRepository}) : _quotesRepository = quotesRepository, super(PostInitial()) {
    on<FetchAllPostEvent>(_onFetchAllQuotesEvent);
  }

  void _onFetchAllQuotesEvent(FetchAllPostEvent event, Emitter<PostState> emit) async{
    emit(PostLoading());
    try{
      int iRowsPerPage = 10;
      int iStartIndex = 0;
      int iEndIndex = 9;

      var quotes = await _quotesRepository.createPostRequest(quote: const PostEntity());
      // allQuotes = quotes;
      // allQuotes = [...quotes, ...quotes, ...quotes, ...quotes, ...quotes];
      // quotes = allQuotes;

      // if(quotes.isNotEmpty && quotes.length < rowsPerPage){
      //   iRowsPerPage = quotes.length;
      //   iEndIndex = iRowsPerPage - 1;
      // }

      // await Future.delayed(const Duration(seconds: 1));
      // emit(QuotesLoaded(
      //     quotes: quotes,
      //     rowsPerPage: iRowsPerPage,
      //     startIndex: iStartIndex,
      //     endIndex: iEndIndex
      // ));
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
