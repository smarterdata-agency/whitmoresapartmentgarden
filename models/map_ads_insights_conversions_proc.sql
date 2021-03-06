
with ads_insights_platform_conversions as (

SELECT  

date_start as date,
campaign_id,
adset_id,
ad_id,
campaign_name,
adset_name,
ad_name,

value.action_type as action,
value._7d_click as action_values
 FROM `stitch007.fb_wag.ads_insights_platform_and_device`,
UNNEST(actions) as actions


)

SELECT 
date,
campaign_id,
adset_id,
ad_id,
campaign_name,
adset_name,
ad_name,
action,
sum(action_values) as action_values


from ads_insights_platform_conversions
group by date,campaign_id, adset_id, ad_id, action, campaign_name, adset_name, ad_name
order by date desc


