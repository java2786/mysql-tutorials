select Department,Employee,Salary from
(select 
dense_rank() over(partition by e.departmentId order by e.salary desc) as dr,
d.name as Department, e.name as Employee, e.salary as Salary
		
		from Employee e join Department d
		on e.departmentId = d.id) as mytable
where dr < 4;