@EndUserText.label: 'Travel projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
  headerInfo: { typeName: 'Travel', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'TravelID' } } }

@Search.searchable: true

define root view entity ZTP_C_Travel_Approver_M
  as projection on ZTP_I_Travel_M
{
      @UI.facet: [ { id:              'Travel',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Travel',
                     position:        10 } ,
                   { id:              'Booking',
                     purpose:         #STANDARD,
                     type:            #LINEITEM_REFERENCE,
                     label:           'Booking',
                     position:        20,
                     targetElement:   '_Booking'}]

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10 } ] }
      @Search.defaultSearchElement: true
  key travel_id          as TravelID,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20 } ],
          selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [ { entity : {name: 'ZTP_I_Agency', element: 'AgencyID'  } } ]

      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      agency_id          as AgencyID,
      _Agency.Name       as AgencyName,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30 } ],
          selectionField: [ { position: 30 } ] }
      @Consumption.valueHelpDefinition: [ { entity : {name: 'ZTP_I_Customer', element: 'CustomerID'  } } ]

      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      customer_id        as CustomerID,
      _Customer.LastName as CustomerName,

      @UI: {
          identification:[ { position: 40 } ] }
      begin_date         as BeginDate,

      @UI: {
          identification:[ { position: 41 } ] }
      end_date           as EndDate,

      @UI: {
          lineItem:       [ { position: 42, importance: #MEDIUM } ],
          identification: [ { position: 42 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee        as BookingFee,

      @UI: {
          lineItem:       [ { position: 43, importance: #MEDIUM } ],
          identification: [ { position: 43, label: 'Total Price' } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,

      @Consumption.valueHelpDefinition: [ {entity: {name: 'I_Currency', element: 'Currency' } } ]
      currency_code      as CurrencyCode,

      @UI: {
          lineItem:       [ { position: 15, importance: #HIGH },
                            { type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept Travel' },
                            { type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'Reject Travel' } ],
          identification: [ { position: 15 }, 
                            { type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept Travel' },
                            { type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'Reject Travel' } ] ,
          selectionField: [ { position: 40 } ] }
      @EndUserText.label: 'Overall Status'
      overall_status     as TravelStatus,

      @UI: {
          lineItem: [ { position: 45, importance: #MEDIUM } ],
          identification:[ { position: 45 } ] }
      description        as Description,

      /* Admininstrative fields */
      @UI.hidden: true
      last_changed_at    as LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZTP_C_Booking_Approver_M,
      _Agency,
      _Customer
}
