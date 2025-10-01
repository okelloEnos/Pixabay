

import 'package:pixabay_web/features/posts/data/data_provider/post_data_provider.dart';
import 'package:pixabay_web/features/posts/domain/entity/post_entity.dart';

class PostRepository {
  final PostDataProvider _postDataProvider;

  PostRepository({required PostDataProvider postDataProvider})
      : _postDataProvider = postDataProvider;

  Future<void> createPostRequest({required PostEntity quote}) async {
    await _postDataProvider.createPostRequest(quote: quote);
  }

  // Future<void> updateQuoteRequest({required QuoteEntity quote}) async {
  //   await _quotesDataProvider.updateQuoteRequest(quote: quote);
  // }
  //
  // Future<void> createQuoteActivity({required Quote quote}) async {
  //   await _quotesDataProvider.createQuoteActivity(quote: quote);
  // }
  //
  // Future<void> deleteQuoteRequest({required String id}) async {
  //   await _quotesDataProvider.deleteQuoteRequest(id: id);
  // }
  //
  // Future<List<Quote>> fetchAllQuotesRequest() async {
  //   List<Quote> listOfQuotes = [];
  //   final allQuotesResponse = await _quotesDataProvider.fetchAllQuotesRequest();
  //   listOfQuotes = List<Quote>.from(allQuotesResponse.map((quoteMap) => Quote.fromJson(quoteMap)));
  //
  //   return listOfQuotes;
  // }
  //
  // Future<QuoteEntity> fetchQuoteByIdRequest({required String id}) async {
  //   final quoteResponse = await _quotesDataProvider.fetchQuoteByIdRequest(id: id);
  //   QuoteEntity quote = QuoteEntity.fromQuote(Quote.fromJson(quoteResponse));
  //   return quote;
  // }
  //
  // Future<List<Quote>> fetchQuotesActivity({required String customerId}) async {
  //   List<Quote> listOfQuotes = [];
  //   final quotesActivityResponse = await _quotesDataProvider.fetchQuotesActivity(customerId: customerId);
  //   listOfQuotes = List<Quote>.from(quotesActivityResponse.map((quoteMap) => Quote.fromJson(quoteMap)));
  //
  //   return listOfQuotes;
  // }
  //
  // Future<void> updateQuoteActivityRequest({required Quote quote}) async {
  //   await fetchQuotesActivity(customerId: quote.id ?? "");
  //   // Quote interestedQuote = listOfQuotes.firstWhere((element) => element.id == quote.id
  //   //     // && element.productName == quote.productName
  //   // );
  //   // await _quotesDataProvider.updateQuoteActivityRequest(quote: interestedQuote);
  // }
  //
  // Future<List<Quote>> fetchQuoteActivities({required String customerId}) async {
  //   List<Quote> listOfQuotes = [];
  //   final quotesActivityResponse = await _quotesDataProvider.fetchQuoteActivities(customerId: customerId);
  //   listOfQuotes = List<Quote>.from(quotesActivityResponse.map((quoteMap) => Quote.fromJson(quoteMap)));
  //
  //   return listOfQuotes;
  // }
  //
  // Future<List<Quote>> fetchAgentQuotesRequest({String? agentId}) async {
  //   List<Quote> listOfQuotes = [];
  //   final allQuotesResponse = await _quotesDataProvider.fetchAgentQuotesRequest(agentId: agentId);
  //   listOfQuotes = List<Quote>.from(allQuotesResponse.map((quoteMap) => Quote.fromJson(quoteMap)));
  //
  //   return listOfQuotes;
  // }
  //
  // Future<List<Quote>> fetchAllCompanyQuotesRequest({String? companyId}) async {
  //   List<Quote> listOfQuotes = [];
  //   final allQuotesResponse = await _quotesDataProvider.fetchAllCompanyQuotesRequest(companyId: companyId);
  //   listOfQuotes = List<Quote>.from(allQuotesResponse.map((quoteMap) => Quote.fromJson(quoteMap)));
  //
  //   return listOfQuotes;
  // }

}
