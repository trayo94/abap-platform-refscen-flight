"! <h1>API for Getting a Travel</h1>
"!
"! <p>
"! Function module to get a single Travel instance with all related Bookings and
"! Booking Supplements related to the importing Travel ID.
"! </p>
"!
"!
"! @parameter iv_travel_id          | Travel ID
"! @parameter iv_include_buffer     | Include any changes that have not yet been committed
"! @parameter es_travel             | Travel Data like ZTP_TRAVEL related to the importing Travel ID
"! @parameter et_booking            | Table of Bookings like ZTP_BOOKING related to the importing Travel ID
"! @parameter et_booking_supplement | Table of Booking Supplements like ZTP_BOOK_SUPPL related to the importing Travel ID
"! @parameter et_messages           | Table of occurred messages
"!
FUNCTION Z_TP_FLIGHT_TRAVEL_READ.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_TRAVEL_ID) TYPE  ZTP_TRAVEL_ID
*"     REFERENCE(IV_INCLUDE_BUFFER) TYPE  ABAP_BOOLEAN DEFAULT
*"       ABAP_TRUE
*"  EXPORTING
*"     REFERENCE(ES_TRAVEL) TYPE  ZTP_TRAVEL
*"     REFERENCE(ET_BOOKING) TYPE  ZTP_IF_FLIGHT_LEGACY=>TT_BOOKING
*"     REFERENCE(ET_BOOKING_SUPPLEMENT) TYPE
*"        ZTP_IF_FLIGHT_LEGACY=>TT_BOOKING_SUPPLEMENT
*"     REFERENCE(ET_MESSAGES) TYPE  ZTP_IF_FLIGHT_LEGACY=>TT_MESSAGE
*"----------------------------------------------------------------------
  CLEAR es_travel.
  CLEAR et_booking.
  CLEAR et_booking_supplement.
  CLEAR et_messages.

  ZTP_cl_flight_legacy=>get_instance( )->get_travel( EXPORTING iv_travel_id          = iv_travel_id
                                                                iv_include_buffer     = iv_include_buffer
                                                      IMPORTING es_travel             = es_travel
                                                                et_booking            = et_booking
                                                                et_booking_supplement = et_booking_supplement
                                                                et_messages           = DATA(lt_messages) ).

  ZTP_cl_flight_legacy=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.
