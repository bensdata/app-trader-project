-- The group is still trying to decide on the final criteria for app recommendations. Specifically, the review count range to target. 

-- Aliases:
--		ios = app_store
-- 		droid = play_store
--		total_rc = 



SELECT distinct(ios.name), ios.rating, droid.rating, (ios.review_count::integer + droid.review_count) AS total_rc, ios.primary_genre
FROM app_store_apps AS ios
INNER JOIN play_store_apps AS droid
ON ios.name = droid.name
group by ios.name, ios.rating, total_rc, droid.rating, ios.price, ios.primary_genre
HAVING ios.price <= 1 
AND (ios.review_count::integer + droid.review_count)< 100000
order by ios.rating desc, total_rc asc;

