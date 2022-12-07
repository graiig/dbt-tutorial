with fact_hot_operations as (
    select OPERA_ID, 
	OPERA_BOD_BPCLS_ID  as bpcsl_id,
	OPERA_GENER_BLCHA_ID  as blcha_id,
	OPERA_USER_IDENTIFIER  as user_identifier,
	OPERA_BOD_USTYP_ID  as ustyp_id,
	OPERA_GENER_JOBRO_ID__END_USER_PROVIDER as provider_id ,
	OPERA_GENER_JOBRO_ID__BILLING_PROVIDER as billing_provider_id,
	OPERA_CLIENT_SESSION_ID  as client_session_id,
	OPERA_BILLING_PROVIDER_SESSION_ID  as billing_provider_session_id,
	OPERA_BOD_OPTYP_ID as optyp_id,
	OPERA_BOD_OPSTA_ID as opsta_id,
	OPERA_INSTA_ID as insta_id,
	OPERA_GENER_CNTRY_ID as country_id,
	OPERA_BOD_KINEM_ID as kinem_id,
	OPERA_DATA as data,
	OPERA_BOD_CLSRV_ID as clsrv_id,
	OPERA_ERO_BPSRV_ID as bpsrv_id,
	OPERA_GENER_ODCHA_ID as odcha_id,
	OPERA_GENER_NETCH_ID as netch_id,
	OPERA_OPERATION_DATE_TZ as operation_date_tz,
	OPERA_FINAL_DATE_TZ as final_date_tz,
	cast(OPERA_OPERATION_DATE_TZ as date) as operation_date,
	cast(OPERA_FINAL_DATE_TZ as date) as final_date
    from {{ ref('stg_hot_operations')}}
)

select * from fact_hot_operations