import 'package:equatable/equatable.dart';

class PixEntity extends Equatable {
  final String? id;
  final String? image;
  final String? quoteNo;
  final String? quoteDate;
  final String? quoteDueDate;
  final String? fromName;
  final String? toName;
  final String? notes;
  final String? discount;
  final String? shipping;
  final String? subTotal;
  final String? taxAmount;
  final String? totalAmount;
  final String? discountAmount;
  final String? shippingAmount;
  final bool? showDiscount;
  final bool? showShipping;
  final String? billFromFirstName;
  final String? billFromLastName;
  final String? billFromEmail;
  final String? billFromPhone;
  final List<String>? billFromContacts;
  final String? billFromAddress;
  final String? billFromCity;
  final String? billFromCountry;
  final String? billFromZipCode;
  final List<String>? billFromAddressList;
  final String? billToFirstName;
  final String? billToLastName;
  final String? billToEmail;
  final String? billToPhone;
  final List<String>? billToContacts;
  final String? billToAddress;
  final String? billToCity;
  final String? billToCountry;
  final String? billToZipCode;
  final List<String>? billToAddressList;
  final String? quoteStatus;
  final String? companyId;

  final String? companyBranchId;
  final String? createdById;
  final String? currency;
  final String? createdAt;


  const PixEntity({
    this.id,
    this.image,
    this.quoteNo,
    this.quoteDate,
    this.quoteDueDate,
    this.fromName,
    this.toName,
    this.notes,
    this.discount,
    this.shipping,
    this.subTotal,
    this.taxAmount,
    this.totalAmount,
    this.discountAmount,
    this.shippingAmount,
    this.showDiscount,
    this.showShipping,
    this.billFromFirstName,
    this.billFromLastName,
    this.billFromEmail,
    this.billFromPhone,
    this.billFromContacts,
    this.billFromAddress,
    this.billFromCity,
    this.billFromCountry,
    this.billFromZipCode,
    this.billFromAddressList,
    this.billToFirstName,
    this.billToLastName,
    this.billToEmail,
    this.billToPhone,
    this.billToContacts,
    this.billToAddress,
    this.billToCity,
    this.billToCountry,
    this.billToZipCode,
    this.billToAddressList,
    this.quoteStatus,
    this.companyId,
    this.companyBranchId,
    this.createdById,
    this.currency,
    this.createdAt
  });

  @override
  List<Object?> get props => [
        id,
        image,
        quoteNo,
        quoteDate,
        quoteDueDate,
        fromName,
        toName,
        notes,
        discount,
        shipping,
        subTotal,
        taxAmount,
        totalAmount,
        discountAmount,
        shippingAmount,
        showDiscount,
        showShipping,
        billFromFirstName,
        billFromLastName,
        billFromEmail,
        billFromPhone,
        billFromContacts,
        billFromAddress,
        billFromCity,
        billFromCountry,
        billFromZipCode,
        billFromAddressList,
        billToFirstName,
        billToLastName,
        billToEmail,
        billToPhone,
        billToContacts,
        billToAddress,
        billToCity,
        billToCountry,
        billToZipCode,
        billToAddressList,
        quoteStatus,
        companyId,
        companyBranchId,
        createdById,
        currency,
        createdAt,
      ];

  PixEntity copyWith({
    String? id,
    String? image,
    String? quoteNo,
    String? quoteDate,
    String? quoteDueDate,
    String? fromName,
    String? toName,
    String? notes,
    String? discount,
    String? shipping,
    String? subTotal,
    String? taxAmount,
    String? totalAmount,
    String? discountAmount,
    String? shippingAmount,
    bool? showDiscount,
    bool? showShipping,
    String? billFromFirstName,
    String? billFromLastName,
    String? billFromEmail,
    String? billFromPhone,
    List<String>? billFromContacts,
    String? billFromAddress,
    String? billFromCity,
    String? billFromCountry,
    String? billFromZipCode,
    List<String>? billFromAddressList,
    String? billToFirstName,
    String? billToLastName,
    String? billToEmail,
    String? billToPhone,
    List<String>? billToContacts,
    String? billToAddress,
    String? billToCity,
    String? billToCountry,
    String? billToZipCode,
    List<String>? billToAddressList,
    String? quoteStatus,
    String? companyId,
    String? companyBranchId,
    String? createdById,
    String? currency,
    String? createdAt,
  }) {
    return PixEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      quoteNo: quoteNo ?? this.quoteNo,
      quoteDate: quoteDate ?? this.quoteDate,
      quoteDueDate: quoteDueDate ?? this.quoteDueDate,
      fromName: fromName ?? this.fromName,
      toName: toName ?? this.toName,
      notes: notes ?? this.notes,
      discount: discount ?? this.discount,
      shipping: shipping ?? this.shipping,
      subTotal: subTotal ?? this.subTotal,
      taxAmount: taxAmount ?? this.taxAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      shippingAmount: shippingAmount ?? this.shippingAmount,
      showDiscount: showDiscount ?? this.showDiscount,
      showShipping: showShipping ?? this.showShipping,
      billFromFirstName: billFromFirstName ?? this.billFromFirstName,
      billFromLastName: billFromLastName ?? this.billFromLastName,
      billFromEmail: billFromEmail ?? this.billFromEmail,
      billFromPhone: billFromPhone ?? this.billFromPhone,
      billFromContacts: billFromContacts ?? this.billFromContacts,
      billFromAddress: billFromAddress ?? this.billFromAddress,
      billFromCity: billFromCity ?? this.billFromCity,
      billFromCountry: billFromCountry ?? this.billFromCountry,
      billFromZipCode: billFromZipCode ?? this.billFromZipCode,
      billFromAddressList: billFromAddressList ?? this.billFromAddressList,
      billToFirstName: billToFirstName ?? this.billToFirstName,
      billToLastName: billToLastName ?? this.billToLastName,
      billToEmail: billToEmail ?? this.billToEmail,
      billToPhone: billToPhone ?? this.billToPhone,
      billToContacts: billToContacts ?? this.billToContacts,
      billToAddress: billToAddress ?? this.billToAddress,
      billToCity: billToCity ?? this.billToCity,
      billToCountry: billToCountry ?? this.billToCountry,
      billToZipCode: billToZipCode ?? this.billToZipCode,
      billToAddressList: billToAddressList ?? this.billToAddressList,
      quoteStatus: quoteStatus ?? this.quoteStatus,
      companyId: companyId ?? this.companyId,
      companyBranchId: companyBranchId ?? this.companyBranchId,
      createdById: createdById ?? this.createdById,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // factory constructor to create a QuoteEntity from Quote
  factory PixEntity.fromQuote(PixEntity quote) {
    return PixEntity(
      id: quote.id,
      image: quote.image,
      quoteNo: quote.quoteNo,
      quoteDate: quote.quoteDate,
      quoteDueDate: quote.quoteDueDate,
      fromName: quote.fromName,
      toName: quote.toName,
      notes: quote.notes,
      discount: quote.discount,
      shipping: quote.shipping,
      subTotal: quote.subTotal,
      taxAmount: quote.taxAmount,
      totalAmount: quote.totalAmount,
      discountAmount: quote.discountAmount,
      shippingAmount: quote.shippingAmount,
      showDiscount: quote.showDiscount,
      showShipping: quote.showShipping,
      billFromFirstName: quote.billFromFirstName,
      billFromLastName: quote.billFromLastName,
      billFromEmail: quote.billFromEmail,
      billFromPhone: quote.billFromPhone,
      billFromContacts: [quote.billFromFirstName ?? '', quote.billFromLastName ?? '', quote.billFromEmail ?? '', quote.billFromPhone ?? ''],
      billFromAddress: quote.billFromAddress,
      billFromCity: quote.billFromCity,
      billFromCountry: quote.billFromCountry,
      billFromZipCode: quote.billFromZipCode,
      billFromAddressList: [quote.billFromCountry ?? '', quote.billFromCity ?? '', quote.billFromZipCode ?? '', quote.billFromAddress ?? ''],
      billToFirstName: quote.billToFirstName,
      billToLastName: quote.billToLastName,
      billToEmail: quote.billToEmail,
      billToPhone: quote.billToPhone,
      billToContacts: [quote.billToFirstName ?? '', quote.billToLastName ?? '', quote.billToEmail ?? '', quote.billToPhone ?? ''],
      billToAddress: quote.billToAddress,
      billToCity: quote.billToCity,
      billToCountry: quote.billToCountry,
      billToZipCode: quote.billToZipCode,
      billToAddressList: [quote.billToCountry ?? '', quote.billToCity ?? '', quote.billToZipCode ?? '', quote.billToAddress ?? ''],
      quoteStatus: quote.quoteStatus,
      companyId: quote.companyId,
      companyBranchId: quote.companyBranchId,
      createdById: quote.createdById,
      currency: quote.currency,
      createdAt: quote.createdAt,
    );
  }
}