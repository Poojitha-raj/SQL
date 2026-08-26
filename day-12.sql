Set operators: It is used to combine the two or more select queries.
1.Union
2.UnionAll
3.Itersect(after 8.0.31 vesion will support)
select * from old_student
where in(select * from new_student);
4.except(after 8.0.31 vesion will support) 
select * from old_student 
where not in(select * from new_student);

JOINS: To combine the rows from 2 or more tables.
Syntaxx:
select s.s.d,s.sname,c.cid,c.cname
from student s join course c 
on s.sid = c.cid


->common column to perform join operations
Types:
I. core joins
   1.inner join
   2.Natural join
   3.equi join
   4.non equi join
II.outer join
   1.left join/left outer join : 
   2.Right join
   3.full join
III.self join
IV.cross join


