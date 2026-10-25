USE job_market_intelligence;


-- =========================================================
-- 1. TOTAL RECORDS IN EACH TABLE
-- =========================================================

SELECT
    (SELECT COUNT(*) FROM vacancies) AS total_vacancies,
    (SELECT COUNT(*) FROM skills) AS total_skills,
    (SELECT COUNT(*) FROM vacancy_skills) AS total_mappings;


-- =========================================================
-- 2. CHECK DUPLICATE VACANCY IDs
-- =========================================================

SELECT
    id,
    COUNT(*) AS duplicate_count
FROM vacancies
GROUP BY id
HAVING COUNT(*) > 1;


-- =========================================================
-- 3. CHECK DUPLICATE SKILL IDs
-- =========================================================

SELECT
    id,
    COUNT(*) AS duplicate_count
FROM skills
GROUP BY id
HAVING COUNT(*) > 1;


-- =========================================================
-- 4. CHECK INVALID VACANCY IDs
-- =========================================================

SELECT
    COUNT(*) AS invalid_vacancy_ids
FROM vacancy_skills vs
LEFT JOIN vacancies v
    ON vs.vacancy_id = v.id
WHERE v.id IS NULL;


-- =========================================================
-- 5. CHECK INVALID SKILL IDs
-- =========================================================

SELECT
    COUNT(*) AS invalid_skill_ids
FROM vacancy_skills vs
LEFT JOIN skills s
    ON vs.skill_id = s.id
WHERE s.id IS NULL;


-- =========================================================
-- 6. CHECK VACANCIES WITH SKILLS
-- =========================================================

SELECT
    COUNT(DISTINCT vacancy_id) AS vacancies_with_skills
FROM vacancy_skills;


-- =========================================================
-- 7. CHECK SKILL COVERAGE
-- =========================================================

SELECT
    ROUND(
        COUNT(DISTINCT vs.vacancy_id)
        * 100.0
        / (SELECT COUNT(*) FROM vacancies),
        2
    ) AS skill_coverage_percentage
FROM vacancy_skills vs;