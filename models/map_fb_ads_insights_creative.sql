SELECT  

date,
objective,
campaign_name,
adset_name,
ad_name,
campaign_id,
adset_id,
ad_id,
body,
image_url,
spend,
frequency,
cpc,
cpm,
reach,
impressions,
##engagement_rate_ranking,
inline_link_clicks,
action,
actions

FROM
{{ ref('map_ads_insights_platform_proc') }}
LEFT  JOIN
{{ ref('map_facebook_creative_proc') }}
ON ad_id=id
