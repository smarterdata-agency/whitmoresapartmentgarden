SELECT * FROM (

SELECT 
date,
campaign_id,
adset_id,
ad_id,
action,
sum(action_values) as action_values
FROM {{ ref('smarter-data-agency-pipeline.development.map_ads_insights_conversions_proc') }}
GROUP BY date, campaign_id, adset_id, ad_id, action
)
PIVOT
(
SUM(action_values) as action_values
FOR action IN ('post_reaction','page_engagement','post_engagement')

)
