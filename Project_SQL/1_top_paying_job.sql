SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as Company_name
from 
    job_postings_fact j1
LEFT JOIN company_dim  c1 on j1.company_id = c1.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg is NOT NULL 
ORDER BY
    salary_year_avg DESC
LIMIT 10;


