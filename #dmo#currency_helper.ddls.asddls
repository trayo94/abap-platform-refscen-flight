@AbapCatalog.sqlViewName: 'ZTP_CURRHLP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Help View for Currency Conversion'
define view ZTP_CURRENCY_HELPER
  with parameters
    amount             : ZTP_total_price,
    source_currency    : ZTP_currency_code,
    target_currency    : ZTP_currency_code,
    exchange_rate_date : ZTP_booking_date

  as select from ZTP_agency

{
  key currency_conversion( amount             => $parameters.amount,
                           source_currency    => $parameters.source_currency,
                           target_currency    => $parameters.target_currency,
                           exchange_rate_date => $parameters.exchange_rate_date,
                           error_handling     => 'SET_TO_NULL' ) as ConvertedAmount
}
