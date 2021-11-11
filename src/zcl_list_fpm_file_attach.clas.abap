CLASS zcl_list_fpm_file_attach DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_fpm_guibb .
    INTERFACES if_fpm_guibb_list .

    TYPES:
      BEGIN OF ts_data,
        ui_deleted      TYPE flag,
        ui_seq_no       TYPE zfpm_file_attach-seq_no,
        key1            TYPE zfpm_file_attach-key1,
        seq_no          TYPE zfpm_file_attach-seq_no,
        file_name       TYPE zfpm_file_attach-file_name,
        file_size       TYPE zfpm_file_attach-file_size,
        file_size_descr TYPE zfpm_file_attach-file_size_descr,
        file_content    TYPE zfpm_file_attach-file_content,
      END OF ts_data .
    TYPES:
      tt_data TYPE TABLE OF ts_data .
  PROTECTED SECTION.
private section.

  data MV_KEY1 type ZFPM_FILE_ATTACH-KEY1 .

  methods ON_OPEN
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
  methods ON_EDIT
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
  methods ON_CELL_ACTION
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
  methods ON_SAVE
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
  methods ON_DELETE_LINE
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
  methods ON_UNDELETE_LINE
    importing
      !IV_EVENTID type ref to CL_FPM_EVENT
      !IT_SELECTED_FIELDS type FPMGB_T_SELECTED_FIELDS
      !IV_RAISED_BY_OWN_UI type BOOLE_D
      !IV_VISIBLE_ROWS type I
      !IV_EDIT_MODE type FPM_EDIT_MODE
      !IO_EXTENDED_CTRL type ref to IF_FPM_LIST_ATS_EXT_CTRL
    exporting
      !ET_MESSAGES type FPMGB_T_MESSAGES
      !EV_DATA_CHANGED type BOOLE_D
      !EV_FIELD_USAGE_CHANGED type BOOLE_D
      !EV_ACTION_USAGE_CHANGED type BOOLE_D
      !EV_SELECTED_LINES_CHANGED type BOOLE_D
      !EV_DND_ATTR_CHANGED type BOOLE_D
      !EO_ITAB_CHANGE_LOG type ref to IF_SALV_ITAB_CHANGE_LOG
    changing
      !CT_DATA type TT_DATA
      !CT_FIELD_USAGE type FPMGB_T_FIELDUSAGE
      !CT_ACTION_USAGE type FPMGB_T_ACTIONUSAGE
      !CT_SELECTED_LINES type RSTABIXTAB
      !CV_LEAD_INDEX type SYTABIX
      !CV_FIRST_VISIBLE_ROW type I
      !CS_ADDITIONAL_INFO type FPMGB_S_ADDITIONAL_INFO
      !CT_DND_ATTRIBUTES type FPMGB_T_DND_DEFINITION .
ENDCLASS.



CLASS ZCL_LIST_FPM_FILE_ATTACH IMPLEMENTATION.


  METHOD if_fpm_guibb_list~check_config.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~flush.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~get_data.
    DATA: lo_event        TYPE REF TO cl_fpm_event,
          ls_field_usage  TYPE fpmgb_s_fieldusage,
          ls_action_usage	TYPE fpmgb_s_actionusage.
    FIELD-SYMBOLS: <lt_data> TYPE tt_data,
                   <ls_data> TYPE ts_data.


    CASE iv_eventid->mv_event_id.
*      WHEN if_fpm_constants=>gc_event-call_suboverview_page.
      WHEN 'OPEN_ATTACH_UIBB'.
        on_open(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


      WHEN if_fpm_guibb_list=>gc_guibb_list_on_cell_action.
        CHECK iv_raised_by_own_ui EQ abap_true.
        on_cell_action(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


      WHEN if_fpm_constants=>gc_event-save.
        on_save(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


      WHEN if_fpm_constants=>gc_event-edit.
        on_edit(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


      WHEN if_fpm_constants=>gc_event-cancel.


      WHEN 'NEW_UPLOAD'.
        CHECK: iv_raised_by_own_ui EQ abap_true.
        zcl_zfpm_file_attach_upload=>fpm_popup(
          EXPORTING
            io_event_orig        = iv_eventid
            iv_callback_event_id = 'NEW_UPLOAD_OK'
        ).


      WHEN 'NEW_UPLOAD_OK'.
        CHECK: iv_raised_by_own_ui EQ abap_true.
*@78\QImporting@  IV_FILE_NAME  TYPE FPM_FILE_NAME
*@78\QImporting@  IV_FILE_CONTENT TYPE FPM_FILE_CONTENT
*@78\QImporting@  IV_FILE_SIZE  TYPE FPM_FILE_SIZE
*@78\QImporting@  IV_FILE_SIZE_DESCR  TYPE FPM_FILESIZE_DESCR
        ev_data_changed = abap_true.
        ASSIGN ct_data TO <lt_data>.
        APPEND INITIAL LINE TO <lt_data> ASSIGNING <ls_data>.
        <ls_data>-ui_seq_no = sy-tabix.
        iv_eventid->mo_event_data->get_value(
          EXPORTING
            iv_key   = 'IV_FILE_NAME'
          IMPORTING
            ev_value = <ls_data>-file_name
        ).
        iv_eventid->mo_event_data->get_value(
          EXPORTING
            iv_key   = 'IV_FILE_CONTENT'
          IMPORTING
            ev_value = <ls_data>-file_content
        ).
        iv_eventid->mo_event_data->get_value(
          EXPORTING
            iv_key   = 'IV_FILE_SIZE'
          IMPORTING
            ev_value = <ls_data>-file_size
        ).
        iv_eventid->mo_event_data->get_value(
          EXPORTING
            iv_key   = 'IV_FILE_SIZE_DESCR'
          IMPORTING
            ev_value = <ls_data>-file_size_descr
        ).


      WHEN 'DELETE_LINE'.
        CHECK iv_raised_by_own_ui EQ abap_true.
        on_delete_line(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


      WHEN 'UNDELETE_LINE'.
        CHECK iv_raised_by_own_ui EQ abap_true.
        on_undelete_line(
          EXPORTING
            iv_eventid                = iv_eventid
            it_selected_fields        = it_selected_fields
            iv_raised_by_own_ui       = iv_raised_by_own_ui
            iv_visible_rows           = iv_visible_rows
            iv_edit_mode              = iv_edit_mode
            io_extended_ctrl          = io_extended_ctrl
          IMPORTING
            et_messages               = et_messages
            ev_data_changed           = ev_data_changed
            ev_field_usage_changed    = ev_field_usage_changed
            ev_action_usage_changed   = ev_action_usage_changed
            ev_selected_lines_changed = ev_selected_lines_changed
            ev_dnd_attr_changed       = ev_dnd_attr_changed
            eo_itab_change_log        = eo_itab_change_log
          CHANGING
            ct_data                   = ct_data
            ct_field_usage            = ct_field_usage
            ct_action_usage           = ct_action_usage
            ct_selected_lines         = ct_selected_lines
            cv_lead_index             = cv_lead_index
            cv_first_visible_row      = cv_first_visible_row
            cs_additional_info        = cs_additional_info
            ct_dnd_attributes         = ct_dnd_attributes
        ).


    ENDCASE.

**********************************************************************
* ui_deleted line
**********************************************************************
    IF io_extended_ctrl IS NOT INITIAL.
      DATA: lt_line_through_rows TYPE if_fpm_list_ats_line_through=>ty_t_rows,
            ls_line_through_rows TYPE if_fpm_list_ats_line_through=>ty_s_rows.
      ASSIGN ct_data TO <lt_data>.
      LOOP AT <lt_data> ASSIGNING <ls_data> WHERE ui_deleted = abap_true.
        ls_line_through_rows-source_index = sy-tabix.
        APPEND ls_line_through_rows TO lt_line_through_rows.
      ENDLOOP.
      io_extended_ctrl->get_line_through_handler( )->set_line_through_rows( lt_line_through_rows ).
    ENDIF.


**********************************************************************
* edit mode control
**********************************************************************
    READ TABLE ct_action_usage INTO ls_action_usage INDEX 1.
    CASE iv_edit_mode.
      WHEN if_fpm_constants=>gc_edit_mode-edit.
        IF ls_action_usage-enabled EQ abap_false.
          ls_action_usage-enabled = abap_true.
          MODIFY ct_action_usage FROM ls_action_usage TRANSPORTING enabled WHERE enabled = abap_false.
          ev_action_usage_changed = abap_true.
          ct_field_usage[ name = if_fpm_guibb_constants=>gc_guibb_row_action_column ]-visibility = if_fpm_constants=>gc_visibility-visible.
          ev_field_usage_changed = abap_true.
        ENDIF.
      WHEN OTHERS.
        IF ls_action_usage-enabled EQ abap_true.
          ls_action_usage-enabled = abap_false.
          MODIFY ct_action_usage FROM ls_action_usage TRANSPORTING enabled WHERE enabled = abap_true.
          ev_action_usage_changed = abap_true.
          ct_field_usage[ name = if_fpm_guibb_constants=>gc_guibb_row_action_column ]-visibility = if_fpm_constants=>gc_visibility-not_visible.
          ev_field_usage_changed = abap_true.
        ENDIF.
    ENDCASE.

  ENDMETHOD.


  METHOD if_fpm_guibb_list~get_default_config.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~get_definition.
    DATA: lt_data              TYPE tt_data,
          lo_rtti              TYPE REF TO cl_abap_structdescr,
          ls_field_description TYPE fpmgb_s_listfield_descr,
          ls_action_definition TYPE fpmgb_s_actiondef,
          ls_row_actions       TYPE fpmgb_s_row_action.

    eo_field_catalog ?= cl_abap_tabledescr=>describe_by_data( lt_data ).
    lo_rtti ?= eo_field_catalog->get_table_line_type( ).

**********************************************************************
* field description
**********************************************************************
    LOOP AT lo_rtti->components INTO DATA(ls_comp).
      CLEAR: ls_field_description.

      ls_field_description-name = ls_comp-name.
      ls_field_description-allow_sort = abap_true.
      ls_field_description-allow_filter = abap_true.

      CASE ls_comp-name.
        WHEN 'UI_SEQ_NO'.
          ls_field_description-null_as_blank = abap_true.
      ENDCASE.

      APPEND ls_field_description TO et_field_description.
    ENDLOOP.


**********************************************************************
* action definition
**********************************************************************
    CLEAR: ls_action_definition.
    ls_action_definition-id = 'NEW_UPLOAD'.
    ls_action_definition-text = TEXT-t01.
    ls_action_definition-imagesrc = '~Icon/NewItem'.
    ls_action_definition-enabled = abap_true.
    APPEND ls_action_definition TO et_action_definition.


**********************************************************************
* row action definition
**********************************************************************
    CLEAR: ls_row_actions.
    ls_row_actions-id = 'DELETE_LINE'.
    ls_row_actions-image_source = '~Icon/Delete'.
    ls_row_actions-enabled_ref = 'UI_DELETED:NOT'.
    APPEND ls_row_actions TO et_row_actions.

    CLEAR: ls_row_actions.
    ls_row_actions-id = 'UNDELETE_LINE'.
    ls_row_actions-image_source = '~Icon/Undo'.
    ls_row_actions-enabled_ref = 'UI_DELETED'.
    APPEND ls_row_actions TO et_row_actions.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~process_event.
  ENDMETHOD.


  METHOD if_fpm_guibb~get_parameter_list.
  ENDMETHOD.


  METHOD if_fpm_guibb~initialize.
  ENDMETHOD.


  METHOD on_cell_action.
    DATA: lo_event       TYPE REF TO cl_fpm_event,
          lv_xstring     TYPE xstring,
          lv_column_name TYPE string,
          lv_index       TYPE i.
    FIELD-SYMBOLS: <lt_data> TYPE tt_data,
                   <ls_data> TYPE ts_data.

    iv_eventid->mo_event_data->get_value(
      EXPORTING
        iv_key   = if_fpm_guibb_list=>gc_event_par_column_name
      IMPORTING
        ev_value = lv_column_name
    ).
    iv_eventid->mo_event_data->get_value(
      EXPORTING
        iv_key   = if_fpm_guibb_list=>gc_event_par_row
      IMPORTING
        ev_value = lv_index
    ).

    ASSIGN ct_data TO <lt_data>.
    READ TABLE <lt_data> ASSIGNING <ls_data> INDEX lv_index.

    CASE lv_column_name.
      WHEN 'FILE_NAME'.
        IF <ls_data>-key1 IS NOT INITIAL.
          " read from DB.
          SELECT SINGLE file_content
            INTO lv_xstring
            FROM zfpm_file_attach
            WHERE key1 = <ls_data>-key1
              AND seq_no = <ls_data>-seq_no.
        ELSE.
          " read from memory.
          lv_xstring = <ls_data>-file_content.
        ENDIF.
        cl_wd_runtime_services=>attach_file_to_response(
          EXPORTING
            i_filename      = <ls_data>-file_name
            i_content       = lv_xstring
            i_mime_type     = 'BIN'
*            i_in_new_window = abap_false
*            i_inplace       = abap_false
        ).


    ENDCASE.

  ENDMETHOD.


  METHOD on_delete_line.
    DATA: lv_index TYPE i.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    ev_data_changed = abap_true.

    iv_eventid->mo_event_data->get_value(
      EXPORTING
        iv_key   = if_fpm_guibb_list=>gc_event_par_row
      IMPORTING
        ev_value = lv_index
    ).

    READ TABLE ct_data ASSIGNING <ls_data> INDEX lv_index.
    IF <ls_data>-key1 IS INITIAL.
      " new item
      DELETE ct_data INDEX lv_index.
      LOOP AT ct_data ASSIGNING <ls_data> FROM lv_index.
        <ls_data>-ui_seq_no = sy-tabix.
      ENDLOOP.
    ELSE.
      " DB item
      <ls_data>-ui_deleted = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD ON_EDIT.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    CLEAR: ct_data.
    ev_data_changed = abap_true.

    IF mv_key1 IS NOT INITIAL.
      SELECT key1 seq_no file_name file_size_descr
        INTO CORRESPONDING FIELDS OF TABLE ct_data
        FROM zfpm_file_attach
        WHERE key1 = mv_key1.
      SORT ct_data BY seq_no.
      LOOP AT ct_data ASSIGNING <ls_data>.
        <ls_data>-ui_seq_no = sy-tabix.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD on_open.
    iv_eventid->mo_event_data->get_value(
      EXPORTING
        iv_key   = 'KEY1'
      IMPORTING
        ev_value = mv_key1
    ).
    on_edit(
      EXPORTING
        iv_eventid                = iv_eventid
        it_selected_fields        = it_selected_fields
        iv_raised_by_own_ui       = iv_raised_by_own_ui
        iv_visible_rows           = iv_visible_rows
        iv_edit_mode              = iv_edit_mode
        io_extended_ctrl          = io_extended_ctrl
      IMPORTING
        et_messages               = et_messages
        ev_data_changed           = ev_data_changed
        ev_field_usage_changed    = ev_field_usage_changed
        ev_action_usage_changed   = ev_action_usage_changed
        ev_selected_lines_changed = ev_selected_lines_changed
        ev_dnd_attr_changed       = ev_dnd_attr_changed
        eo_itab_change_log        = eo_itab_change_log
      CHANGING
        ct_data                   = ct_data
        ct_field_usage            = ct_field_usage
        ct_action_usage           = ct_action_usage
        ct_selected_lines         = ct_selected_lines
        cv_lead_index             = cv_lead_index
        cv_first_visible_row      = cv_first_visible_row
        cs_additional_info        = cs_additional_info
        ct_dnd_attributes         = ct_dnd_attributes
    ).


  ENDMETHOD.


  METHOD ON_SAVE.
    DATA: lt_zfpm_file_attach_ins TYPE TABLE OF zfpm_file_attach,
          lt_zfpm_file_attach_del TYPE TABLE OF zfpm_file_attach,
          ls_zfpm_file_attach     TYPE zfpm_file_attach,
          lv_seq_no               TYPE zfpm_file_attach-seq_no.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    SELECT MAX( seq_no )
      INTO lv_seq_no
      FROM zfpm_file_attach
      WHERE key1 = mv_key1.


    LOOP AT ct_data ASSIGNING <ls_data>.
      IF <ls_data>-ui_deleted EQ abap_true.
        " del
        MOVE-CORRESPONDING <ls_data> TO ls_zfpm_file_attach.
        APPEND ls_zfpm_file_attach TO lt_zfpm_file_attach_del.
      ELSEIF <ls_data>-key1 IS INITIAL.
        " ins
        MOVE-CORRESPONDING <ls_data> TO ls_zfpm_file_attach.
        ls_zfpm_file_attach-key1 = mv_key1.
        lv_seq_no = lv_seq_no + 1.
        ls_zfpm_file_attach-seq_no = lv_seq_no.
        ls_zfpm_file_attach-created_by = sy-uname.
        APPEND ls_zfpm_file_attach TO lt_zfpm_file_attach_ins.
      ENDIF.
    ENDLOOP.

    CHECK: lt_zfpm_file_attach_del IS NOT INITIAL OR lt_zfpm_file_attach_ins IS NOT INITIAL.


    IF lt_zfpm_file_attach_del IS NOT INITIAL.
      DELETE zfpm_file_attach FROM TABLE lt_zfpm_file_attach_del.
    ENDIF.

    IF lt_zfpm_file_attach_ins IS NOT INITIAL.
      INSERT zfpm_file_attach FROM TABLE lt_zfpm_file_attach_ins.
    ENDIF.

    COMMIT WORK.

  ENDMETHOD.


  METHOD on_undelete_line.
    DATA: lv_index TYPE i.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    ev_data_changed = abap_true.

    iv_eventid->mo_event_data->get_value(
      EXPORTING
        iv_key   = if_fpm_guibb_list=>gc_event_par_row
      IMPORTING
        ev_value = lv_index
    ).

    READ TABLE ct_data ASSIGNING <ls_data> INDEX lv_index.
    <ls_data>-ui_deleted = abap_false.

  ENDMETHOD.
ENDCLASS.
