@AbapCatalog.sqlViewName: 'ZTP_ISUPPTXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplement Text View - CDS Data Model'

@Search.searchable: true

define view ZTP_I_SupplementText
  as select from ZTP_suppl_text as SupplementText

{
      @ObjectModel.text.element: ['Description']
  key SupplementText.supplement_id as SupplementID,

      @Semantics.language: true
  key SupplementText.language_code as LanguageCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      SupplementText.description   as Description
}
