CLASS zcl_zfpm_file_attach_upload DEFINITION
  PUBLIC
  INHERITING FROM cl_wd_component_assistance
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA go_wd_comp TYPE REF TO ziwci_fpm_file_attach_upload READ-ONLY .
    CLASS-DATA gv_wd_comp_id TYPE string READ-ONLY .
    DATA mo_comp_usage TYPE REF TO if_wd_component_usage .
    DATA mo_event_data TYPE REF TO if_fpm_parameter .

    CLASS-METHODS class_constructor .
    CLASS-METHODS fpm_popup
      IMPORTING
        !io_event_orig        TYPE REF TO cl_fpm_event OPTIONAL
        !iv_callback_event_id TYPE string
        !io_event_data        TYPE REF TO if_fpm_parameter OPTIONAL .
    METHODS on_close
        FOR EVENT window_closed OF if_wd_window .
    METHODS on_ok
      IMPORTING
        !iv_file_name       TYPE fpm_file_name
        !iv_file_content    TYPE fpm_file_content
        !iv_file_size       TYPE fpm_file_size
        !iv_file_size_descr TYPE fpm_filesize_descr
        !iv_file_type       TYPE fpm_file_type .
    CLASS-METHODS open_popup
      IMPORTING
        !io_event_data TYPE REF TO if_fpm_parameter .
    CLASS-METHODS wd_popup
      IMPORTING
        !io_view            TYPE REF TO if_wd_view_controller
        !iv_callback_action TYPE string
        !io_event_data      TYPE REF TO if_fpm_parameter OPTIONAL .
  PROTECTED SECTION.

    METHODS do_callback .
    CLASS-METHODS readme .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZFPM_FILE_ATTACH_UPLOAD IMPLEMENTATION.


  METHOD class_constructor.
    gv_wd_comp_id = CAST cl_abap_refdescr( cl_abap_typedescr=>describe_by_data( go_wd_comp ) )->get_referenced_type( )->get_relative_name( ).
    REPLACE 'IWCI_' IN gv_wd_comp_id WITH ''.
  ENDMETHOD.


  METHOD do_callback.
    DATA: lv_event_id  TYPE fpm_event_id,
          lo_fpm       TYPE REF TO if_fpm,
          lo_event     TYPE REF TO cl_fpm_event,
          lo_event_org TYPE REF TO cl_fpm_event,
          lt_key       TYPE TABLE OF string,
          lv_key       TYPE string,
          lr_value     TYPE REF TO data,
          lv_action    TYPE string,
          lo_view      TYPE REF TO cl_wdr_view,
          lo_action    TYPE REF TO if_wdr_action,
          lt_param     TYPE wdr_name_value_list,
          ls_param     TYPE wdr_name_value.


**********************************************************************
* FPM
**********************************************************************
    mo_event_data->get_value(
      EXPORTING
        iv_key   = 'IV_CALLBACK_EVENT_ID'
      IMPORTING
        ev_value = lv_event_id
    ).
    IF lv_event_id IS NOT INITIAL.

      lo_fpm = cl_fpm=>get_instance( ).
      CHECK: lo_fpm IS NOT INITIAL.

      CREATE OBJECT lo_event
        EXPORTING
          iv_event_id   = lv_event_id
          io_event_data = mo_event_data.

      mo_event_data->get_value(
        EXPORTING
          iv_key   = 'IO_EVENT_ORIG'
        IMPORTING
          ev_value = lo_event_org
      ).
      IF lo_event_org IS NOT INITIAL.
        lo_event->ms_source_uibb = lo_event_org->ms_source_uibb.
      ENDIF.

      lo_fpm->raise_event( lo_event ).

    ENDIF.


**********************************************************************
* WD
**********************************************************************
    mo_event_data->get_value(
      EXPORTING
        iv_key   = 'IV_CALLBACK_ACTION'
      IMPORTING
        ev_value = lv_action
    ).
    IF lv_action IS NOT INITIAL.

      mo_event_data->get_value(
        EXPORTING
          iv_key   = 'IO_VIEW'
        IMPORTING
          ev_value = lo_view
      ).
      CHECK: lo_view IS NOT INITIAL.

      TRY.
          lo_action = lo_view->get_action_internal( lv_action ).
        CATCH cx_wdr_runtime INTO DATA(lx_wdr_runtime).
          wdr_task=>application->component->if_wd_controller~get_message_manager( )->report_error_message( lx_wdr_runtime->get_text( ) ).
      ENDTRY.
      CHECK: lo_action IS NOT INITIAL.

      CLEAR: ls_param.
      ls_param-name = 'MO_EVENT_DATA'.
      ls_param-object = mo_event_data.
      ls_param-type = cl_abap_typedescr=>typekind_oref.
      APPEND ls_param TO lt_param.

      lt_key = mo_event_data->get_keys( ).
      LOOP AT lt_key INTO lv_key.
        mo_event_data->get_value(
          EXPORTING
            iv_key   = lv_key
          IMPORTING
            er_value = lr_value
        ).
        CLEAR: ls_param.
        ls_param-name = lv_key.
        ls_param-dref = lr_value.
        ls_param-type = cl_abap_typedescr=>typekind_dref.
        APPEND ls_param TO lt_param.
      ENDLOOP.

      lo_action->set_parameters( lt_param ).
      lo_action->fire( ).

    ENDIF.
  ENDMETHOD.


  METHOD fpm_popup.
    DATA: lo_event_data TYPE REF TO if_fpm_parameter.

    IF io_event_data IS NOT INITIAL.
      lo_event_data = io_event_data.
    ELSE.
      CREATE OBJECT lo_event_data TYPE cl_fpm_parameter.
    ENDIF.

    lo_event_data->set_value(
      EXPORTING
        iv_key   = 'IV_CALLBACK_EVENT_ID'
        iv_value = iv_callback_event_id
    ).

    IF io_event_orig IS NOT INITIAL.
      lo_event_data->set_value(
        EXPORTING
          iv_key   = 'IO_EVENT_ORIG'
          iv_value = io_event_orig
      ).
    ENDIF.


    open_popup( lo_event_data ).
  ENDMETHOD.


  METHOD on_close.
    mo_comp_usage->delete_component( ).
  ENDMETHOD.


  METHOD on_ok.
    DATA: lt_callstack   TYPE abap_callstack,
          ls_callstack   TYPE abap_callstack_line,
          lo_class_desc  TYPE REF TO cl_abap_classdescr,
          ls_method_desc TYPE abap_methdescr,
          ls_param_desc  TYPE abap_parmdescr.
    FIELD-SYMBOLS: <lv_value> TYPE any.

    CALL FUNCTION 'SYSTEM_CALLSTACK'
      EXPORTING
        max_level = 1
      IMPORTING
        callstack = lt_callstack.
    READ TABLE lt_callstack INTO ls_callstack INDEX 1.
    lo_class_desc ?= cl_abap_classdescr=>describe_by_name( cl_oo_classname_service=>get_clsname_by_include( ls_callstack-include ) ).
    READ TABLE lo_class_desc->methods INTO ls_method_desc WITH KEY name = ls_callstack-blockname.
    LOOP AT ls_method_desc-parameters INTO ls_param_desc WHERE parm_kind = cl_abap_classdescr=>importing.
      ASSIGN (ls_param_desc-name) TO <lv_value>.
      mo_event_data->set_value(
        EXPORTING
          iv_key   = CONV #( ls_param_desc-name )
          iv_value = <lv_value>
      ).
    ENDLOOP.

    do_callback( ).

  ENDMETHOD.


  METHOD open_popup.
* Please call fpm_popup( ) or wd_popup( ).
    DATA: lo_comp_usage TYPE REF TO if_wd_component_usage.

    cl_wdr_runtime_services=>get_component_usage(
      EXPORTING
        component            = wdr_task=>application->component
        used_component_name  = gv_wd_comp_id
        component_usage_name = gv_wd_comp_id
        create_component     = abap_true
        do_create            = abap_true
      RECEIVING
        component_usage      = lo_comp_usage
    ).

    go_wd_comp ?= lo_comp_usage->get_interface_controller( ).

    go_wd_comp->open_popup(
        io_event_data = io_event_data
        io_comp_usage = lo_comp_usage
    ).
  ENDMETHOD.


  METHOD readme.
* https://github.com/boy0korea/ZWD_INSTANT_POPUP
  ENDMETHOD.


  METHOD wd_popup.
    DATA: lo_event_data TYPE REF TO if_fpm_parameter.

    IF io_event_data IS NOT INITIAL.
      lo_event_data = io_event_data.
    ELSE.
      CREATE OBJECT lo_event_data TYPE cl_fpm_parameter.
    ENDIF.

    lo_event_data->set_value(
      EXPORTING
        iv_key   = 'IV_CALLBACK_ACTION'
        iv_value = iv_callback_action
    ).

    lo_event_data->set_value(
      EXPORTING
        iv_key   = 'IO_VIEW'
        iv_value = CAST cl_wdr_view( io_view )
    ).

    open_popup( lo_event_data ).
  ENDMETHOD.
ENDCLASS.
