SELECT 
    skills,
    round(avg(salary_year_avg),0) as avg_salary,skills
from 
    job_postings_fact j1
INNER JOIN
    skills_job_dim sj1 on j1.job_id = sj1.job_id
INNER JOIN 
    skills_dim s1 on sj1.skill_id = s1.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not null
GROUP BY
    skills
ORDER BY
    avg_salary desc
LIMIT 25

