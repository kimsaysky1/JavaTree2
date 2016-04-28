SELECT LEVEL 
FROM   dual
CONNECT BY LEVEL <= 10
alter table lecture add (filedata BLOB)
alter table subnote modify(originalfilename varchar2(1000))
alter table subnote modify(uploadedfilename varchar2(1000))
alter table lecture modify(originalfilename varchar2(1000))
alter table lecture modify(uploadedfilename varchar2(1000))

SELECT s.lectureno as studying, l.lectureno as lectureno, c.courseno as courseno,
		l.lecturename, to_char(l.regdate, 'yyyy/mm/dd') as regdate, l.uploadedfilename,
		c.coursename as coursename, c.introdution as introdution, c.courseno as courseno, c.id as teacherid
		FROM lecture l 
		JOIN course c ON ( l.courseno = c.courseno and c.courseno = 3 )
		LEFT OUTER JOIN studylecture s ON (  s.lectureno = l.lectureno and s.courseno = 3 and s.id = 2)
		order by lectureno asc
		
		select count(*) from studycourse where courseno = 6 and id = 2
		
		SELECT coursename, courseno, username, to_char(regdate, 'YYYY-MM-DD') as regdate, id as teacherid 
		from (select rownum as rnum, T1.* from (select * from course where 
		coursename like '%java%' 
		order by courseno desc) T1)
		where rnum >= 1 and rnum <= 7 
		
	select * from	
	(select rownum as rnum, courseno, coursename, id, username, INTRODUTION, to_char(regdate, 'yyyy/mm/dd') as regdate
	from (select * from course
	 where courseno in (select courseno from coursetype where typeno IN 
		(
			8
		))
		order by courseno
		desc
		)
		)where rnum >= 8 and rnum <= 10
		
		SELECT l.lectureno as lectureno, c.courseno as courseno,
		l.lecturename, to_char(l.regdate, 'yyyy/mm/dd') as regdate, l.uploadedfilename,
		c.coursename as coursename, c.introdution as introdution, c.courseno as courseno, c.id as teacherid
		FROM lecture l 
		JOIN course c ON ( l.courseno = c.courseno and c.courseno = 3 )
		order by lectureno asc
		
		