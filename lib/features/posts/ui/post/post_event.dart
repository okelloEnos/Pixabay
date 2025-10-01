part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchAllPostEvent extends PostEvent {
  @override
  List<Object> get props => [];
}

// class FetchGroupQuotesEvent extends QuotesEvent {
//   @override
//   List<Object> get props => [];
// }
//
// class UpdateQuoteEvent extends QuotesEvent {
//   final QuoteEntity quote;
//   final bool? isNewProduct;
//
//   const UpdateQuoteEvent({required this.quote, this.isNewProduct});
//
//   @override
//   List<Object?> get props => [quote, isNewProduct];
// }
//
// class CreateQuoteEvent extends QuotesEvent {
//   final QuoteEntity quote;
//
//   const CreateQuoteEvent({required this.quote});
//
//   @override
//   List<Object> get props => [quote];
// }

// class FetchSegmentedQuotesEvent extends QuotesEvent {
//   final String segment;
//
//   const FetchSegmentedQuotesEvent({required this.segment});
//
//   @override
//   List<Object> get props => [segment];
// }
//
// class FetchQuotesActivityEvent extends QuotesEvent {
//   final String customerId;
//
//   const FetchQuotesActivityEvent({required this.customerId});
//
//   @override
//   List<Object> get props => [customerId];
// }
//
// class SelectQuoteEvent extends QuotesEvent {
//   final Quote quote;
//
//   const SelectQuoteEvent({required this.quote});
//
//   @override
//   List<Object> get props => [quote];
// }
//
// class AllQuotesFilterEvent extends QuotesEvent {
//   final String quoteName;
//
//   const AllQuotesFilterEvent({required this.quoteName});
//
//   @override
//   List<Object> get props => [quoteName];
// }
//
// class QuotesFilterEvent extends QuotesEvent {
//   final String? searchText;
//   final String? statusText;
//   final String? productText;
//
//   const QuotesFilterEvent({this.searchText, this.productText, this.statusText});
//
//   @override
//   List<Object?> get props => [searchText, productText, statusText];
// }
//
// class PaginateQuotesEvent extends QuotesEvent{
//   final List<Quote> quotes;
//   final int totalEntries;
//   final int entriesPerPage;
//   final int currentPage;
//   final int startIndex;
//   final int endIndex;
//
//   const PaginateQuotesEvent({required this.quotes, required this.totalEntries, required this.entriesPerPage, required this.currentPage, required this.startIndex, required this.endIndex});
//
//   @override
//   List<Object> get props => [quotes, totalEntries, entriesPerPage, currentPage, startIndex, endIndex];
// }
//
// class FetchAgentQuotesEvent extends QuotesEvent {
//   final String? agentId;
//
//   const FetchAgentQuotesEvent({this.agentId});
//
//   @override
//   List<Object?> get props => [agentId];
// }
//
// class FetchCompanyQuotesEvent extends QuotesEvent {
//   final String? companyId;
//
//   const FetchCompanyQuotesEvent({this.companyId});
//
//   @override
//   List<Object?> get props => [companyId];
// }
//
// class FetchQuoteByIdEvent extends QuotesEvent {
//   final String id;
//
//   const FetchQuoteByIdEvent({required this.id});
//
//   @override
//   List<Object> get props => [id];
// }
//
// class DeleteQuoteEvent extends QuotesEvent {
//   final String id;
//
//   const DeleteQuoteEvent({required this.id});
//
//   @override
//   List<Object> get props => [id];
// }
