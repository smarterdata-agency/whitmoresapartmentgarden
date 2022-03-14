SELECT * FROM (

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
FROM {{ ref('map_ads_insights_conversions_proc') }}
GROUP BY date, campaign_id, adset_id, ad_id, action
)
PIVOT
(
SUM(action_values) as action_values
FOR action IN ('post_reaction','page_engagement','post_engagement')

)
