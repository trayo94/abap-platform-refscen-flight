"! API for Initializing the Transactional Buffer of the Travel API
"!
FUNCTION Z_TP_FLIGHT_TRAVEL_INITIALIZE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZTP_cl_flight_legacy=>get_instance( )->initialize( ).
ENDFUNCTION.
