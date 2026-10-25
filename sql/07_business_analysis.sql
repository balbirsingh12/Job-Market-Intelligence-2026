USE job_market_intelligence;


-- =========================================================
-- 1. JOB CATEGORIES
-- Find the most common job categories
-- =========================================================

SELECT
    job_category,
    COUNT(*) AS total_jobs
FROM vacancies
GROUP BY job_category
ORDER BY total_jobs DESC;


-- =========================================================
-- 2. MOST DEMANDED SKILLS
-- Find the top 15 skills requested by employers
-- =========================================================

SELECT
    s.name AS skill,
    COUNT(*) AS demand_count
FROM vacancy_skills vs
JOIN skills s
    ON vs.skill_id = s.id
GROUP BY s.name
ORDER BY demand_count DESC
LIMIT 15;


-- =========================================================
-- 3. TOP COMPANIES
-- Find companies with the most vacancies
-- =========================================================

SELECT
    company,
    COUNT(*) AS total_jobs
FROM vacancies
WHERE company IS NOT NULL
  AND company <> ''
  AND company <> 'Unknown'
GROUP BY company
ORDER BY total_jobs DESC
LIMIT 15;


-- =========================================================
-- 4. TOP JOB LOCATIONS
-- Find locations with the highest number of vacancies
-- =========================================================

SELECT
    location,
    COUNT(*) AS total_jobs
FROM vacancies
WHERE location IS NOT NULL
  AND location <> ''
  AND location <> 'Unknown'
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 15;


-- =========================================================
-- 5. EXPERIENCE LEVEL ANALYSIS
-- Analyze vacancies by experience level
-- =========================================================

SELECT
    experience_level,
    COUNT(*) AS total_jobs
FROM vacancies
WHERE experience_level IS NOT NULL
  AND experience_level <> ''
GROUP BY experience_level
ORDER BY total_jobs DESC;


-- =========================================================
-- 6. ENTRY-LEVEL SKILLS
-- Find the most demanded skills for entry-level jobs
-- =========================================================

SELECT
    s.name AS skill,
    COUNT(*) AS demand_count
FROM vacancy_skills vs
JOIN vacancies v
    ON vs.vacancy_id = v.id
JOIN skills s
    ON vs.skill_id = s.id
WHERE v.experience_level = 'Entry level'
GROUP BY s.name
ORDER BY demand_count DESC
LIMIT 15;


-- =========================================================
-- 7. ENTRY-LEVEL VS SENIOR SKILLS
-- Compare skill requirements between entry and senior roles
-- =========================================================

WITH skill_demand AS (
    SELECT
        v.experience_level,
        s.name AS skill,
        COUNT(*) AS demand_count,
        ROW_NUMBER() OVER (
            PARTITION BY v.experience_level
            ORDER BY COUNT(*) DESC
        ) AS skill_rank
    FROM vacancy_skills vs
    JOIN vacancies v
        ON vs.vacancy_id = v.id
    JOIN skills s
        ON vs.skill_id = s.id
    WHERE v.experience_level IN ('Entry level', 'Senior')
    GROUP BY v.experience_level, s.name
)
SELECT
    experience_level,
    skill_rank,
    skill,
    demand_count
FROM skill_demand
WHERE skill_rank <= 10
ORDER BY experience_level, skill_rank;


-- =========================================================
-- 8. COMMON SKILL COMBINATIONS
-- Find skills that frequently appear together
-- =========================================================

SELECT
    s1.name AS skill_1,
    s2.name AS skill_2,
    COUNT(*) AS jobs_together
FROM vacancy_skills vs1
JOIN vacancy_skills vs2
    ON vs1.vacancy_id = vs2.vacancy_id
    AND vs1.skill_id < vs2.skill_id
JOIN skills s1
    ON vs1.skill_id = s1.id
JOIN skills s2
    ON vs2.skill_id = s2.id
GROUP BY s1.name, s2.name
ORDER BY jobs_together DESC
LIMIT 15;


-- =========================================================
-- 9. DATA ANALYST JOBS BY LOCATION
-- Focus specifically on Data Analyst-related roles
-- =========================================================

SELECT
    location,
    COUNT(*) AS total_data_analyst_jobs
FROM vacancies
WHERE job_category IN (
    'Data Analyst',
    'Senior Data Analyst',
    'Junior Data Analyst',
    'Data Analyst Intern'
)
AND location IS NOT NULL
AND location <> ''
AND location <> 'Unknown'
GROUP BY location
ORDER BY total_data_analyst_jobs DESC
LIMIT 15;


-- =========================================================
-- 10. CORE DATA ANALYST SKILLS
-- Compare Python, SQL, Excel, Power BI, Tableau and R
-- =========================================================

SELECT
    s.name AS skill,
    COUNT(DISTINCT vs.vacancy_id) AS job_count
FROM vacancy_skills vs
JOIN skills s
    ON vs.skill_id = s.id
WHERE LOWER(s.name) IN (
    'python',
    'sql',
    'excel',
    'power bi',
    'tableau',
    'r'
)
GROUP BY s.name
ORDER BY job_count DESC;


-- =========================================================
-- 11. JOBS REQUIRING MULTIPLE SKILLS
-- Find jobs requiring 10 or more different skills
-- =========================================================

SELECT
    v.id AS vacancy_id,
    v.title,
    v.company,
    COUNT(DISTINCT vs.skill_id) AS number_of_skills
FROM vacancies v
JOIN vacancy_skills vs
    ON v.id = vs.vacancy_id
GROUP BY
    v.id,
    v.title,
    v.company
HAVING COUNT(DISTINCT vs.skill_id) >= 10
ORDER BY number_of_skills DESC;


-- =========================================================
-- 12. PROJECT KPI SUMMARY
-- Overall statistics for the Job Market Intelligence project
-- =========================================================

SELECT
    (SELECT COUNT(*) FROM vacancies) AS total_vacancies,

    (SELECT COUNT(*) FROM skills) AS total_skills,

    (SELECT COUNT(*) FROM vacancy_skills) AS total_skill_mappings,

    (SELECT COUNT(DISTINCT vacancy_id)
     FROM vacancy_skills) AS vacancies_with_skills,

    (SELECT COUNT(DISTINCT company)
     FROM vacancies
     WHERE company IS NOT NULL
       AND company <> ''
       AND company <> 'Unknown') AS unique_companies,

    (SELECT COUNT(DISTINCT location)
     FROM vacancies
     WHERE location IS NOT NULL
       AND location <> ''
       AND location <> 'Unknown') AS unique_locations;