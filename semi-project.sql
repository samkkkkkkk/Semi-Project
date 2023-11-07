
/* Drop Tables */

DROP TABLE administrative_code CASCADE CONSTRAINTS;
DROP TABLE job_category CASCADE CONSTRAINTS;
DROP TABLE mypage CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE property CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_mypage_bno;




/* Create Sequences */

CREATE SEQUENCE SEQ_mypage_bno 
	INCREMENT BY 1 
	START WITH 1
	MAXVALUE 1000000;



/* Create Tables */

CREATE TABLE administrative_code
(
	code number NOT NULL,
	si_do varchar2(50),
	si_gun_gu varchar2(50),
	eup_myeong_dong varchar2(50),
	PRIMARY KEY (code)
);


CREATE TABLE job_category
(
    large_category_code varchar2(50) NOT NULL,
    large_category_name varchar2(200) NOT NULL,
    medium_category_code varchar2(50) NOT NULL,
    medium_category_name varchar2(200) NOT NULL,
	small_category_code varchar2(50) NOT NULL,
	small_category_name varchar2(200) NOT NULL
);


CREATE TABLE members
(
	id varchar2(30) NOT NULL,
	password varchar2(100) NOT NULL,
	user_Name varchar2(30) NOT NULL,
	email varchar2(50),
	PRIMARY KEY (id)
);


CREATE TABLE mypage
(
	bno number(10,0) NOT NULL,
	id varchar2(30) NOT NULL,
	reg_date date DEFAULT SYSDATE,
	location varchar2(500) NOT NULL,
	job_category1 varchar2(50) NOT NULL,
	job_category2 varchar2(50) NOT NULL,
	job_category3 varchar2(50) NOT NULL,
	budget number NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE property
(
	realestate_no number NOT NULL,
	adstrd_nm varchar2(50),
	exche_gtn number,
	latitude number(15,10),
	longitude number(15,10),
	PRIMARY KEY (realestate_no)
);



/* Create Foreign Keys */

ALTER TABLE mypage
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;



