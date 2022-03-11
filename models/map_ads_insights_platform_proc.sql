SELECT  

date_start as date,
objective,
campaign_name,
adset_name,
ad_name,
campaign_id,
adset_id,
ad_id,
spend,
frequency,
spend,
cpc,
cpm,
reach,
impressions,
##engagement_rate_ranking,
inline_link_clicks,
value.action_type as action,
value._7d_click as actions 


 FROM `stitch007.fb_wag.ads_insights_platform_and_device`,
 unnest(actions) as action

