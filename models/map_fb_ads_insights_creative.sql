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
{{ ref('map_ads_id_creative_id_proc') }}
ON ad_id=ads_table_id
LEFT JOIN
{{ ref('map_facebook_creative_proc') }}
ON ads_table_id=creative_id
