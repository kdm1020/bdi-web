
/* Drop Triggers */

DROP TRIGGER TRI_board_info_bi_num;



/* Drop Tables */

DROP TABLE board_info CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_board_info_bi_num;




/* Create Sequences */

CREATE SEQUENCE SEQ_board_info_bi_num INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE board_info
(
	bi_num number(10,0) NOT NULL,
	bi_title varchar2(2000) NOT NULL,
	bi_user varchar2(100) NOT NULL,
	bi_content varchar2(4000) NOT NULL,
	ni_credat char(8) NOT NULL,
	bi_cretim char(6) NOT NULL,
	bi_moddat char(8) NOT NULL,
	bi_modtim char(6) NOT NULL,
	PRIMARY KEY (bi_num)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_board_info_bi_num BEFORE INSERT ON board_info
FOR EACH ROW
BEGIN
	SELECT SEQ_board_info_bi_num.nextval
	INTO :new.bi_num
	FROM dual;
END;

/




