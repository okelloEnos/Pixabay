import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pixabay_web/core/util/Api.dart';
import 'package:pixabay_web/features/posts/domain/entity/post_entity.dart';

class PostDataProvider {
  final Dio _dio;

  PostDataProvider({required Dio dio}) : _dio = dio;

  // create a new quote
  Future<void> createPostRequest({required PostEntity quote}) async {
    double subTotal =  0.0;
    double shippingAmount = 0.0;
    double discountAmount = 0.0;

    double discountTotal = subTotal - discountAmount;
    double taxedAmount = 0.16 * discountTotal;
    double shippingTotal = shippingAmount;
    double totalWithTax = discountTotal + taxedAmount + shippingTotal;

    // UserEntity user = locator<CollectedData>().getLoggedUser();
    // String quoteNumber = await createQuoteNumberRequest(quote: quote);
    String quoteNumber = "QT-004";
    var url = "${Api.jsonBaseUrl}/quotes";


    var data = {
      "quoteNumber": quoteNumber,
      // "quoteDate": quote.quoteDate != null
      //     ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
      //         date: quote.quoteDate!)
      //     : "2025-08-05T00:00:00.000Z",
      // "dueDate": quote.quoteDueDate != null
      //     ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
      //         date: quote.quoteDueDate!)
      //     : "2025-08-20T00:00:00.000Z",
      "image": quote.image,
      "status": "draft",

      // Client Contact
      "client": quote.toName,
      "clientFirstName": quote.billToFirstName,
      "clientLastName": quote.billToLastName,
      "clientEmail": quote.billToEmail,
      "clientPhone": quote.billToPhone,

      // Business Contact
      "business": quote.fromName,
      "businessFirstName": quote.billFromFirstName,
      "businessLastName": quote.billFromLastName,
      "businessEmail": quote.billFromEmail,
      "businessPhone": quote.billFromPhone,

      // Client Address
      "clientCountry": quote.billToCountry,
      "clientCity": quote.billToCity,
      "clientPostalAddress": quote.billToZipCode,
      "clientLocation": quote.billToAddress,

      // Business Address
      "businessCountry": quote.billFromCountry,
      "businessCity": quote.billFromCity,
      "businessPostalAddress": quote.billFromZipCode,
      "businessLocation": quote.billFromAddress,

      // Items
      // "items": items,

      "subtotal": subTotal,
      "tax": taxedAmount,
      "discount": discountAmount,
      "shipping": shippingTotal,
      "currency": "KES",
      "balanceDue": totalWithTax,
      "comments": quote.notes,
    };

    var response = await _dio.post(url,
        data: data,
        // options: Options(headers: {
        //   'Authorization':
        //       'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
        // })
    );

    if (response.statusCode != 201) {
      throw ('Failed to add a quote');
    }
  }

  // double fetchGrandTotal({required QuoteEntity quote}) {
  //   double subTotal = double.tryParse(quote.subTotal ?? "0") ?? 0.0;
  //   double shippingAmount = double.tryParse(quote.shippingAmount ?? "0") ?? 0.0;
  //   double discountAmount = double.tryParse(quote.discountAmount ?? "0") ?? 0.0;
  //   // quote.
  //   // double get grandTotal => ((totalAmount + shippingAmount + taxAmount) - discountAmount);
  //   return (subTotal + shippingAmount) - discountAmount;
  // }
  //
  // // create a new quote No
  // Future<String> createQuoteNumberRequest({required QuoteEntity quote}) async {
  //   var url = "$baseUrl/quotes/generate-number/${quote.companyId}";
  //
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //
  //   if (response.statusCode != 201) {
  //     throw ('Failed to generate a quote number');
  //   } else {
  //     return response.data;
  //   }
  // }
  //
  // // update a quote
  // Future<void> updateQuoteRequest({required QuoteEntity quote}) async {
  //   double subTotal = double.tryParse(cleanNumbers(quote.subTotal ?? "0")) ?? 0.0;
  //   double shippingAmount = double.tryParse(cleanNumbers(quote.shippingAmount ?? "0")) ?? 0.0;
  //   double discountAmount = double.tryParse(cleanNumbers(quote.discountAmount ?? "0")) ?? 0.0;
  //
  //   double discountTotal = subTotal - discountAmount;
  //   double taxedAmount = 0.16 * discountTotal;
  //   double shippingTotal = shippingAmount;
  //   double totalWithTax = discountTotal + taxedAmount + shippingTotal;
  //
  //   UserEntity user = locator<CollectedData>().getLoggedUser();
  //   var url = "$baseUrl/quotes/${quote.id}";
  //
  //   List items = quote.items.map((item) {
  //     return {
  //       "title": item.description,
  //       "price": item.price.toDoubleOrZero(),
  //       "quantity": item.qty.toDoubleOrZero(),
  //       "tax": item.tax.toDoubleOrZero(),
  //       "amount": item.amount
  //     };
  //   }).toList();
  //
  //   // var data = {
  //   //   "quoteNumber": quote.quoteNo,
  //   //   "quoteDate": quote.quoteDate != null
  //   //       ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
  //   //           date: quote.quoteDate!)
  //   //       : "2025-08-05T00:00:00.000Z",
  //   //   "dueDate": quote.quoteDueDate != null
  //   //       ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
  //   //           date: quote.quoteDueDate!)
  //   //       : "2025-08-20T00:00:00.000Z",
  //   //
  //   //   "companyId": user.companyId,
  //   //   "companyBranchId": user.branch?.id,
  //   //   "createdById": user.id,
  //   //
  //   //   // Client Contact
  //   //   "clientCompanyName": quote.toName,
  //   //   "clientFirstName": quote.billToFirstName,
  //   //   "clientLastName": quote.billToLastName,
  //   //   "clientEmail": quote.billToEmail,
  //   //   "clientPhone": quote.billToPhone,
  //   //
  //   //   // Business Contact
  //   //   "businessCompanyName": quote.fromName,
  //   //   "businessFirstName": quote.billFromFirstName,
  //   //   "businessLastName": quote.billFromLastName,
  //   //   "businessEmail": quote.billFromEmail,
  //   //   "businessPhone": quote.billFromPhone,
  //   //
  //   //   // Client Address
  //   //   "clientCountry": quote.billToCountry,
  //   //   "clientCity": quote.billToCity,
  //   //   "clientPostalAddress": quote.billToZipCode,
  //   //   "clientLocation": quote.billToAddress,
  //   //
  //   //   // Business Address
  //   //   "businessCountry": quote.billFromCountry,
  //   //   "businessCity": quote.billFromCity,
  //   //   "businessPostalAddress": quote.billFromZipCode,
  //   //   "businessLocation": quote.billFromAddress,
  //   //
  //   //   // Items
  //   //   "items": items,
  //   //
  //   //   "subtotal": quote.subTotal.toDoubleOrZero(),
  //   //   "tax": quote.taxAmount.toDoubleOrZero(),
  //   //   "discount": quote.discountAmount.toDoubleOrZero(),
  //   //   "shipping": quote.shippingAmount.toDoubleOrZero(),
  //   //   "currency": "KES",
  //   //   "balanceDue": fetchGrandTotal(quote: quote)
  //   // };
  //   var data = {
  //     // "quoteNumber": quoteNumber,
  //     "quoteDate": quote.quoteDate != null
  //         ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
  //         date: quote.quoteDate!)
  //         : "2025-08-05T00:00:00.000Z",
  //     "dueDate": quote.quoteDueDate != null
  //         ? DateTimeUtils.dateTimeConversionUtcFromDateReadable(
  //         date: quote.quoteDueDate!)
  //         : "2025-08-20T00:00:00.000Z",
  //     "image": quote.image,
  //     "status": quote.quoteStatus,
  //     "companyId": user.companyId,
  //     "companyBranchId": user.branch?.id,
  //     "createdById": user.id,
  //
  //     // Client Contact
  //     "client": quote.toName,
  //     "clientFirstName": quote.billToFirstName,
  //     "clientLastName": quote.billToLastName,
  //     "clientEmail": quote.billToEmail,
  //     "clientPhone": quote.billToPhone,
  //
  //     // Business Contact
  //     "business": quote.fromName,
  //     "businessFirstName": quote.billFromFirstName,
  //     "businessLastName": quote.billFromLastName,
  //     "businessEmail": quote.billFromEmail,
  //     "businessPhone": quote.billFromPhone,
  //
  //     // Client Address
  //     "clientCountry": quote.billToCountry,
  //     "clientCity": quote.billToCity,
  //     "clientPostalAddress": quote.billToZipCode,
  //     "clientLocation": quote.billToAddress,
  //
  //     // Business Address
  //     "businessCountry": quote.billFromCountry,
  //     "businessCity": quote.billFromCity,
  //     "businessPostalAddress": quote.billFromZipCode,
  //     "businessLocation": quote.billFromAddress,
  //
  //     // Items
  //     "items": items,
  //
  //     "subtotal": subTotal,
  //     "tax": taxedAmount,
  //     "discount": discountAmount,
  //     "shipping": shippingTotal,
  //     "currency": "KES",
  //     "balanceDue": totalWithTax,
  //     "comments": quote.notes,
  //   };
  //
  //   var response = await _dio.patch(url,
  //       data: data,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //
  //   if (response.statusCode != 200) {
  //     throw ('Failed to update quote');
  //   }
  // }
  //
  // // create a quote
  // Future<void> createQuoteActivity({required Quote quote}) async {
  //   // FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //   // CollectionReference quotesReference = fireStore.collection("QuotesActivity");
  //   // Map<String, dynamic> quoteJson = quote.toJson();
  //   // // quotesReference.add(quoteJson);
  //   // // await quotesReference.doc("${quote.id}").set(quoteJson);
  //   // // quotesReference.doc("${quote.id}").add(quoteJson);
  //   // // await quotesReference.add(quoteJson);
  //   // var f = quotesReference.doc("${quote.lead?.email}");
  //   // var c = f.collection("Activity");
  //   // c.add(quoteJson);
  // }
  //
  // // update a quote
  // Future<void> updateQuoteActivityRequest({required Quote quote}) async {
  //   // FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //   // CollectionReference quotesReference = fireStore.collection("QuotesActivity");
  //   // // Map<String, dynamic> quoteJson = quote.toJson();
  //   // var f = quotesReference.doc("${quote.lead?.email}");
  //   // var c = f.collection("Activity");
  //   // var updatedQuoteData = quote.toJson();
  //   // await c.doc("${quote.id}").update(updatedQuoteData);
  // }
  //
  // // get all quotes activity
  // Future<dynamic> fetchQuotesActivity({required String customerId}) async {
  //   var url = "$baseUrl/customers/$customerId/related-quotes";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data["relatedQuotes"];
  //   } else {
  //     throw ('Failed to fetch quote activities');
  //   }
  // }
  //
  // // delete a quote
  // Future<void> deleteQuoteRequest({required String id}) async {
  //   var url = "$baseUrl/quotes/$id";
  //   var response = await _dio.delete(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {
  //     throw ('Failed to delete a quote');
  //   }
  // }
  //
  // // get all quotes
  // Future<dynamic> fetchAllQuotesRequest() async {
  //   var url = "$baseUrl/quotes";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {
  //     throw ('Failed to fetch quotes');
  //   }
  // }
  //
  // // get quote by id
  // Future<dynamic> fetchQuoteByIdRequest({required String id}) async {
  //   var url = "$baseUrl/quotes/$id";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {
  //     throw ('Failed to fetch quote');
  //   }
  // }
  //
  // // get all quote activity
  // Future<dynamic> fetchQuoteActivities({required String customerId}) async {
  //   var url = "$baseUrl/customers/$customerId/related-quotes";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data["relatedQuotes"];
  //   } else {
  //     throw ('Failed to fetch quote activity');
  //   }
  // }
  //
  // // get all agent quotes
  // Future<dynamic> fetchAgentQuotesRequest({String? agentId}) async {
  //   var url = "$baseUrl/quotes/user/${agentId ?? locator<CollectedData>().getLoggedUser().id}";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {
  //     throw ('Failed to fetch agent quotes');
  //   }
  // }
  //
  // // get all company quotes
  // Future<dynamic> fetchAllCompanyQuotesRequest({String? companyId}) async {
  //   var url =
  //       "$baseUrl/quotes/companyId/${companyId ?? locator<CollectedData>().getLoggedUser().companyId}";
  //   var response = await _dio.get(url,
  //       options: Options(headers: {
  //         'Authorization':
  //             'Bearer ${locator.get<SharedPrefsRepositoryImpl>().getLoginToken}'
  //       }));
  //   if (response.statusCode == 200) {
  //     return response.data;
  //   } else {
  //     throw ('Failed to fetch company quotes');
  //   }
  // }
}
