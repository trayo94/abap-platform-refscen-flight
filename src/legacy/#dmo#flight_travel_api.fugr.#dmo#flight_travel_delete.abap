"! <h1>API for Deleting a Travel</h1>
"!
"! <p>
"! Function module to delete a single Travel instance.
"! It will also delete all related subnodes of Booking and Booking Supplement.
"! </p>
"!
"! @parameter iv_travel_id          | ID of the Travel to be deleted
"! @parameter et_messages           | Table of occurred messages
"!
FUNCTION ZTP_FLIGHT_TRAVEL_DELETE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_TRAVEL_ID) TYPE  ZTP_TRAVEL_ID
*"  EXPORTING
*"     REFERENCE(ET_MESSAGES) TYPE  ZTP_IF_FLIGHT_LEGACY=>TT_MESSAGE
*"----------------------------------------------------------------------
  CLEAR et_messages.

  ZTP_cl_flight_legacy=>get_instance( )->delete_travel( EXPORTING iv_travel_id = iv_travel_id
                                                         IMPORTING et_messages  = DATA(lt_messages) ).

  ZTP_cl_flight_legacy=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.
