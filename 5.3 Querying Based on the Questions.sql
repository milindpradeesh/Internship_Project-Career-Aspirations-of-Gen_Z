#1 What is the gender distribution of respondents from India
SELECT 
	gender,
	COUNT(*) AS gender_distribution 
FROM career_aspirations 
WHERE current_country = "India"
GROUP BY gender
ORDER BY gender_distribution DESC;
----------------------------------------------------------------------------------------------------------------------------
#2 What percentage of respondents from india are interested in education abroad with sponsership? 
SELECT
	 pursue_higher_education_outside_india as higher_edu_abroad,
	(COUNT(*)/(SELECT COUNT(*) FROM career_aspirations
 WHERE current_country ="India"))*100 as higher_edu_percentage
FROM career_aspirations
WHERE current_country = "India"
GROUP BY higher_edu_abroad
ORDER BY higher_edu_percentage DESC;
--------------------------------------------------------------------------------------------------------------------------------------
#3 What are the 6 top influences on career aspirations for respondents in India?
WITH RankedInfluences AS (
  SELECT 
      career_influence_factors,
      COUNT(*) AS career_influence_count,
      RANK() OVER (ORDER BY COUNT(*) DESC) AS career_influence_rank
  FROM career_aspirations
  WHERE current_country = "India"
  GROUP BY career_influence_factors
)
SELECT *
FROM RankedInfluences
WHERE career_influence_rank <= 6;
------------------------------------------------------------------------------------------------------------------------------------------
#4  How do career aspiration influences vary by gender in India?
SELECT 
    career_influence_factors,
    (COUNT(CASE WHEN gender = 'Male' THEN 1 END) /
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Male')) * 100 
    AS male_percentage,
    (COUNT(CASE WHEN gender = 'Female' THEN 1 END) / 
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Female')) * 100
    AS female_percentage,
    (COUNT(CASE WHEN gender = 'Transgender' THEN 1 END) / 
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Transgender')) * 100
    AS transgender_percentage,
    (COUNT(CASE WHEN gender = 'Other' THEN 1 END) /
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Other')) * 100
    AS other_percentage
FROM career_aspirations
WHERE current_country = 'India'
GROUP BY career_influence_factors
ORDER BY career_influence_factors ;
------------------------------------------------------------------------------------------------------------------------------------
#5 What percentage of respondents are willing to work for a company for at least 3 years?
SELECT 
	work_for_one_employer_for_3_years_or_more as one_employer,
    COUNT(*)*100/ (SELECT COUNT(*) FROM career_aspirations
WHERE current_country ="India") as career_aspirants_percentage
FROM career_aspirations
WHERE current_country ="India"
GROUP BY one_employer
ORDER BY career_aspirants_percentage DESC;
-------------------------------------------------------------------------------------------------------------------
#6 How many respondents prefer to work for socially impactful companies?
SELECT
	mission_no_social_impact, 
	COUNT(*) as No_of_respondents
FROM career_aspirations
WHERE current_country ="India"
GROUP BY mission_no_social_impact
ORDER BY mission_no_social_impact DESC;
----------------------------------------------------------------------------------------------------------------------------
#7 How does the preference for socially impactful companies vary by gender?
SELECT 
	mission_no_social_impact,
    (COUNT(CASE WHEN gender = 'Male' THEN 1 END) /
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Male')) * 100
    AS male_percentage,
     (COUNT(CASE WHEN gender = 'Female' THEN 1 END) / 
     (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Female')) * 100
     AS female_percentage,
    (COUNT(CASE WHEN gender = 'Transgender' THEN 1 END) / 
    (SELECT COUNT(*) FROM career_aspirations 
    WHERE current_country = 'India' AND gender = 'Transgender')) * 100 
    AS transgender_percentage,
    (COUNT(CASE WHEN gender = 'Other' THEN 1 END) / 
    (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India' AND gender = 'Other')) * 100
    AS other_percentage
FROM career_aspirations
WHERE current_country ="India"
GROUP BY mission_no_social_impact
ORDER BY mission_no_social_impact;
-----------------------------------------------------------------------------------------------------------------------------
#8 What is the distribution of minimum expected salary in the first three years among respondents?
SELECT
	min_salary_first_3_years,
	COUNT(*) as min_salary
FROM career_aspirations
WHERE current_country ="India"
GROUP BY min_salary_first_3_years
ORDER BY min_salary DESC;
--------------------------------------------------------------------------------------------------------------------
#9 What is the expected minimum monthly salary in hand?
SELECT
	min_starting_salary_expectation as min_salary,
    COUNT(*) as min_salary_count
FROM career_aspirations
WHERE current_country ="India"
GROUP BY min_salary
ORDER by min_salary_count DESC;
---------------------------------------------------------------------------------------------------------------------------------
#10 What percentage of respondents prefer remote working?
SELECT
    preferred_working_environment,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = 'India')) AS percentage_we
FROM career_aspirations
WHERE current_country = 'India'
GROUP BY preferred_working_environment
ORDER BY percentage_we DESC;
-------------------------------------------------------------------------------------------------------------------------------------
#11 What is the preferred number of daily work hours?
SELECT 
    hours_willing_to_work_daily AS hrs_willing,
    COUNT(*)  AS hrs_willing
FROM career_aspirations
WHERE current_country = 'India'
GROUP BY hours_willing_to_work_daily
ORDER BY hrs_willing DESC;
-----------------------------------------------------------------------------------------------------------------------------------------
#12  What are the common work frustrations among respondents?
SELECT 
	frustrate_at_work,
    COUNT(*) as frust_num
FROM career_aspirations
WHERE current_country ="India"
GROUP BY frustrate_at_work
ORDER BY frust_num DESC;
---------------------------------------------------------------------------------------------------------------------------------------
#13 How does the need for work-life balance interventions vary by gender?
SELECT
    full_week_break_frequency,
    (COUNT(CASE WHEN gender = 'Male' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Male')) AS male_percentage,
     
    (COUNT(CASE WHEN gender = 'Female' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Female')) AS female_percentage,
     
    (COUNT(CASE WHEN gender = 'Transgender' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Transgender')) AS transgender_percentage,
     
    (COUNT(CASE WHEN gender = 'Other' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Other')) AS other_percentage
FROM career_aspirations
WHERE current_country = 'India'
GROUP BY full_week_break_frequency
ORDER BY full_week_break_frequency;
--------------------------------------------------------------------------------------------------------------------------------------------
#14 How many respondents are willing to work under an abusive manager?
SELECT
	manager_abusive_language,
    COUNT(*) as abusive_count
FROM career_aspirations
WHERE current_country ="India"
GROUP BY manager_abusive_language
ORDER BY abusive_count DESC
----------------------------------------------------------------------------------------------------------------------------------------------------
#15 What is the distribution of minimum expected salary after five years?
SELECT
	min_salary_after_5_years,
    COUNT(*) as min_sal_count
FROM career_aspirations
WHERE current_country ="India"
GROUP BY min_salary_after_5_years
ORDER BY min_sal_count DESC;
----------------------------------------------------------------------------------------------------------------------------------------
#16 What are the remote working preferences by gender?
SELECT 
	company_no_remote_policy as remote_pref,
     (COUNT(CASE WHEN gender = 'Male' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Male')) AS male_percentage,
     
    (COUNT(CASE WHEN gender = 'Female' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Female')) AS female_percentage,
     
    (COUNT(CASE WHEN gender = 'Transgender' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Transgender')) AS transgender_percentage,
     
    (COUNT(CASE WHEN gender = 'Other' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Other')) AS other_percentage
   FROM career_aspirations
   WHERE current_country ="India"
   GROUP BY remote_pref
   ORDER BY remote_pref;
   ---------------------------------------------------------------------------------------------------------------------------------------
#17 What are the top work frustrations for each gender?
SELECT 
	frustrate_at_work,
      (COUNT(CASE WHEN gender = 'Male' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Male')) AS male_percentage,
     
    (COUNT(CASE WHEN gender = 'Female' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Female')) AS female_percentage,
     
    (COUNT(CASE WHEN gender = 'Transgender' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Transgender')) AS transgender_percentage,
     
    (COUNT(CASE WHEN gender = 'Other' THEN 1 END) * 100.0 / 
    (SELECT COUNT(*) FROM career_aspirations 
     WHERE current_country = 'India' AND gender = 'Other')) AS other_percentage
FROM career_aspirations
WHERE current_country ="India"
GROUP BY frustrate_at_work
ORDER BY frustrate_at_work;
-------------------------------------------------------------------------------------------------------------------------------------------
#18 What factors boost work happiness and productivity for respondents?
SELECT
	happier_and_more_productive_at_work as prod_inc,
    COUNT(*) as prod_dist
FROM career_aspirations
WHERE current_country ="India"
GROUP BY prod_inc
ORDER BY prod_dist DESC;
-------------------------------------------------------------------------------------------------------------------------------------
#19 What percentage of respondents need sponsership for education abroad?
SELECT
    pursue_higher_education_outside_india AS high_edu,
    (COUNT(*) / (SELECT COUNT(*) FROM career_aspirations
    WHERE current_country = "India")) * 100 AS high_edu_percentage
FROM career_aspirations
WHERE current_country = "India"
GROUP BY high_edu
ORDER BY high_edu_percentage DESC;
---------------------------------------------------------------------------------------------------------------------

