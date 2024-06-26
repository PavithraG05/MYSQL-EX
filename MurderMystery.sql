-- The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​
SELECT * FROM crime_scene_report WHERE type='murder' and city='SQL City' and date=20180115;

-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave"
SELECT * FROM person where address_street_name ='Franklin Ave' AND name LIKE'Annabel%';

-- 16371 Annabel Miller 490173
SELECT * FROM drivers_license WHERE id = 490173;


SELECT * FROM person where address_street_name ='Northwestern Dr' ORDER BY address_number;

-- 14887 Morty Schapiro 118009
SELECT * FROM drivers_license WHERE id = 118009;

SELECT * FROM facebook_event_checkin WHERE person_id=16371;
SELECT * FROM facebook_event_checkin WHERE person_id=14887;

SELECT * FROM interview WHERE person_id=14887;
-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
-- The membership number on the bag started with "48Z". 
-- Only gold members have those bags. 
-- The man got into a car with a plate that included "H42W".

SELECT * FROM interview WHERE person_id=16371;
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_member WHERE person_id=16371;
-- 90081

SELECT * FROM get_fit_now_check_in WHERE check_in_date=20180109 AND membership_id = 90081;

SELECT * FROM get_fit_now_check_in WHERE check_in_date=20180109 AND check_in_time <= 1600 AND check_out_time >= 1700 ;
-- 48Z7A 48Z55

SELECT * FROM get_fit_now_member WHERE id='48Z7A' OR id ='48Z55'  ;
-- 67318 Jeremy Bowers 423327 (LIC)
-- 28819 Joe Germuska 173289 (LIC)

SELECT * FROM drivers_license WHERE id = 173289 or id = 423327;

SELECT * FROM interview WHERE person_id = 67318;
-- I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT *, COUNT(*) FROM facebook_event_checkin WHERE event_name LIKE '%SQL Symphony Concert%' and date between 20171201 and 20171231 group by person_id;

-- 24556	99716

SELECT * FROM drivers_license WHERE id IN(SELECT license_id FROM person WHERE id=24556 or id=99716);
-- Tesla model s
-- Miranda Priestly

SELECT * FROM person where license_id = 202298
