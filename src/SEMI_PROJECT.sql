--SYSTEM에 입력할 아이디 생성 코드
CREATE USER semi IDENTIFIED BY semi;
GRANT RESOURCE, CONNECT TO semi;

-- 전체 삭제
DELETE FROM NEWS_API;
DROP TABLE NEWS_API;
-- 테이블 생성
    CREATE TABLE NEWS_API (  
    title VARCHAR2(200),
    originallink VARCHAR2(300),
	link VARCHAR2(300),
	description VARCHAR2(500),
    PUBDATE DATE
);

--전체 조회
SELECT * FROM NEWS_API ; 

--테스트용

 INSERT INTO  NEWS_API VALUES(?,?,?,?);
 
 COMMIT;
------------------------------뉴스 끝 --------------------------------
---------------------------충전소 정보 시작 ---------------------------
-- 전체 삭제
DELETE FROM EVCHARGER_API;
DROP TABLE EVCHARGER_API;
-- 테이블 생성
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

--전체 조회
SELECT * FROM EVCHARGER_API;

SELECT  STATID, STATNM, ADDR, LAT, LNG, USETIME,chgertype, stat, count(stat) count FROM evcharger_api  GROUP BY stat, STATID, STATNM, ADDR, USETIME, LAT, LNG,chgertype;

SELECT  STATID, STATNM, ADDR, LAT, LNG, USETIME, stat, count(stat) count FROM evcharger_api GROUP BY stat, STATID, STATNM, ADDR, USETIME, LAT, LNG;
 ----------------전기차 시작 ------------

-- 전체 삭제
DELETE FROM EV;
DROP TABLE EV;

-- 테이블 생성
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

--조회

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
WHERE modelname LIKE '%테%' OR company LIKE '%테%')
WHERE RNUM BETWEEN 1 AND 10;


select * from ev order by price desc;
delete from ev where modelname = '벤츠test';
select * from ev;

select * from ev where modelname like '%테%' or company like '%제네%';
update ev set price=119800000 where modelName='2021 아우디 e-트론 스포트백' and modelsub='50 Quattro';

SELECT modelName,modelSub,readcount FROM ev WHERE modelName='2021 테슬라 모델Y' AND modelSub='Dual Motor AWD';
UPDATE ev SET readcount=1 WHERE modelName='2021 테슬라 모델Y' AND modelSub='Dual Motor AWD';

select * from ev order by price asc;
select * from ev order by price desc;
select * from ev order by readcount desc;

commit;
 
 ----------------전기차 끝 ------------
 ---------------- 회원 시작 ----------------
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

---------------- 회원 끝 ----------------
 ---------------공지사항 시작----------
DELETE FROM FAQ;
DROP TABLE FAQ;

CREATE TABLE FAQ(
    TITLE       VARCHAR2(100),               
    CONTENTS   VARCHAR2(1000)
);

--SELECT * FROM FAQ;
INSERT INTO FAQ VALUES('구매상담만 가능합니다','우리는 구매상담신청을 받아 딜러와 연결하여 상담만 가능합니다. 따라서 구매가 가능하지 않으니 구매 상담신청시 이점 참고하시기 바랍니다.');
INSERT INTO FAQ VALUES('딜러 선택 및 변경이 가능합니다','만약 사용자와 소통하는 딜러와 의사소통이 잘 되지 않는다면 딜러 목록을 보여드려 사용자 마음에 드는 딜러를 선택할 수 있습니다. 변경은 1회만 가능한 점 참고바랍니다.');
INSERT INTO FAQ VALUES('월간점검이 진행됩니다',' 매월 셋째주 목요일은 전기차 및 전기차 충전소 등록 업데이트가 진행됩니다. 따라서 홈페이지 방문은 가능하지만 전기차 조회 및 충전소 조회는 불가능합니다.');
INSERT INTO FAQ VALUES(' 사용자상담은 코로나로 인해 카카오톡 상담으로만 가능합니다',' 코로나 5단계까지 상향되어서 사용자상담 콜센터는 잠시 운영이 중단되었습니다. 따라서 카카오톡 플러스 친구로만 상담이 가능하며 가능한 빠른 답변을 해드리겠습니다. 카카오톡 친구 플러스 아이디는 momomo motors입니다.');

COMMIT;

SELECT * FROM FAQ;

DELETE FROM FAQ;

 ---------------공지사항 끝----------
   ---------------- 구매상담 시작 ----------------
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
    CHECK_COUNSELING VARCHAR2(20) DEFAULT '미확인'
);

INSERT INTO BUY_COUNSELING VALUES(
    SEQ_BCNO.NEXTVAL,
    'ADMIN',
    'ADMIN',
    '01012345678',
    '2021 테슬라 모델 Y',
    sysdate+10,
    '2021/12/01',
    '11:00~12:00',
    '블로그',
    '없음',
    '확인 완료'
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

---------------- 구매상담 끝 ----------------
---------------- 게시판 시작 ----------------
DROP SEQUENCE SEQ_BOARD_NO;

--DELETE FROM BOARD;
DROP TABLE BOARD CASCADE CONSTRAINTS;

CREATE SEQUENCE SEQ_BOARD_NO
    START WITH 100;
    
CREATE TABLE BOARD (
    BOARD_NO     VARCHAR2(100) ,                  -- 게시글 번호
    WRITER          VARCHAR2(100),                  -- 작성자
    TITLE           VARCHAR2(100),                  -- 제목
    CONTENTS        VARCHAR2(1000),                 -- 내용
    FILE_ORIGIN     VARCHAR2(100),                  -- 첨부파일ORIGIN
    FILE_RENAME     VARCHAR2(100),                  -- 첨부파일RENAME
    READCOUNT       NUMBER      DEFAULT 0,          -- 조회수
    CREATE_DATE     DATE        DEFAULT SYSDATE,    -- 게시글 올린 날짜
    MODIFY_DATE     DATE        DEFAULT SYSDATE,    -- 게시글 수정 날짜
    CONSTRAINT PK_BOADR_NO PRIMARY KEY(BOARD_NO),
    CONSTRAINT FK_WRITER FOREIGN KEY(WRITER) REFERENCES MEMBER(ID) ON DELETE SET NULL
);

-- 테스트용 예시 생성
BEGIN
    FOR N IN 1..10
    LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'ADMIN', '게시글 제목AAAAA' ||SEQ_BOARD_NO.CURRVAL, '게시글 내용' ||SEQ_BOARD_NO.CURRVAL, NULL, NULL, DEFAULT, SYSDATE, SYSDATE);
    END LOOP;
    EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '1', '게시글 제목AAAAA' ||SEQ_BOARD_NO.CURRVAL, '게시글 내용' ||SEQ_BOARD_NO.CURRVAL, NULL, NULL, DEFAULT, SYSDATE, SYSDATE);
SELECT * FROM BOARD;

-- 게시글 작성
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '4', 'test', 'test', null, null, DEFAULT, DEFAULT, DEFAULT);
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT);

-- 게시글 수정
-- UPDATE BOARD SET TITLE='NORMAL', CONTENTS='NORMAL', FILE_ORIGIN='첨부파일ORIGIN', FILE_RENAME='굿', MODIFY_DATE=SYSDATE WHERE BOARD_NO=100;
-- UPDATE BOARD SET TITLE=?, CONTENTS=?, FILE_ORIGIN=?, FILE_RENAME=?, MODIFY_DATE=SYSDATE WHERE BOARD_NO=?

-- 게시글 삭제
-- DELETE FROM BOARD WHERE board_no = 103;
-- DELETE FROM BOARD WHERE board_no = ?;

-- 총 게시글 개수
-- SELECT COUNT(*) FROM BOARD;

-- 조회수 증가
-- UPDATE BOARD SET READCOUNT=? WHERE BOARD_NO=?

/*
<검색에 따른 게시판 조회
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
<게시판 페이징>
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
<게시판 상세 조회>
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


---------------- 게시판 끝 -----------------
---------------- 댓글 시작 -----------------

DROP TABLE REPLY CASCADE CONSTRAINTS;

CREATE TABLE REPLY(
    REPLY_NO    VARCHAR2(100)   PRIMARY KEY,        -- 댓글 번호
    BOARD_NO    VARCHAR2(100),                      -- 댓글 작성한 게시물
    WRITER      VARCHAR2(100),                      -- 댓글 작성자
    CONTENTS    VARCHAR2(500),                      -- 댓글 내용
    CREATE_DATE DATE    DEFAULT SYSDATE,            -- 댓글 올린 날짜
    MODIFY_DATE DATE    DEFAULT SYSDATE            -- 댓글 수정 날짜
    
);

DROP SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_REPLY_NO;

BEGIN 
    FOR N IN 1..10
    LOOP
        INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, '101', 'ADMIN', '댓글 테스트 입니다', DEFAULT, DEFAULT);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;
SELECT * FROM REPLY;



-- 댓글 작성
-- INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, '105', '4', '댓글 테스트 입니다1111', DEFAULT, DEFAULT);
-- INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT);

-- 댓글 삭제
-- DELETE FROM REPLY WHERE REPLY_NO = 4;
-- DELETE FROM REPLY WHERE REPLY_NO = ?;

/*
< 한 게시판의 댓글 리스트 조회>
SELECT R.REPLY_NO, R.BOARD_NO, R.CONTENTS, M.ID, R.CREATE_DATE, R.MODIFY_DATE
FROM REPLY R
JOIN MEMBER M ON(R.WRITER = M.USER_NO)
WHERE BOARD_NO = ?
ORDER BY REPLY_NO DESC
*/



---------------- 댓글 끝 -----------------