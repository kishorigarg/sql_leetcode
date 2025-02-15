1-(1757)
select product_id from products  where low_fats ='Y' AND  recyclable ='Y';


2-(584)
select name from customer where  referee_id is  null or referee_id  != 2;


3-(595)
select name,population,area from world where area>=3000000 OR population >= 25000000 order by name;


4-(1148)
select distinct author_id as id  from views where author_id =viewer_id order by author_id ;


5-(1683)
select tweet_id  from tweets where length(content)>15;

6-(1378)
select name, e2.unique_id from employees left outer join EmployeeUNI as e2 on employees.id=e2.id ;
 
7-(1068)
 select product.product_name ,sales.year,sales.price from sales inner join product on product.product_id=sales.product_id;

8-(1581)
select visits.customer_id,count( visits.customer_id ) as count_no_trans from visits left join transactions on transactions.visit_id= visits.visit_id 
WHERE transactions.transaction_id IS NULL 
GROUP BY visits.customer_id; 


9-(197)
SELECT w1.id
FROM Weather AS w1 , Weather AS w2
WHERE w1.Temperature > w2.Temperature AND DATEDIFF(w1.recordDate , w2.recordDate) = 1

10-(1661)

select a.machine_id, round(avg(b.timestamp - a.timestamp), 3) as processing_time 
from activity a join activity b
on a.machine_id = b.machine_id and a.process_id = b.process_id and a.activity_type = 'start' and b.activity_type = 'end'
group by a.machine_id;

11-(577)

select name ,bonus
 from employee left outer join bonus on employee.empId=bonus.empId where bonus<1000 or bonus is null;

 12-(1280)
 SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.student_id) AS attended_exams
FROM students AS s
CROSS JOIN subjects AS sub 
LEFT JOIN examinations AS e 
    ON e.student_id = s.student_id 
    AND e.subject_name = sub.subject_name  
GROUP BY s.student_id, s.student_name, sub.subject_name

ORDER BY s.student_id, sub.subject_name;


13-(570)
# Write your MySQL query statement below
select w.name 
from employee as w
cross join employee as e 
on w.id=e.managerId 
group by w.id 
having  count(e.managerId)>=5; 

14-(1934)
SELECT 
    s.user_id,
    IFNULL(ROUND(SUM(c.action = 'confirmed') / COUNT(c.user_id), 2), 0) AS confirmation_rate
FROM signups s
LEFT JOIN confirmations c ON 
s.user_id = c.user_id
GROUP BY s.user_id;


15-(620)
# Write your MySQL query statement below
select * from cinema 
where id%2 !=0
and  description != 'boring'
 order by rating desc;

 16-(1251)
 # Write your MySQL query statement below
SELECT p.product_id, IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
FROM Prices p LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND
u.purchase_date BETWEEN start_date AND end_date
group by product_id;

17-(1075)
# Write your MySQL query statement below
select p.project_id, round(avg(
    e.experience_years
),2) as average_years 
from project as p
inner join 
employee as e
on p.employee_id=e.employee_id
group by p.project_id;

18-(1633)
SELECT r.contest_id, 
       ROUND((COUNT(r.user_id) * 100.0 / (SELECT COUNT(*) FROM users)), 2) AS percentage
FROM users AS u
INNER JOIN register AS r 
ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;


19-(1211)
SELECT 
    query_name,
    ROUND(AVG(rating / NULLIF(position, 0)), 2) AS quality,
    ROUND(SUM(rating < 3) * 100.0 / COUNT(rating), 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;


20(1173)
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count, 
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions 
GROUP BY month, country;
