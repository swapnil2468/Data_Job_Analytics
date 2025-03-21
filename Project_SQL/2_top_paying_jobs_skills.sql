with top_paying_jobs as(
    SELECT 
        job_id,
        job_title,
        salary_year_avg
    from 
        job_postings_fact j1
    LEFT JOIN company_dim  c1 on j1.company_id = c1.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg is NOT NULL 
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*, skills
from 
    top_paying_jobs
INNER JOIN
    skills_job_dim sj1 on top_paying_jobs.job_id = sj1.job_id
INNER JOIN 
    skills_dim s1 on sj1.skill_id = s1.skill_id
ORDER BY 
    salary_year_avg

