set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>2842267200095235
);
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(4752724250197104)
,p_name=>'com.oracle.skunkworks.apexlens'
);
 
end;
/
prompt --application/restful_services/com_oracle_skunkworks_apexlens
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(4752724250197104)
,p_name=>'com.oracle.skunkworks.apexlens'
,p_uri_prefix=>'rest/'
,p_parsing_schema=>'AL'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>60
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(6667711531644669)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'data/{uuid}/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(6667834740647246)
,p_template_id=>wwv_flow_api.id(6667711531644669)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  al_data.get(:uuid,:id);',
'end;'))
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(6667973813652519)
,p_template_id=>wwv_flow_api.id(6667711531644669)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  al_data.post(:uuid,:id,:body);',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(5624978300949415)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'install'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(5625090965952141)
,p_template_id=>wwv_flow_api.id(5624978300949415)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  al_render.install;',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(5625164208954886)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'manifest'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(5625219559956827)
,p_template_id=>wwv_flow_api.id(5625164208954886)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  al_render.manifest;',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(6435405562769033)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'r/{control_id}/{file_name}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(6435577937775851)
,p_template_id=>wwv_flow_api.id(6435405562769033)
,p_source_type=>'MEDIA'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mime_type,blob_content',
'from al_control_resources',
'where file_name = :file_name',
'and control_id = :control_id'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(4902008510303608)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'static/{file_name}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(4902131375305546)
,p_template_id=>wwv_flow_api.id(4902008510303608)
,p_source_type=>'MEDIA'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mime_type,file_content',
'from al_static_files',
'where file_name = :file_name',
'or directory_name||''/''||file_name = :file_name'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(4752859519197106)
,p_module_id=>wwv_flow_api.id(4752724250197104)
,p_uri_template=>'viewer/{uuid}/{session_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(4762065944200885)
,p_template_id=>wwv_flow_api.id(4752859519197106)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  al_render.viewer(:uuid,:session_id);',
'end;'))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
