SELECT LEVEL 
FROM   dual
CONNECT BY LEVEL <= 10
alter table lecture add (filedata BLOB)
alter table subnote modify(originalfilename varchar2(1000))
alter table subnote modify(uploadedfilename varchar2(1000))
alter table lecture modify(originalfilename varchar2(1000))
alter table lecture modify(uploadedfilename varchar2(1000))
alter table subnote add (courseno number (6, 0))

alter table notification modify regdate default sysdate -- 20160429 추가
alter table notification modify message varchar2(200) --20160429 김영호 추가
alter table rereply modify regdate default sysdate
alter table notification add (notificationno number(6,0)); -- 20160429 김영호 추가
alter table notification drop column replyno; -- 20160429 김영호 추가
create sequence notification_seq
alter table notification modify (notificationno number(6,0) primary key);

CREATE TABLE notification
(
   senderid varchar2(20) NOT NULL,
   receiverid varchar2(20) NOT NULL,
   message varchar2(30) NOT NULL,
   regdate date DEFAULT sysdate NOT NULL
);

alter table notification add (questionno number(6,0));

alter table notification add (replyno number(6,0));

ALTER TABLE notification
   ADD FOREIGN KEY (senderid)
   REFERENCES member_jt (id)
;


ALTER TABLE notification
   ADD FOREIGN KEY (receiverid)
   REFERENCES member_jt (id)
;

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
		
		
SELECT id, courseno, coursename 
		from (select rownum as rnum, T1.* from (select courseno, id, coursename from teachcourse where id = 1 
		group by courseno, id, coursename order by courseno desc) T1)
		where rnum >= 1 and rnum <= 7