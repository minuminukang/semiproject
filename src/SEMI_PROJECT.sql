--SYSTEM�� �Է��� ���̵� ���� �ڵ�
CREATE USER semi IDENTIFIED BY semi;
GRANT RESOURCE, CONNECT TO semi;

-- ��ü ����
DELETE FROM NEWS_API;
DROP TABLE NEWS_API;
-- ���̺� ����
    CREATE TABLE NEWS_API (  
    title VARCHAR2(200),
    originallink VARCHAR2(300),
	link VARCHAR2(300),
	description VARCHAR2(500),
    PUBDATE DATE
);

--��ü ��ȸ
SELECT * FROM NEWS_API ; 

--�׽�Ʈ��

 INSERT INTO  NEWS_API VALUES(?,?,?,?);
 
 COMMIT;
------------------------------���� �� --------------------------------
---------------------------������ ���� ���� ---------------------------
-- ��ü ����
DELETE FROM EVCHARGER_API;
DROP TABLE EVCHARGER_API;
-- ���̺� ����
CREATE TABLE EVCHARGER_API (  
 statNm VARCHAR2(100), 		
statId VARCHAR2(50), 	
chgerId VARCHAR2(50), 		
chgerType VARCHAR2(50),  	
addr VARCHAR2(500), 		
lat VARCHAR2(200),  			
lng VARCHAR2(200), 			
useTime VARCHAR2(50),  		
bnm VARCHAR2(50), 			
busiNm VARCHAR2(50),		
busiCall VARCHAR2(50), 	
stat VARCHAR2(50), 		
statUpdDt VARCHAR2(50), 	
parkingFree	VARCHAR2(5), 
note VARCHAR2(200), 		
limitYn VARCHAR2(5), 		
delYn VARCHAR2(5) 		
);

SELECT  STATID, STATNM, ADDR, LAT, LNG, USETIME, stat, count(stat) count FROM evcharger_api  GROUP BY stat, STATID, STATNM, ADDR, USETIME, LAT, LNG;
CREATE TABLE EVCHARGER_API (  
 statNm VARCHAR2(100), 		
statId VARCHAR2(50), 	
chgerId VARCHAR2(50), 		
chgerType VARCHAR2(50),  	
addr VARCHAR2(500), 		
lat VARCHAR2(200),  			
lng VARCHAR2(200), 			
useTime VARCHAR2(50),  		
bnm VARCHAR2(50), 			
busiNm VARCHAR2(50),		
busiCall VARCHAR2(50), 	
stat VARCHAR2(50), 		
statUpdDt DATE, 	
parkingFree	VARCHAR2(5), 
note VARCHAR2(200), 		
limitYn VARCHAR2(5), 		
delYn VARCHAR2(5) 		
);

--��ü ��ȸ
SELECT * FROM EVCHARGER_API;

SELECT  STATID, STATNM, ADDR, LAT, LNG, USETIME,chgertype, stat, count(stat) count FROM evcharger_api  GROUP BY stat, STATID, STATNM, ADDR, USETIME, LAT, LNG,chgertype;

SELECT  STATID, STATNM, ADDR, LAT, LNG, USETIME, stat, count(stat) count FROM evcharger_api GROUP BY stat, STATID, STATNM, ADDR, USETIME, LAT, LNG;
 ----------------������ ���� ------------

-- ��ü ����
DELETE FROM EV;
DROP TABLE EV;

-- ���̺� ����
CREATE TABLE EV (
    modelName VARCHAR2(80),
    modelSub VARCHAR2(80),
    price number,
    fuel VARCHAR2(60),
    person VARCHAR2(10),
    drive VARCHAR2(30),
    transM VARCHAR2(20),
    distance VARCHAR2(20),
    energy VARCHAR2(15),
    motor VARCHAR2(15),
    company VARCHAR2(30),
    nation VARCHAR2(20),
    image_1 VARCHAR2(100),
    image_2 VARCHAR2(100),
    image_3 VARCHAR2(100),
    image_4 VARCHAR2(100),
    image_5 VARCHAR2(100),
    readcount NUMBER DEFAULT 0,
    createDate DATE DEFAULT SYSDATE
);

DELETE FROM EV WHERE MODELNAME = 'test';
INSERT INTO EV VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
INSERT INTO EV VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
commit;

--��ȸ

select * from (SELECT ROWNUM RNUM,modelName,modelSub,price,fuel,person,drive,
transM,distance,energy,motor,company,nation,
image_1,image_2,image_3,image_4,image_5, readcount,createDate from
(SELECT modelName,modelSub,price,fuel,person,drive,
transM,distance,energy,motor,company,nation,
image_1,image_2,image_3,image_4,image_5, readcount,createDate FROM EV ORDER BY price DESC))
WHERE RNUM BETWEEN 10 AND 50;

SELECT RNUM,modelName,modelSub,price,fuel,person,drive,
transM,distance,energy,motor,company,nation
image_1,image_2,image_3,image_4,image_5, readcount,createDate from
(SELECT ROWNUM AS RNUM,modelName,modelSub,price,fuel,person,drive,
transM,distance,energy,motor,company,nation,
image_1,image_2,image_3,image_4,image_5, readcount,createDate FROM EV
WHERE modelname LIKE '%��%' OR company LIKE '%��%')
WHERE RNUM BETWEEN 1 AND 10;


select * from ev order by price desc;
delete from ev where modelname = '����test';
select * from ev;

select * from ev where modelname like '%��%' or company like '%����%';
update ev set price=119800000 where modelName='2021 �ƿ�� e-Ʈ�� ����Ʈ��' and modelsub='50 Quattro';

SELECT modelName,modelSub,readcount FROM ev WHERE modelName='2021 �׽��� ��Y' AND modelSub='Dual Motor AWD';
UPDATE ev SET readcount=1 WHERE modelName='2021 �׽��� ��Y' AND modelSub='Dual Motor AWD';

select * from ev order by price asc;
select * from ev order by price desc;
select * from ev order by readcount desc;

commit;
 
 ----------------������ �� ------------
 ---------------- ȸ�� ���� ----------------
DELETE FROM MEMBER;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_UNO;
CREATE SEQUENCE SEQ_UNO;

CREATE TABLE MEMBER (
    USER_NO VARCHAR2(20),
    ID VARCHAR2(20) PRIMARY KEY,
    PWD VARCHAR2(20),
    ROLE VARCHAR2(20) DEFAULT 'NORMAL',
    NAME VARCHAR2(20),
    PHONE VARCHAR2(20),
    ENROLL_DATE DATE DEFAULT SYSDATE
);

INSERT INTO MEMBER (
    USER_NO,
    ID,
    PWD,
    ROLE,
    NAME,
    PHONE,
    ENROLL_DATE
)VALUES(
    SEQ_UNO.NEXTVAL,
    'ADMIN',
    '1234',
    'ADMIN',
    'ADMIN',
    '010-1234-5678',
    DEFAULT
);

COMMIT;
SELECT * FROM MEMBER;

-- INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL, ?, ?, DEFAULT, ?, ?, DEFAULT);
-- UPDATE MEMBER SET NAME = ?, PHONE = ? WHERE ID = ?;

---------------- ȸ�� �� ----------------
 ---------------�������� ����----------
DELETE FROM FAQ;
DROP TABLE FAQ;

CREATE TABLE FAQ(
    TITLE       VARCHAR2(100),               
    CONTENTS   VARCHAR2(1000)
);

--SELECT * FROM FAQ;
INSERT INTO FAQ VALUES('���Ż�㸸 �����մϴ�','�츮�� ���Ż���û�� �޾� ������ �����Ͽ� ��㸸 �����մϴ�. ���� ���Ű� �������� ������ ���� ����û�� ���� �����Ͻñ� �ٶ��ϴ�.');
INSERT INTO FAQ VALUES('���� ���� �� ������ �����մϴ�','���� ����ڿ� �����ϴ� ������ �ǻ������ �� ���� �ʴ´ٸ� ���� ����� ������� ����� ������ ��� ������ ������ �� �ֽ��ϴ�. ������ 1ȸ�� ������ �� ����ٶ��ϴ�.');
INSERT INTO FAQ VALUES('���������� ����˴ϴ�',' �ſ� ��°�� ������� ������ �� ������ ������ ��� ������Ʈ�� ����˴ϴ�. ���� Ȩ������ �湮�� ���������� ������ ��ȸ �� ������ ��ȸ�� �Ұ����մϴ�.');
INSERT INTO FAQ VALUES(' ����ڻ���� �ڷγ��� ���� īī���� ������θ� �����մϴ�',' �ڷγ� 5�ܰ���� ����Ǿ ����ڻ�� �ݼ��ʹ� ��� ��� �ߴܵǾ����ϴ�. ���� īī���� �÷��� ģ���θ� ����� �����ϸ� ������ ���� �亯�� �ص帮�ڽ��ϴ�. īī���� ģ�� �÷��� ���̵�� momomo motors�Դϴ�.');

COMMIT;

SELECT * FROM FAQ;

DELETE FROM FAQ;

 ---------------�������� ��----------
   ---------------- ���Ż�� ���� ----------------
DELETE FROM BUY_COUNSELING;
DROP TABLE BUY_COUNSELING;

DROP SEQUENCE SEQ_BCNO;
CREATE SEQUENCE SEQ_BCNO;

CREATE TABLE BUY_COUNSELING (
    BC_NO NUMBER PRIMARY KEY,
    U_ID VARCHAR2(20),
    U_NAME VARCHAR2(20),
    PHONE VARCHAR2(20) ,
    MODELNAME VARCHAR2(50),
    APPLICATION_DATE DATE DEFAULT SYSDATE,
    COUNSELING_DATE DATE,
    TIME VARCHAR2(50),
    INFLOW_PATH VARCHAR2(100),
    ADDITIONAL_INFORMATION VARCHAR2(500),
    CHECK_COUNSELING VARCHAR2(20) DEFAULT '��Ȯ��'
);

INSERT INTO BUY_COUNSELING VALUES(
    SEQ_BCNO.NEXTVAL,
    'ADMIN',
    'ADMIN',
    '01012345678',
    '2021 �׽��� �� Y',
    sysdate+10,
    '2021/12/01',
    '11:00~12:00',
    '��α�',
    '����',
    'Ȯ�� �Ϸ�'
);

COMMIT;
SELECT * FROM(

SELECT ROWNUM NUM ,a.*  FROM (
SELECT * FROM BUY_COUNSELING ORDER BY counseling_date, application_date) a)n

WHERE NUM BETWEEN 11 AND 20;
SELECT * FROM BUY_COUNSELING;

SELECT ROWNUM ,a.*  FROM (SELECT * FROM BUY_COUNSELING ORDER BY counseling_date, application_date) a;

INSERT INTO BUY_COUNSELING VALUES(SEQ_BCNO.NEXTVAL, ?, ?, ?, sysdate, ?,?, ?, ?, DEFAULT);
DELETE FROM BUY_COUNSELING WHERE BC_NO = ?;
UPDATE BUY_COUNSELING SET CHECK_COUNSELING = ? WHERE BC_NO = ?;

---------------- ���Ż�� �� ----------------
---------------- �Խ��� ���� ----------------
DROP SEQUENCE SEQ_BOARD_NO;

--DELETE FROM BOARD;
DROP TABLE BOARD CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQ_BOARD_NO
    START WITH 100;
    
CREATE TABLE BOARD (
    BOARD_NO     VARCHAR2(100) ,                  -- �Խñ� ��ȣ
    WRITER          VARCHAR2(100),                  -- �ۼ���
    TITLE           VARCHAR2(100),                  -- ����
    CONTENTS        VARCHAR2(1000),                 -- ����
    FILE_ORIGIN     VARCHAR2(100),                  -- ÷������ORIGIN
    FILE_RENAME     VARCHAR2(100),                  -- ÷������RENAME
    READCOUNT       NUMBER      DEFAULT 0,          -- ��ȸ��
    CREATE_DATE     DATE        DEFAULT SYSDATE,    -- �Խñ� �ø� ��¥
    MODIFY_DATE     DATE        DEFAULT SYSDATE,    -- �Խñ� ���� ��¥
    CONSTRAINT PK_BOADR_NO PRIMARY KEY(BOARD_NO),
    CONSTRAINT FK_WRITER FOREIGN KEY(WRITER) REFERENCES MEMBER(ID) ON DELETE SET NULL
);

-- �׽�Ʈ�� ���� ����
BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'ADMIN', '�Խñ� ����AAAAA' ||SEQ_BOARD_NO.CURRVAL, '�Խñ� ����' ||SEQ_BOARD_NO.CURRVAL, NULL, NULL, DEFAULT, SYSDATE, SYSDATE);
    END LOOP;
    EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '1', '�Խñ� ����AAAAA' ||SEQ_BOARD_NO.CURRVAL, '�Խñ� ����' ||SEQ_BOARD_NO.CURRVAL, NULL, NULL, DEFAULT, SYSDATE, SYSDATE);
SELECT * FROM BOARD;

-- �Խñ� �ۼ�
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '4', 'test', 'test', null, null, DEFAULT, DEFAULT, DEFAULT);
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT);

-- �Խñ� ����
-- UPDATE BOARD SET TITLE='NORMAL', CONTENTS='NORMAL', FILE_ORIGIN='÷������ORIGIN', FILE_RENAME='��', MODIFY_DATE=SYSDATE WHERE BOARD_NO=100;
-- UPDATE BOARD SET TITLE=?, CONTENTS=?, FILE_ORIGIN=?, FILE_RENAME=?, MODIFY_DATE=SYSDATE WHERE BOARD_NO=?

-- �Խñ� ����
-- DELETE FROM BOARD WHERE board_no = 103;
-- DELETE FROM BOARD WHERE board_no = ?;

-- �� �Խñ� ����
-- SELECT COUNT(*) FROM BOARD;

-- ��ȸ�� ����
-- UPDATE BOARD SET READCOUNT=? WHERE BOARD_NO=?

/*
<�˻��� ���� �Խ��� ��ȸ
SELECT RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
FROM 
    (
    SELECT ROWNUM AS RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
    FROM (
        SELECT B.BOARD_NO, B.TITLE, M.ID, B.CREATE_DATE, B.FILE_ORIGIN, B.READCOUNT
        FROM BOARD B JOIN MEMBER M ON(B.WRITER = M.USER_NO)
    )
    BOARD WHERE ? LIKE ?
)
WHERE RNUM BETWEEN ? AND ?;
*/

/*
SELECT RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
FROM (
    SELECT ROWNUM AS RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
    FROM (
        SELECT B.BOARD_NO, B.TITLE, M.ID, B.CREATE_DATE, B.FILE_ORIGIN, B.READCOUNT
        FROM BOARD B JOIN MEMBER M ON(B.WRITER = M.USER_NO)
        ORDER BY BOARD_NO DESC
    )
    BOARD WHERE ID LIKE '%A%'
)
WHERE RNUM BETWEEN 1 AND 10;
*/

/*
<�Խ��� ����¡>
SELECT RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
FROM (
    SELECT ROWNUM AS RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
    FROM (
        SELECT B.BOARD_NO, B.TITLE, M.ID, B.CREATE_DATE, B.FILE_ORIGIN, B.READCOUNT
        FROM BOARD B JOIN MEMBER M ON(B.WRITER = M.USER_NO)
        )
    )
WHERE RNUM BETWEEN ? AND ?;
*/
SELECT RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
FROM (
    SELECT ROWNUM AS RNUM, BOARD_NO, TITLE, ID, CREATE_DATE, FILE_ORIGIN, READCOUNT
    FROM (
        SELECT B.BOARD_NO, B.TITLE, M.ID, B.CREATE_DATE, B.FILE_ORIGIN, B.READCOUNT
        FROM BOARD B JOIN MEMBER M ON(B.WRITER = M.ID)
        )
    )
WHERE RNUM BETWEEN 1 AND 10;

SELECT *
        FROM BOARD;
/*
<�Խ��� �� ��ȸ>
SELECT B.BOARD_NO, B.TITLE, M.ID, B.READCOUNT, B.FILE_ORIGIN, B.FILE_RENAME, B.CONTENTS, B.CREATE_DATE, B.MODIFY_DATE
FROM BOARD B
JOIN MEMBER M ON(B.WRITER = M.USER_NO)
WHERE B.BOARD_NO=?;
*/

/*
SELECT B.BOARD_NO, B.TITLE, M.ID, B.READCOUNT, B.FILE_ORIGIN, B.FILE_RENAME, B.CONTENTS, B.CREATE_DATE, B.MODIFY_DATE
FROM BOARD B
JOIN MEMBER M ON(B.WRITER = M.USER_NO)
WHERE B.BOARD_NO=100;
*/


---------------- �Խ��� �� -----------------
---------------- ��� ���� -----------------

DROP TABLE REPLY CASCADE CONSTRAINTS;

CREATE TABLE REPLY(
    REPLY_NO    VARCHAR2(100)   PRIMARY KEY,        -- ��� ��ȣ
    BOARD_NO    VARCHAR2(100),                      -- ��� �ۼ��� �Խù�
    WRITER      VARCHAR2(100),                      -- ��� �ۼ���
    CONTENTS    VARCHAR2(500),                      -- ��� ����
    CREATE_DATE DATE    DEFAULT SYSDATE,            -- ��� �ø� ��¥
    MODIFY_DATE DATE    DEFAULT SYSDATE            -- ��� ���� ��¥
    
);

DROP SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_REPLY_NO;

BEGIN 
    FOR N IN 1..10
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, '101', 'ADMIN', '��� �׽�Ʈ �Դϴ�', DEFAULT, DEFAULT);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
SELECT * FROM REPLY;



-- ��� �ۼ�
-- INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, '105', '4', '��� �׽�Ʈ �Դϴ�1111', DEFAULT, DEFAULT);
-- INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT);

-- ��� ����
-- DELETE FROM REPLY WHERE REPLY_NO = 4;
-- DELETE FROM REPLY WHERE REPLY_NO = ?;

/*
< �� �Խ����� ��� ����Ʈ ��ȸ>
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENTS, M.ID, R.CREATE_DATE, R.MODIFY_DATE
FROM REPLY R
JOIN MEMBER M ON(R.WRITER = M.USER_NO)
WHERE BOARD_NO = ?
ORDER BY REPLY_NO DESC
*/



---------------- ��� �� -----------------