CLASS zblzco_blzservice_port_type DEFINITION
  PUBLIC
  INHERITING FROM cl_proxy_client
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !logical_port_name TYPE prx_logical_port_name OPTIONAL
      RAISING
        cx_ai_system_fault.
    METHODS get_bank
      IMPORTING
        !input  TYPE zblzget_bank
      EXPORTING
        !output TYPE zblzget_bank_response
      RAISING
        cx_ai_system_fault.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zblzco_blzservice_port_type IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZBLZCO_BLZSERVICE_PORT_TYPE'
    logical_port_name   = logical_port_name
  ).

  endmethod.


  method GET_BANK.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'GET_BANK'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
