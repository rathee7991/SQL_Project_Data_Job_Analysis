SELECT
    skills,
    Round(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE

GROUP BY
    skills

ORDER BY
    avg_salary DESC

limit 25

/*
The biggest takeaway is that the highest-paying Data Analyst opportunities increasingly overlap with Data Engineering, Machine Learning and Cloud Infrastructure.

Traditional tools help analysts enter the field, but specialized technical skills can open doors to more advanced and better-paid positions.

For a Data Analyst looking to grow, I would prioritize:
1. Advanced SQL and Python.
2. Machine Learning fundamentals (PyTorch or TensorFlow).
3. Data Engineering (Kafka and Airflow).
4. Cloud and infrastructure (AWS/Azure and Terraform).
*/