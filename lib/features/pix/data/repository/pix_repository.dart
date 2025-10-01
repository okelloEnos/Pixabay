

import 'package:pixabay_web/features/pix/data/data_provider/pixs_data_provider.dart';
import 'package:pixabay_web/features/pix/data/model/pix.dart';

class PixRepository {
  final PixDataProvider _quotesDataProvider;

  PixRepository({required PixDataProvider quotesDataProvider})
      : _quotesDataProvider = quotesDataProvider;

  Future<List<Pix>> fetchAllQuotesRequest() async {
    List<Pix> listOfQuotes = [];
    final allQuotesResponse = await _quotesDataProvider.fetchAllPixRequest();
    listOfQuotes = List<Pix>.from(allQuotesResponse.map((quoteMap) => Pix.fromJson(quoteMap)));

    return listOfQuotes;
  }
}
