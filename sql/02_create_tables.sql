USE job_market_intelligence;


-- =========================================================
-- 1. SKILLS TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS skills (
    id INT PRIMARY KEY,
    created_at VARCHAR(100),
    name VARCHAR(255)
);


-- =========================================================
-- 2. VACANCIES TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS vacancies (
    id INT PRIMARY KEY,
    created_at VARCHAR(100),
    title VARCHAR(500),
    company VARCHAR(255),
    source_url TEXT,
    description_raw TEXT,
    experience_years DECIMAL(5,2),
    published_at VARCHAR(100),
    location VARCHAR(255),
    experience_level VARCHAR(100),
    job_category VARCHAR(100),
    experience_category VARCHAR(100),
    title_normalized VARCHAR(500),
    experience_level_clean VARCHAR(100),
    location_type VARCHAR(100)
);


-- =========================================================
-- 3. VACANCY_SKILLS TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS vacancy_skills (
    vacancy_id INT,
    skill_id INT
);


-- =========================================================
-- VERIFY TABLES
-- =========================================================

SHOW TABLES;