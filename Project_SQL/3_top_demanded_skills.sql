SELECT 
    skills,
    count(j1.job_id) as demand_count
from 
    job_postings_fact j1
INNER JOIN
    skills_job_dim sj1 on j1.job_id = sj1.job_id
INNER JOIN 
    skills_dim s1 on sj1.skill_id = s1.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count desc
limit 5