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
