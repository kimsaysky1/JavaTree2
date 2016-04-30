alter table coding add (id varchar2(20) NOT NULL);--20160425 박수지 추가

create sequence question_seq;
CREATE sequence subnote_seq start with 1 increment by 1;--20160421추가    	
  
alter table studylecture add (courseno number(6,0) NOT NULL)--창우 studylecture
alter table studycourse drop column startdate;
alter table studycourse drop column enddate;
alter table studycourse add (teacherid varchar2(20) not null);--창우 studycourse
alter table course modify (coursename varchar2(100)); -- 20160428 영호 추가
alter table studycourse modify (coursename varchar2(100));-- 20160428 영호 추가
alter table teachcourse modify (coursename varchar2(100)); -- 20160428 영호 추가
ALTER TABLE teachcourse ADD (startdate date DEFAULT sysdate NOT NULL);
alter table course drop column typeno;
alter table course add (regdate date default sysdate not null);
alter table coding add (regdate date default sysdate not null); -- 20160423 김영호 추가
alter table notification add (questionno number(6,0)); --20160427 김영호 추가
alter table notification add (replyno number(6,0)); --20160427 김영호 추가
alter table coding add (codinganswer clob not null);
alter table coding drop column lectureno;
alter table studycourse add (teacherid varchar2(20) not null);
alter table coding add (id varchar2(20) NOT NULL);
DROP TABLE coding CASCADE CONSTRAINTS;
CREATE sequence coding_seq start with 1 increment by 1;

alter table coding drop column regdate;--20160424 박수지 추가
alter table notification modify regdate default sysdate
alter table notification modify message varchar2(200)
alter table rereply modify regdate default sysdate
alter table notification add (notificationno number(6,0));
alter table notification drop column replyno; 
create sequence notification_seq
alter table notification modify (notificationno number(6,0) primary key);
alter table subnote add (courseno number (6, 0) not null)

CREATE TABLE lecturecoding
(
	lectureno number(6,0) NOT NULL,
	codingno number(6,0) NOT NULL
);

ALTER TABLE lecturecoding
	ADD FOREIGN KEY (lectureno)
	REFERENCES lecture (lectureno)
	ADD FOREIGN KEY (codingno)
	REFERENCES coding (codingno)
;

alter table coding drop column typeno;

alter table subnote modify originalfilename null--20160421�߰�
alter table subnote modify uploadedfilename null--20160421�߰�

--notnull����
--ALTER TABLE ���̺�� MODIFY �÷��� NULL;
--ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
alter table subnote modify (uploadedfilename varchar2(900));
alter table subnote modify (originalfilename varchar2(500)); -- 20160428 김영호실행
alter table lecture modify (uploadedfilename varchar2(900));
alter table lecture modify (originalfilename varchar2(500));--20160422 ����

alter table coding add (id varchar2(20) NOT NULL);--20160425 박수지 추가
CREATE sequence coding_seq start with 1 increment by 1;--20160424 박수지 수정
CREATE sequence question_seq start with 1 increment by 1;--20160425 박수지 수정
ALTER TABLE studylecture
   ADD UNIQUE (lectureno)--20160425 창우 수정 ~ 재수강신청 방지
/* Drop Tables */
drop table lecturecoding cascade constraints;

DROP TABLE ability CASCADE CONSTRAINTS;
DROP TABLE checklecture CASCADE CONSTRAINTS;
DROP TABLE rereply CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE question CASCADE CONSTRAINTS;
DROP TABLE studycodingbox CASCADE CONSTRAINTS;
DROP TABLE coding CASCADE CONSTRAINTS;
DROP TABLE coursetype CASCADE CONSTRAINTS;
DROP TABLE studylecture CASCADE CONSTRAINTS;
DROP TABLE subnote CASCADE CONSTRAINTS;
DROP TABLE teachlecture CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE studycourse CASCADE CONSTRAINTS;
DROP TABLE teachcourse CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;
DROP TABLE error CASCADE CONSTRAINTS;
DROP TABLE interest CASCADE CONSTRAINTS;
DROP TABLE notification CASCADE CONSTRAINTS;
DROP TABLE member_jt CASCADE CONSTRAINTS;
DROP TABLE typename CASCADE CONSTRAINTS;

insert into typename values('purejava', 1);
insert into typename values('web', 2);
insert into typename values('mobile', 3);
insert into typename values('iot', 4);
insert into typename values('swing', 5);
insert into typename values('jdbc', 6);
insert into typename values('api', 7);
insert into typename values('spring', 8);
insert into typename values('struts', 9);
insert into typename values('etcframework', 10);
insert into typename values('etc', 11);


select courseno, coursename, id, username, INTRODUTION, to_char(regdate, 'yyyy/mm/dd') as regdate from course
   where courseno IN (select courseno from coursetype where typeno IN 
   (select typeno from interest where id = 1 and value = 3));

/* Create Tables */

CREATE TABLE member_jt
(
	point number(10,0) DEFAULT 0 NOT NULL,
	id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	username varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	countquestion number(6,0) DEFAULT 0 NOT NULL,
	countresponse number(6,0) DEFAULT 0 NOT NULL,
	countrecommend number(6,0) DEFAULT 0 NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE interest
(
	id varchar2(20) NOT NULL,
	typeno number(2,0) NOT NULL,
	value number(1,0) NOT NULL
);

CREATE TABLE ability
(
	id varchar2(20) NOT NULL,
	typeno number(2,0) NOT NULL,
	value number(1,0) NOT NULL
);

CREATE TABLE studycodingbox
(
	id varchar2(20) NOT NULL,
	codingno number(6,0) NOT NULL,
	coding clob
);


CREATE TABLE course
(
	courseno number(6,0) NOT NULL,
	typeno number(2,0) NOT NULL,
	coursename varchar2(30) NOT NULL,
	id varchar2(20) NOT NULL,
	username varchar2(20) NOT NULL,
	introdution varchar2(4000) NOT NULL,
	PRIMARY KEY (courseno)
);
CREATE sequence course_seq start with 1 increment by 1;
drop sequence course_seq;

CREATE TABLE coursetype
(
	courseno number(6,0) NOT NULL,
	typeno number(2,0) NOT NULL
);


CREATE TABLE lecture
(
	courseno number(6,0) NOT NULL,
	lectureno number(6,0) NOT NULL,
	lecturename varchar2(30) NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	originalfilename varchar2(50) NOT NULL,
	uploadedfilename varchar2(200) NOT NULL,
	PRIMARY KEY (lectureno)
);
CREATE sequence lecture_seq start with 1 increment by 1;
drop sequence lecture_seq;

CREATE TABLE coding
(
	codingno number(6,0) NOT NULL,
	codingquestion varchar2(4000) NOT NULL,
	codingtemplet clob,
	codinganswer clob,
	id varchar2(20),
	PRIMARY KEY (codingno)
);
--typeno number(2,0) NOT NULL,
--lectureno number(6,0),
CREATE sequence coding_seq start with 1 increment by 1;--20160424 박수지 수정
--drop sequence coding_seq;

CREATE sequence question_seq start with 1 increment by 1;--20160425 박수지 수정

CREATE TABLE teachcourse
(
	id varchar2(20) NOT NULL,
	courseno number(6,0) NOT NULL,
	coursename varchar2(30) NOT NULL
);



CREATE TABLE teachlecture
(
	id varchar2(20) NOT NULL,
	courseno number(6,0) NOT NULL,
	lectureno number(6,0),
	point number(10,0) NOT NULL,
	studentcount number(6,0) NOT NULL
);


CREATE TABLE checklecture
(
	id varchar2(20) NOT NULL,
	courseno number(6,0) NOT NULL,
	lectureno number(6,0) NOT NULL,
	watchedcheck varchar2(3) NOT NULL
);


CREATE TABLE studylecture
(
	id varchar2(20) NOT NULL,
	lectureno number(6,0),
	startdate date NOT NULL,
	enddate date NOT NULL
);

CREATE TABLE question
(
	questionno number(6,0) NOT NULL,
	typeno number(2,0) NOT NULL,
	codingno number(6,0),
	id varchar2(20) NOT NULL,
	username varchar2(50) NOT NULL,
	title varchar2(50) NOT NULL,
	content clob NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	hitcount number(6,0) DEFAULT 0 NOT NULL,
	curious number(6,0) DEFAULT 0 NOT NULL,
	PRIMARY KEY (questionno)
);
CREATE sequence question_seq start with 1 increment by 1;--20160425 박수지 수정


CREATE TABLE reply
(
	questionno number(6,0) NOT NULL,
	replyno number(10,0) NOT NULL,
	id varchar2(20) NOT NULL,
	username varchar2(50) NOT NULL,
	content clob NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	recommend number(6,0) DEFAULT 0 NOT NULL,
	PRIMARY KEY (replyno)
);



CREATE TABLE rereply
(
	replyno number(10,0) NOT NULL,
	id varchar2(20) NOT NULL,
	content varchar2(1000) NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	username varchar2(20) NOT NULL
);

CREATE TABLE error
(
	errorname varchar2(50) NOT NULL,
	response varchar2(2000),
	PRIMARY KEY (errorname)
);



CREATE TABLE typename
(
	type varchar2(50) NOT NULL,
	typeno number(2,0) NOT NULL,
	PRIMARY KEY (typeno)
);




CREATE TABLE notification
(
	senderid varchar2(20) NOT NULL,
	receiverid varchar2(20) NOT NULL,
	message varchar2(30) NOT NULL,
	regdate date DEFAULT sysdate NOT NULL
);



CREATE TABLE studycourse
(
	id varchar2(20) NOT NULL,
	courseno number(6,0) NOT NULL,
	coursename varchar2(30) NOT NULL,
	startdate date NOT NULL,
	enddate date NOT NULL
);





CREATE TABLE subnote
(
	id varchar2(20) NOT NULL,
	subnoteno number(6,0) NOT NULL,
	originalfilename varchar2(50) NOT NULL,
	uploadedfilename varchar2(200) NOT NULL,
	lectureno number(6,0) NOT NULL,
	PRIMARY KEY (subnoteno)
);

CREATE sequence subnote_seq start with 1 increment by 1;--20160421�߰�




/* Create Foreign Keys */

ALTER TABLE question
	ADD FOREIGN KEY (codingno)
	REFERENCES coding (codingno)
;


ALTER TABLE studycodingbox
	ADD FOREIGN KEY (codingno)
	REFERENCES coding (codingno)
;


ALTER TABLE checklecture
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;


ALTER TABLE coursetype
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;

ALTER TABLE coursetype
	ADD FOREIGN KEY (typeno)
	REFERENCES typename (typeno)
;

ALTER TABLE lecture
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;


ALTER TABLE studycourse
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;


ALTER TABLE teachcourse
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;


ALTER TABLE teachlecture
	ADD FOREIGN KEY (courseno)
	REFERENCES course (courseno)
;


ALTER TABLE checklecture
	ADD FOREIGN KEY (lectureno)
	REFERENCES lecture (lectureno)
;


--ALTER TABLE coding
	--ADD FOREIGN KEY (lectureno)
--	REFERENCES lecture (lectureno)
--;

--ALTER TABLE coding DROP CONSTRAINT fk_coding_lectureno;




ALTER TABLE studylecture
	ADD FOREIGN KEY (lectureno)
	REFERENCES lecture (lectureno)
;


ALTER TABLE subnote
	ADD FOREIGN KEY (lectureno)
	REFERENCES lecture (lectureno)
;


ALTER TABLE teachlecture
	ADD FOREIGN KEY (lectureno)
	REFERENCES lecture (lectureno)
;


ALTER TABLE ability
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE checklecture
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE course
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE interest
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE notification
	ADD FOREIGN KEY (senderid)
	REFERENCES member_jt (id)
;


ALTER TABLE notification
	ADD FOREIGN KEY (receiverid)
	REFERENCES member_jt (id)
;


ALTER TABLE question
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE rereply
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE studycodingbox
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE studycourse
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE studylecture
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE subnote
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE teachcourse
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE teachlecture
	ADD FOREIGN KEY (id)
	REFERENCES member_jt (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (questionno)
	REFERENCES question (questionno)
;


ALTER TABLE rereply
	ADD FOREIGN KEY (replyno)
	REFERENCES reply (replyno)
;


ALTER TABLE ability
	ADD FOREIGN KEY (typeno)
	REFERENCES typename (typeno)
;


ALTER TABLE coding
	ADD FOREIGN KEY (typeno)
	REFERENCES typename (typeno)
;


--ALTER TABLE course
	--ADD FOREIGN KEY (typeno)
	--REFERENCES typename (typeno)
--;


ALTER TABLE interest
	ADD FOREIGN KEY (typeno)
	REFERENCES typename (typeno)
;


ALTER TABLE question
	ADD FOREIGN KEY (typeno)
	REFERENCES typename (typeno)
;



/* Comments */

COMMENT ON TABLE ability IS '�� ���̺� : (3)�ڰ����� ���̺�';
COMMENT ON COLUMN ability.id IS 'id';
COMMENT ON COLUMN ability.typeno IS 'typeno';
COMMENT ON COLUMN ability.value IS 'value';
COMMENT ON TABLE checklecture IS '�� ���̺� : (12)���� û�� ���� ���̺�';
COMMENT ON COLUMN checklecture.id IS 'id';
COMMENT ON COLUMN checklecture.courseno IS 'courseno';
COMMENT ON COLUMN checklecture.lectureno IS 'lectureno';
COMMENT ON COLUMN checklecture.watchedcheck IS 'watchedcheck';
COMMENT ON TABLE coding IS '�� ���̺� : (8)�ڵ� ���� ���� ���̺�';
COMMENT ON COLUMN coding.codingno IS 'codingno';
COMMENT ON COLUMN coding.typeno IS 'typeno';
COMMENT ON COLUMN coding.codingquestion IS 'codingquestion';
COMMENT ON COLUMN coding.codingtemplet IS 'codingtemplet';
COMMENT ON COLUMN coding.lectureno IS 'lectureno';
COMMENT ON TABLE course IS '�� ���̺� : (5)��ü ���� ���̺�';
COMMENT ON COLUMN course.courseno IS 'courseno';
COMMENT ON COLUMN course.typeno IS 'typeno : �о�';
COMMENT ON COLUMN course.coursename IS 'coursename';
COMMENT ON COLUMN course.id IS 'id';
COMMENT ON COLUMN course.username IS 'username';
COMMENT ON COLUMN course.introdution IS 'introdution';
COMMENT ON TABLE coursetype IS '�� ���̺� : (6)���� �� �о� ���̺�';
COMMENT ON COLUMN coursetype.courseno IS 'courseno';
COMMENT ON COLUMN coursetype.typeno IS 'typeno';
COMMENT ON TABLE error IS '�� ���̺� : (18)���� ���̺�';
COMMENT ON COLUMN error.errorname IS 'errorname';
COMMENT ON COLUMN error.response IS 'response';
COMMENT ON TABLE interest IS '�� ���̺� : (2)���ɺо� ���̺�';
COMMENT ON COLUMN interest.id IS 'id';
COMMENT ON COLUMN interest.typeno IS 'typeno';
COMMENT ON COLUMN interest.value IS 'value';
COMMENT ON TABLE lecture IS '�� ���̺� : (7)��ü ���� ���̺�  - ���¸��� �ٸ� [���� ���̺�]����';
COMMENT ON COLUMN lecture.courseno IS 'courseno';
COMMENT ON COLUMN lecture.lectureno IS 'lectureno';
COMMENT ON COLUMN lecture.lecturename IS 'lecturename';
COMMENT ON COLUMN lecture.regdate IS 'regdate';
COMMENT ON COLUMN lecture.originalfilename IS 'originalfilename';
COMMENT ON COLUMN lecture.uploadedfilename IS 'uploadedfilename';
COMMENT ON TABLE member_jt IS '�� ���̺� : (1)ȸ�� ���̺�';
COMMENT ON COLUMN member_jt.point IS 'point';
COMMENT ON COLUMN member_jt.id IS 'id';
COMMENT ON COLUMN member_jt.password IS 'password';
COMMENT ON COLUMN member_jt.username IS 'username';
COMMENT ON COLUMN member_jt.email IS 'email';
COMMENT ON COLUMN member_jt.countquestion IS 'countquestion : ���� Ƚ��';
COMMENT ON COLUMN member_jt.countresponse IS 'countresponse : �亯 Ƚ�� ';
COMMENT ON COLUMN member_jt.countrecommend IS 'countrecommend : �亯 ��õ Ƚ�� ';
COMMENT ON TABLE notification IS '�� ���̺�';
COMMENT ON COLUMN notification.senderid IS 'senderid';
COMMENT ON COLUMN notification.receiverid IS 'receiverid';
COMMENT ON COLUMN notification.message IS 'message';
COMMENT ON COLUMN notification.regdate IS 'regdate';
COMMENT ON TABLE question IS '�� ���̺� : (15) ���� ���̺�';
COMMENT ON COLUMN question.questionno IS 'questionno';
COMMENT ON COLUMN question.typeno IS 'typeno';
COMMENT ON COLUMN question.codingno IS 'codingno';
COMMENT ON COLUMN question.id IS 'id';
COMMENT ON COLUMN question.username IS 'username';
COMMENT ON COLUMN question.title IS 'title';
COMMENT ON COLUMN question.content IS 'content';
COMMENT ON COLUMN question.regdate IS 'regdate';
COMMENT ON COLUMN question.hitcount IS 'hitcount';
COMMENT ON COLUMN question.curious IS 'curious';
COMMENT ON TABLE reply IS '�� ���̺� : (16) �亯 ���̺�';
COMMENT ON COLUMN reply.questionno IS 'questionno';
COMMENT ON COLUMN reply.replyno IS 'replyno';
COMMENT ON COLUMN reply.id IS 'id';
COMMENT ON COLUMN reply.username IS 'username';
COMMENT ON COLUMN reply.content IS 'content';
COMMENT ON COLUMN reply.regdate IS 'regdate';
COMMENT ON COLUMN reply.recommend IS 'recommend : ��õ�� - ����Ʈ �亯 ���� ����';
COMMENT ON TABLE rereply IS '�� ���̺� : (17) (�亯��) ��� ���̺�';
COMMENT ON COLUMN rereply.replyno IS 'replyno';
COMMENT ON COLUMN rereply.id IS 'id';
COMMENT ON COLUMN rereply.content IS 'content';
COMMENT ON COLUMN rereply.regdate IS 'regdate';
COMMENT ON COLUMN rereply.username IS 'username';
COMMENT ON TABLE studycodingbox IS '�� ���̺� : (4)�л�����������';
COMMENT ON COLUMN studycodingbox.id IS 'id';
COMMENT ON COLUMN studycodingbox.codingno IS 'codingno';
COMMENT ON COLUMN studycodingbox.coding IS 'coding';
COMMENT ON TABLE studycourse IS '�� ���̺�';
COMMENT ON COLUMN studycourse.id IS 'id';
COMMENT ON COLUMN studycourse.courseno IS 'courseno : ���¸��';
COMMENT ON COLUMN studycourse.coursename IS 'coursename';
COMMENT ON COLUMN studycourse.startdate IS 'startdate';
COMMENT ON COLUMN studycourse.enddate IS 'enddate';
COMMENT ON TABLE studylecture IS '�� ���̺� : (12)(Ư�� ȸ�� ����) �ڽ��� ���� ���� ���̺�';
COMMENT ON COLUMN studylecture.id IS 'id';
COMMENT ON COLUMN studylecture.lectureno IS 'lectureno';
COMMENT ON COLUMN studylecture.startdate IS 'startdate';
COMMENT ON COLUMN studylecture.enddate IS 'enddate';
COMMENT ON TABLE subnote IS '�� ���̺�';
COMMENT ON COLUMN subnote.id IS 'id';
COMMENT ON COLUMN subnote.subnoteno IS 'subnoteno';
COMMENT ON COLUMN subnote.originalfilename IS 'originalfilename';
COMMENT ON COLUMN subnote.uploadedfilename IS 'uploadedfilename';
COMMENT ON COLUMN subnote.lectureno IS 'lectureno';
COMMENT ON TABLE teachcourse IS '�� ���̺� : (9)((Ư�� ȸ�� ����) �ڽ��� ����ġ�� ���� ���̺�';
COMMENT ON COLUMN teachcourse.id IS 'id';
COMMENT ON COLUMN teachcourse.courseno IS 'courseno : ��ü���¸��';
COMMENT ON COLUMN teachcourse.coursename IS 'coursename';
COMMENT ON TABLE teachlecture IS '�� ���̺� : (10)(Ư�� ȸ�� ����) �ڽ��� ����ġ�� ���� ���̺�';
COMMENT ON COLUMN teachlecture.id IS 'id';
COMMENT ON COLUMN teachlecture.courseno IS 'courseno';
COMMENT ON COLUMN teachlecture.lectureno IS 'lectureno';
COMMENT ON COLUMN teachlecture.point IS 'point';
COMMENT ON COLUMN teachlecture.studentcount IS 'studentcount';
COMMENT ON TABLE typename IS '�� ���̺� : (19)�о� ���̺�';
COMMENT ON COLUMN typename.type IS 'type';
COMMENT ON COLUMN typename.typeno IS 'typeno';

ALTER TABLE studylecture
	ADD UNIQUE (lectureno)--20160425 창우 수정, 재수강신청 방지



