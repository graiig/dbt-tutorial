with dim_instance as (
    select INSTA_ID,
	INSTA_BOD_CLSUB_ID as clsub_id,
	INSTA_EXTERNAL_ID  as external_id,
	INSTA_USER_IDENTIFIER as user_identifier,
	INSTA_BOD_USTYP_ID as ustyp_id,
	INSTA_GENER_JOBRO_ID__END_USER_PROVIDER as provider_id,
	INSTA_GENER_BLCHA_ID as blcha_id,
	INSTA_SUB_DATE_TZ as sub_date_tz,
	INSTA_UNSUB_DATE_TZ as unsub_date_tz,
	cast(INSTA_SUB_DATE_TZ as date) as sub_date,
	cast(INSTA_UNSUB_DATE_TZ as date) as  unsub_date,
	INSTA_GENER_UNCHA_ID as uncha_id
     from {{ ref('stg_instance')}}
)

select * from dim_instance