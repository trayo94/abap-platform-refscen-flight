@AbapCatalog.sqlViewName: 'ZTP_ISUPPL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplement View - CDS Data Model'

@Search.searchable: true

define view ZTP_I_Supplement
  as select from ZTP_supplement as Supplement

  association [0..*] to ZTP_I_SupplementText as _SupplText on $projection.SupplementID = _SupplText.SupplementID
  association [0..1] to I_Currency            as _Currency  on $projection.CurrencyCode = _Currency.Currency

{
      @ObjectModel.text.association: '_SupplText'
  key Supplement.supplement_id as SupplementID,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Supplement.price         as Price,

      @Semantics.currencyCode: true
      Supplement.currency_code as CurrencyCode,

      /* Associations */
      @Search.defaultSearchElement: true
      _SupplText,
      _Currency
}
