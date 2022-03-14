
with ads_insights_platform_conversions as (

SELECT  

date_start as date,
campaign_id,
campaign_name,
adset_id,
ad_id,
value.action_type as action,
value._7d_click as action_values
 FROM `stitch007.fb_wag.ads_insights_platform_and_device`,
UNNEST(actions) as actions


)

SELECT 
date,
campaign_id,
campaign_name,
adset_id,
ad_id,
action,
sum(action_values) as action_values


from ads_insights_platform_conversions
group by date,campaign_id, adset_id, ad_id, action
order by date desc


