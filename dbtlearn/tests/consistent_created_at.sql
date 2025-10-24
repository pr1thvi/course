SELECT review_date 
FROM {{ ref('fct_reviews' )}} r
JOIN {{ ref('dim_listings_cleansed') }} l
USING(listing_id)
WHERE l.created_at >= r.review_date