CLASS zcl_list_fpm_file_attach DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_fpm_guibb .
    INTERFACES if_fpm_guibb_list .

    TYPES:
      BEGIN OF ts_data.
        INCLUDE TYPE zfpmt_file.
    TYPES:
        ui_deleted TYPE flag,
        ui_seq_no  TYPE dms_doc_index,
      END OF ts_data .
    TYPES:
      tt_data TYPE TABLE OF ts_data .
  PROTECTED SECTION.

    DATA mv_key1 TYPE zfpmt_file-key1 .

    METHODS readme .
    METHODS on_open
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_edit
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_cell_action
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_save
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_delete_line
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_undelete_line
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
    METHODS on_download_zip
      IMPORTING
        !iv_eventid                TYPE REF TO cl_fpm_event
        !it_selected_fields        TYPE fpmgb_t_selected_fields
        !iv_raised_by_own_ui       TYPE boole_d
        !iv_visible_rows           TYPE i
        !iv_edit_mode              TYPE fpm_edit_mode
        !io_extended_ctrl          TYPE REF TO if_fpm_list_ats_ext_ctrl
      EXPORTING
        !et_messages               TYPE fpmgb_t_messages
        !ev_data_changed           TYPE boole_d
        !ev_field_usage_changed    TYPE boole_d
        !ev_action_usage_changed   TYPE boole_d
        !ev_selected_lines_changed TYPE boole_d
        !ev_dnd_attr_changed       TYPE boole_d
        !eo_itab_change_log        TYPE REF TO if_salv_itab_change_log
      CHANGING
        !ct_data                   TYPE tt_data
        !ct_field_usage            TYPE fpmgb_t_fieldusage
        !ct_action_usage           TYPE fpmgb_t_actionusage
        !ct_selected_lines         TYPE rstabixtab
        !cv_lead_index             TYPE sytabix
        !cv_first_visible_row      TYPE i
        !cs_additional_info        TYPE fpmgb_s_additional_info
        !ct_dnd_attributes         TYPE fpmgb_t_dnd_definition .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LIST_FPM_FILE_ATTACH IMPLEMENTATION.


  METHOD if_fpm_guibb_list~check_config.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~flush.
  ENDMETHOD.


  METHOD if_fpm_guibb_list~get_data.
    DATA: lo_event        TYPE REF TO cl_fpm_event,
          ls_field_usage  TYPE fpmgb_s_fieldusage,
          ls_action_usage	TYPE fpmgb_s_actionusage,
          lv_index        TYPE i.
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
        iv_eventid->mo_event_data->get_value(
          EXPORTING
            iv_key   = 'IV_FILE_TYPE'
          IMPORTING
            ev_value = <ls_data>-file_type
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


      WHEN 'DOWNLOAD_ZIP'.
        CHECK iv_raised_by_own_ui EQ abap_true.
        on_download_zip(
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
    READ TABLE ct_action_usage INTO ls_action_usage WITH KEY id = 'NEW_UPLOAD'.
    lv_index = sy-tabix.
    CASE iv_edit_mode.
      WHEN if_fpm_constants=>gc_edit_mode-edit.
        IF ls_action_usage-enabled EQ abap_false.
          ls_action_usage-enabled = abap_true.
          MODIFY ct_action_usage FROM ls_action_usage INDEX lv_index.
          ev_action_usage_changed = abap_true.
          ct_field_usage[ name = if_fpm_guibb_constants=>gc_guibb_row_action_column ]-visibility = if_fpm_constants=>gc_visibility-visible.
          ev_field_usage_changed = abap_true.
        ENDIF.
      WHEN OTHERS.
        IF ls_action_usage-enabled EQ abap_true.
          ls_action_usage-enabled = abap_false.
          MODIFY ct_action_usage FROM ls_action_usage INDEX lv_index.
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

    CLEAR: ls_action_definition.
    ls_action_definition-id = 'DOWNLOAD_ZIP'.
    ls_action_definition-text = TEXT-t02.
    ls_action_definition-imagesrc = '~Icon/Download'.
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
    FIELD-SYMBOLS: <ls_data> TYPE ts_data,
                   <lv_data> TYPE data.

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

    READ TABLE ct_data ASSIGNING <ls_data> INDEX lv_index.

    CASE lv_column_name.
      WHEN 'FILE_NAME'.
        IF <ls_data>-key1 IS NOT INITIAL.
          " read from DB.
          SELECT SINGLE file_content
            INTO lv_xstring
            FROM zfpmt_file
            WHERE key1 = <ls_data>-key1
              AND seq_no = <ls_data>-seq_no.
          ASSIGN lv_xstring TO <lv_data>.
        ELSE.
          " read from memory.
          ASSIGN <ls_data>-file_content TO <lv_data>.
        ENDIF.
        cl_wd_runtime_services=>attach_file_to_response(
          EXPORTING
            i_filename      = <ls_data>-file_name
            i_content       = <lv_data>
            i_mime_type     = CONV #( <ls_data>-file_type )
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


  METHOD on_edit.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    CLEAR: ct_data.
    ev_data_changed = abap_true.

    IF mv_key1 IS NOT INITIAL.
      SELECT key1 seq_no file_name file_size file_size_descr file_type created_by created_on
        INTO CORRESPONDING FIELDS OF TABLE ct_data
        FROM zfpmt_file
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


  METHOD on_save.
    DATA: lt_zfpmt_file_ins TYPE TABLE OF zfpmt_file,
          lt_zfpmt_file_del TYPE TABLE OF zfpmt_file,
          ls_zfpmt_file     TYPE zfpmt_file,
          lv_seq_no         TYPE zfpmt_file-seq_no.
    FIELD-SYMBOLS: <ls_data> TYPE ts_data.

    SELECT MAX( seq_no )
      INTO lv_seq_no
      FROM zfpmt_file
      WHERE key1 = mv_key1.


    LOOP AT ct_data ASSIGNING <ls_data>.
      IF <ls_data>-ui_deleted EQ abap_true.
        " del
        MOVE-CORRESPONDING <ls_data> TO ls_zfpmt_file.
        APPEND ls_zfpmt_file TO lt_zfpmt_file_del.
      ELSEIF <ls_data>-key1 IS INITIAL.
        " ins
        MOVE-CORRESPONDING <ls_data> TO ls_zfpmt_file.
        ls_zfpmt_file-key1 = mv_key1.
        lv_seq_no = lv_seq_no + 1.
        ls_zfpmt_file-seq_no = lv_seq_no.
        ls_zfpmt_file-created_by = sy-uname.
        GET TIME STAMP FIELD ls_zfpmt_file-created_on.
        APPEND ls_zfpmt_file TO lt_zfpmt_file_ins.
      ENDIF.
    ENDLOOP.

    CHECK: lt_zfpmt_file_del IS NOT INITIAL OR lt_zfpmt_file_ins IS NOT INITIAL.


    IF lt_zfpmt_file_del IS NOT INITIAL.
      DELETE zfpmt_file FROM TABLE lt_zfpmt_file_del.
    ENDIF.

    IF lt_zfpmt_file_ins IS NOT INITIAL.
      INSERT zfpmt_file FROM TABLE lt_zfpmt_file_ins.
    ENDIF.

    COMMIT WORK.

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


  METHOD on_download_zip.
    DATA: lt_zfpmt_file TYPE TABLE OF zfpmt_file,
          lo_zip        TYPE REF TO cl_abap_zip,
          lv_zip        TYPE xstring.
    FIELD-SYMBOLS: <ls_data>       TYPE ts_data,
                   <lv_data>       TYPE data,
                   <ls_zfpmt_file> TYPE zfpmt_file.


    CREATE OBJECT lo_zip.

    SELECT *
      INTO TABLE lt_zfpmt_file
      FROM zfpmt_file
      WHERE key1 = mv_key1.
    SORT lt_zfpmt_file BY seq_no.

    LOOP AT ct_data ASSIGNING <ls_data> WHERE ui_deleted = abap_false.
      IF <ls_data>-seq_no IS NOT INITIAL.
        " read from DB.
        READ TABLE lt_zfpmt_file ASSIGNING <ls_zfpmt_file> WITH KEY seq_no = <ls_data>-seq_no BINARY SEARCH.
        ASSIGN <ls_zfpmt_file>-file_content TO <lv_data>.
      ELSE.
        " read from memory.
        ASSIGN <ls_data>-file_content TO <lv_data>.
      ENDIF.
      lo_zip->add(
        EXPORTING
          name           = <ls_data>-file_name
          content        = <lv_data>
      ).
    ENDLOOP.

    lv_zip = lo_zip->save( ).

    cl_wd_runtime_services=>attach_file_to_response(
      EXPORTING
        i_filename      = |{ mv_key1 }_{ sy-datum }.zip|
        i_content       = lv_zip
        i_mime_type     = 'BIN'
    ).


  ENDMETHOD.


  METHOD readme.
* https://github.com/boy0korea/ZFPM_FILE_ATTACH
  ENDMETHOD.
ENDCLASS.
