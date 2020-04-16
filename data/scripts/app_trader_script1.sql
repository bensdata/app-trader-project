-- The group is still trying to decide on the final criteria for app recommendations. Specifically, the review count range to target. 

-- Aliases:
--		ios = app_store
-- 		droid = play_store
--		total_rc = 


-- SELECT distinct(ios.name), ios.rating, droid.rating, (ios.review_count::integer + droid.review_count) AS total_rc, ios.primary_genre, ios.content_rating
-- FROM app_store_apps AS ios
-- INNER JOIN play_store_apps AS droid
-- ON ios.name = droid.name
-- group by ios.name, ios.rating, total_rc, droid.rating, ios.price, ios.primary_genre, ios.content_rating
-- HAVING ios.price <= 1 
-- AND (ios.review_count::integer + droid.review_count) < 100000
-- order by ios.rating desc, total_rc asc;



-- How many genres?

-- App list of names sorted by weighted rating. Aspirational: have this display the categories instead of names. Use below as CTE and then query for stuff: 

-- select primary_genre, ios.name,  ios.review_count, droid.review_count, ios.rating as ios, droid.rating as droid, 
-- 	ROUND((ios.rating*(ios.review_count::numeric/(ios.review_count::numeric + droid.review_count)) + droid.rating* (droid.review_count/(ios.review_count::numeric + droid.review_count))),2) as weight_rating
-- from app_store_apps as ios inner join play_store_apps as droid
-- using (name)
-- group by primary_genre, ios.name, ios.review_count, droid.review_count,ios.rating, droid.rating
-- order by weight_rating desc

-- weighted calculation: [(ios.rating*(ios_rc/total_rc)) + (droid.rating*(droid_rc/total_rc))]/ 2

 




