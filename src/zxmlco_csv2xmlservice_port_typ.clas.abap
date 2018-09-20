class ZXMLCO_CSV2XMLSERVICE_PORT_TYP definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    raising
      CX_AI_SYSTEM_FAULT .
  methods CONVERT
    importing
      !INPUT type ZXMLCONVERT_REQUEST
    exporting
      !OUTPUT type ZXMLCONVERT_RESPONSE
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZXMLCO_CSV2XMLSERVICE_PORT_TYP IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZXMLCO_CSV2XMLSERVICE_PORT_TYP'
    logical_port_name   = logical_port_name
  ).

  endmethod.


  method CONVERT.

  data:
    ls_parmbind type abap_parmbind,
    lt_parmbind type abap_parmbind_tab.

  ls_parmbind-name = 'INPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>importing.
  get reference of INPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  ls_parmbind-name = 'OUTPUT'.
  ls_parmbind-kind = cl_abap_objectdescr=>exporting.
  get reference of OUTPUT into ls_parmbind-value.
  insert ls_parmbind into table lt_parmbind.

  if_proxy_client~execute(
    exporting
      method_name = 'CONVERT'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
