"! API for Saving the Transactional Buffer of the Travel API
"!
FUNCTION Z_TP_FLIGHT_TRAVEL_SAVE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZTP_cl_flight_legacy=>get_instance( )->save( ).
ENDFUNCTION.
