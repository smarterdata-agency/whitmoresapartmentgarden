with ads_insights_platform as (

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
cpc,
cpm,
reach,
impressions,
##engagement_rate_ranking,
inline_link_clicks


 FROM `stitch007.fb_wag.ads_insights_platform_and_device`

)

Select

date,
objective,
campaign_name,
adset_name,
ad_name,
campaign_id,
adset_id,
ad_id,
sum(spend) spend,
avg(cpc) cpc,
avg(cpm) cpm,
avg(frequency) frequency,
sum(reach) reach,
sum(impressions) impressions,
sum(inline_link_clicks) inline_link_clicks

FROM ads_insights_platform
GROUP BY  date, objective,campaign_name,adset_name,ad_name,campaign_id,adset_id,ad_id
ORDER BY date DESC