SELECT  

a.date,
objective,
a.campaign_name,
a.adset_name,
a.ad_name,
a.campaign_id,
a.adset_id,
a.ad_id,
ads_table_id,
body,
image_url,
spend,
frequency,
cpc,
cpm,
reach,
impressions,
inline_link_clicks,
action_values_post_reaction,
action_values_page_engagement,
action_values_post_engagement



FROM {{ ref('map_ads_insights_platform_no_conv_proc') }} a
LEFT JOIN 
{{ ref('map_ads_id_creative_id_proc') }}  b

ON ad_id=ads_table_id

LEFT JOIN

{{ ref('map_facebook_creative_proc') }}  c
ON creative_id=ads_table_creative_id

LEFT JOIN {{ ref('map_facebook_conversion_pivot') }}  d

ON (a.campaign_id=d.campaign_id and a.ad_id=d.ad_id and a.date=d.date)







