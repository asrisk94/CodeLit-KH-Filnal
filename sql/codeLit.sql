--=============================================
-- 테이블 CREATE문
--=============================================
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;

CREATE TABLE "MEMBER" (
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(300)		NOT NULL,
	"MEMBER_PROFILE"	VARCHAR2(200)		NULL,
	"MEMBER_RE_PROFILE"	VARCHAR2(200)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원가입시 필수';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원가입시 필수 (암호화)';

DROP TABLE "LECTURE" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE" (
	"LECTURE_NO"	NUMBER		NOT NULL,
	"REF_LEC_CAT_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"LECTURE_NAME"	VARCHAR2(150)		NOT NULL,
	"LECTURE_TYPE"	CHAR(1)		NOT NULL,
	"LECTURE_INTRO"	VARCHAR2(3000)		NOT NULL,
	"LECTURE_THUMB_ORIGIN"	VARCHAR2(200)		NULL,
	"LECTURE_THUMB_RENAMED"	VARCHAR2(200)		NULL,
	"LECTURE_PRICE"	NUMBER		NULL,
	"LECTURE_ACCEPT_YN"	CHAR(1)	DEFAULT 'W'	NOT NULL,
	"LECTURE_GUIDELINE"	NUMBER	DEFAULT 1	NULL
);

COMMENT ON COLUMN "LECTURE"."LECTURE_NO" IS 'SEQ_LEC_NO';
COMMENT ON COLUMN "LECTURE"."REF_LEC_CAT_NO" IS 'SEQ_LEC_CAT_NO';
COMMENT ON COLUMN "LECTURE"."REF_MEMBER_ID" IS '회원가입시 필수';
COMMENT ON COLUMN "LECTURE"."LECTURE_INTRO" IS '값이 html코드로 들어갈지 고민';
COMMENT ON COLUMN "LECTURE"."LECTURE_GUIDELINE" IS '하루에 들을 강의갯수 추천';

DROP TABLE "BASKET" CASCADE CONSTRAINTS;
CREATE TABLE "BASKET" (
	"BASKET_NO"	NUMBER		NOT NULL,
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"BASKET_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "BASKET"."BASKET_NO" IS 'seq_basket_no';

DROP TABLE "PICK" CASCADE CONSTRAINTS;
CREATE TABLE "PICK" (
	"PICK_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"PICK_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PICK"."PICK_NO" IS 'seq_pick_no';

DROP TABLE "MESSENGER" CASCADE CONSTRAINTS;
CREATE TABLE "MESSENGER" (
	"MSG_NO"	NUMBER		NOT NULL,
	"REF_WRITER_ID"	VARCHAR2(20),
	"REF_RECEIVER_ID"	VARCHAR2(20)		NOT NULL,
	"MSG_TITLE"	VARCHAR2(200)		NOT NULL,
	"MSG_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"MSG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "MESSENGER"."MSG_NO" IS 'seq_msg_no';

DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20),
	"NOTICE_TITLE"	VARCHAR2(200)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"NOTICE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"NOTICE_COUNT"	NUMBER	DEFAULT 0	NOT NULL
);

DROP TABLE "STUDY_BOARD" CASCADE CONSTRAINTS;
CREATE TABLE "STUDY_BOARD" (
	"STD_BRD_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"REF_LECTURE_NO"	NUMBER,
	"STD_BRD_TITLE"	VARCHAR2(100)		NOT NULL,
	"STD_BRD_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"STD_BRD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STD_BRD_COUNT"	NUMBER	DEFAULT 0	NOT NULL
);

DROP TABLE "LECTURE_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_CATEGORY" (
	"LEC_CAT_NO"	NUMBER		NOT NULL,
	"LEC_CAT_NAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "LECTURE_CATEGORY"."LEC_CAT_NO" IS 'SEQ_LEC_CAT_NO';

DROP TABLE "COUNSEL" CASCADE CONSTRAINTS;
CREATE TABLE "COUNSEL" (
	"COUNSEL_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20),
	"COUNSEL_TITLE"	VARCHAR2(200)		NOT NULL,
	"COUNSEL_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"COUNSEL_Q_NO"	NUMBER		NULL,
	"COUNSEL_LEVEL"	NUMBER	DEFAULT 1	NOT NULL,
	"COUNSEL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "COUNSEL"."COUNSEL_NO" IS 'seq_counsel_no';
COMMENT ON COLUMN "COUNSEL"."REF_MEMBER_ID" IS '작성자 아이디';
COMMENT ON COLUMN "COUNSEL"."COUNSEL_CATEGORY" IS '문의글 카테고리';
COMMENT ON COLUMN "COUNSEL"."COUNSEL_Q_NO" IS '참조중인 문의번호';
COMMENT ON COLUMN "COUNSEL"."COUNSEL_LEVEL" IS '1 질문 2 답변';

DROP TABLE "COUNSELING_CHAT" CASCADE CONSTRAINTS;
CREATE TABLE "COUNSELING_CHAT" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"SENDER_ID"	VARCHAR2(20)		NOT NULL,
	"RECEIVER_ID"	VARCHAR2(20)		NOT NULL,
	"CHAT_CONTENT"	VARCHAR2(200)		NOT NULL,
	"CHAT_REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "COUNSELING_CHAT"."CHAT_NO" IS 'SEQ_CHAT_NO';

DROP TABLE "PAYMENT" CASCADE CONSTRAINTS;
CREATE TABLE "PAYMENT" (
	"PAY_CODE"	VARCHAR2(40)		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20),
	"PAY_NO"	NUMBER		NOT NULL,
	"PAY_COST"	NUMBER		NOT NULL,
	"PAY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PAYMENT"."PAY_NO" IS 'seq_pay_no';

DROP TABLE "LECTURE_PART" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_PART" (
	"LECTURE_PART_NO"	NUMBER		NOT NULL,
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"LECTURE_PART_TITLE"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "LECTURE_PART"."LECTURE_PART_NO" IS 'SEQ_LEC_PART_NO';

DROP TABLE "STUDY_COMMENT" CASCADE CONSTRAINTS;
CREATE TABLE "STUDY_COMMENT" (
	"STD_CMT_NO"	NUMBER		NOT NULL,
	"REF_STD_BRD_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20),
	"STD_CMT_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"STD_CMT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

DROP TABLE "SEARCH" CASCADE CONSTRAINTS;
CREATE TABLE "SEARCH" (
	"SEARCH_KEYWORD"	VARCHAR2(100)		NOT NULL,
	"SEARCH_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL
);

DROP TABLE "LECTURE_COMMENT" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_COMMENT" (
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20),
	"LEC_ASSESSMENT"	NUMBER		NOT NULL,
	"LEC_COMMENT"	VARCHAR2(1500)		NOT NULL,
    "LEC_CMT_ENROLL_DATE"   DATE    DEFAULT sysdate NOT NULL
);

COMMENT ON COLUMN "LECTURE_COMMENT"."REF_LECTURE_NO" IS 'SEQ_LEC_NO';

DROP TABLE "LECTURE_CLICK" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_CLICK" (
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"CLICK_NO"	NUMBER		NULL
);

DROP TABLE "LECTURE_PROGRESS" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_PROGRESS" (
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"REF_LEC_CHAPTER_NO"	NUMBER		NOT NULL,
	"SECTION_SIGN_UP_YN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SECTION_SIGN_UP_PROGRESS"	NUMBER		NULL,
	"SECTION_START_DATE"	DATE		NULL,
	"SECTION_END_DATE"	DATE		NULL
);

COMMENT ON COLUMN "LECTURE_PROGRESS"."REF_LEC_CHAPTER_NO" IS 'SEQ_LEC_CHAPTER_NO';
COMMENT ON COLUMN "LECTURE_PROGRESS"."SECTION_SIGN_UP_PROGRESS" IS '구현가능 시 사용';
COMMENT ON COLUMN "LECTURE_PROGRESS"."SECTION_START_DATE" IS '구현 가능시 사용';
COMMENT ON COLUMN "LECTURE_PROGRESS"."SECTION_END_DATE" IS '구현 가능시 사용';

DROP TABLE "TEACHER" CASCADE CONSTRAINTS;
CREATE TABLE "TEACHER" (
	"REF_MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"TEACHER_NAME"	VARCHAR2(20)		NOT NULL,
	"TEACHER_PHONE"	VARCHAR2(11)		NOT NULL,
	"REF_LEC_CAT_NO"	NUMBER		NOT NULL,
	"TEACHER_INTRODUCE"	VARCHAR2(3000)		NOT NULL,
	"TEACHER_LINK"	VARCHAR2(500)		NOT NULL,
	"TEACHER_BANK"	VARCHAR2(30)		NOT NULL,
	"TEACHER_ACCOUNT"	VARCHAR2(30)		NOT NULL,
	"TEACHER_ACC_NAME"	VARCHAR2(20)		NOT NULL
);

DROP TABLE "ATTACHMENT" CASCADE CONSTRAINTS;
CREATE TABLE "ATTACHMENT" (
	"ATTACH_NO"	NUMBER		NOT NULL,
	"REF_CONTENTS_NO"	NUMBER		NOT NULL,
	"ORIGINAL_FILENAME"	VARCHAR2(200)		NOT NULL,
	"RENAMED_FILENAME"	VARCHAR2(200)		NOT NULL,
	"REF_CONTENTS_GROUP_CODE"	VARCHAR2(3)		NOT NULL
);

COMMENT ON COLUMN "ATTACHMENT"."ATTACH_NO" IS 'SEQ_ATTACH_NO';
COMMENT ON COLUMN "ATTACHMENT"."REF_CONTENTS_NO" IS '어느 컨텐츠의  첨부파일인지';

DROP TABLE "CONTENTS_GROUP" CASCADE CONSTRAINTS;
CREATE TABLE "CONTENTS_GROUP" (
	"CONTENTS_GROUP_CODE"	VARCHAR2(3)		NOT NULL,
	"CONTENTS_GROUP_NAME"	VARCHAR2(20)		NOT NULL,
	"CONTENTS_ATTACH_PATH"	VARCHAR2(100)		NOT NULL
);

DROP TABLE "PAY_LECTURE" CASCADE CONSTRAINTS;
CREATE TABLE "PAY_LECTURE" (
	"PAY_CODE"	VARCHAR2(40)		NOT NULL,
	"REF_LECTURE_NO"	NUMBER
);

COMMENT ON COLUMN "PAY_LECTURE"."REF_LECTURE_NO" IS 'SEQ_LEC_NO';

DROP TABLE "LECTURE_CHAPTER" CASCADE CONSTRAINTS;
CREATE TABLE "LECTURE_CHAPTER" (
	"LEC_CHAPTER_NO"	NUMBER		NOT NULL,
	"REF_LEC_PART_NO"	NUMBER		NOT NULL,
	"LEC_CHAPTER_TITLE"	VARCHAR2(50)		NULL,
	"LEC_CHAPTER_VIDEO"	VARCHAR2(200)		NULL,
	"LEC_CHAPTER_RE_VIDEO"	VARCHAR2(200)		NULL
);

COMMENT ON COLUMN "LECTURE_CHAPTER"."LEC_CHAPTER_NO" IS 'SEQ_LEC_CHAPTER_NO';
COMMENT ON COLUMN "LECTURE_CHAPTER"."REF_LEC_PART_NO" IS 'SEQ_LEC_PART_NO';

DROP TABLE "STREAMING_DATE" CASCADE CONSTRAINTS;
CREATE TABLE "STREAMING_DATE" (
	"REF_LECTURE_NO"	NUMBER		NOT NULL,
	"STREAMING_DATE"	DATE		NOT NULL,
	"STREAMING_CNT"	NUMBER		NULL
);

COMMENT ON COLUMN "STREAMING_DATE"."STREAMING_CNT" IS '총 순서중 몇번째 강의인지(트리거로 짜면 될듯)';

DROP TABLE "LEC_STREAMING_SESSION" CASCADE CONSTRAINTS;
CREATE TABLE "LEC_STREAMING_SESSION" (
	"LECTURE_NO"	NUMBER		NOT NULL,
	"LEC_STREAM_SESSION"	VARCHAR2(200)		NOT NULL
);

COMMENT ON COLUMN "LEC_STREAMING_SESSION"."LECTURE_NO" IS 'SEQ_LEC_NO';

DROP TABLE "AUTHORITIES" CASCADE CONSTRAINTS;
CREATE TABLE "AUTHORITIES" (
	"AUTH"	VARCHAR2(50)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "AUTHORITIES"."MEMBER_ID" IS '회원가입시 필수';

-- remember-me 관련테이블 persistent_logins
DROP TABLE PERSISTENT_LOGINS;
CREATE TABLE PERSISTENT_LOGINS (
    USERNAME VARCHAR2(64) NOT NULL,
    SERIES VARCHAR2(64) PRIMARY KEY,
    TOKEN VARCHAR2(64) NOT NULL, -- username, password, expiry time 등을 hashing한 값
    LAST_USED TIMESTAMP NOT NULL
);

--================================
-- PK
--================================
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_ID"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "PK_LECTURE" PRIMARY KEY (
	"LECTURE_NO"
);

ALTER TABLE "BASKET" ADD CONSTRAINT "PK_BASKET" PRIMARY KEY (
	"BASKET_NO"
);

ALTER TABLE "PICK" ADD CONSTRAINT "PK_PICK" PRIMARY KEY (
	"PICK_NO"
);

ALTER TABLE "MESSENGER" ADD CONSTRAINT "PK_MESSENGER" PRIMARY KEY (
	"MSG_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "STUDY_BOARD" ADD CONSTRAINT "PK_STUDY_BOARD" PRIMARY KEY (
	"STD_BRD_NO"
);

ALTER TABLE "LECTURE_CATEGORY" ADD CONSTRAINT "PK_LECTURE_CATEGORY" PRIMARY KEY (
	"LEC_CAT_NO"
);

ALTER TABLE "COUNSEL" ADD CONSTRAINT "PK_COUNSEL" PRIMARY KEY (
	"COUNSEL_NO"
);

ALTER TABLE "COUNSELING_CHAT" ADD CONSTRAINT "PK_COUNSELING_CHAT" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"PAY_CODE"
);

ALTER TABLE "LECTURE_PART" ADD CONSTRAINT "PK_LECTURE_PART" PRIMARY KEY (
	"LECTURE_PART_NO"
);

ALTER TABLE "STUDY_COMMENT" ADD CONSTRAINT "PK_STUDY_COMMENT" PRIMARY KEY (
	"STD_CMT_NO"
);

ALTER TABLE "TEACHER" ADD CONSTRAINT "PK_TEACHER" PRIMARY KEY (
	"REF_MEMBER_ID"
);

ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY (
	"ATTACH_NO"
);

ALTER TABLE "CONTENTS_GROUP" ADD CONSTRAINT "PK_CONTENTS_GROUP" PRIMARY KEY (
	"CONTENTS_GROUP_CODE"
);

ALTER TABLE "LECTURE_CHAPTER" ADD CONSTRAINT "PK_LECTURE_CHAPTER" PRIMARY KEY (
	"LEC_CHAPTER_NO"
);

ALTER TABLE "AUTHORITIES" ADD CONSTRAINT "PK_AUTHORITIES" PRIMARY KEY (
	"AUTH",
	"MEMBER_ID"
);

ALTER TABLE "LECTURE_CLICK" ADD CONSTRAINT "PK_LECTURE_CLICK" PRIMARY KEY (
	"REF_LECTURE_NO", 
	"REF_MEMBER_ID"
);

--================================
-- FK
--================================
ALTER TABLE "LECTURE" ADD CONSTRAINT "FK_LEC_CAT_TO_LEC_1" FOREIGN KEY (
	"REF_LEC_CAT_NO"
)
REFERENCES "LECTURE_CATEGORY" (
	"LEC_CAT_NO"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "BASKET" ADD CONSTRAINT "FK_LECTURE_TO_BASKET_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "BASKET" ADD CONSTRAINT "FK_MEMBER_TO_BASKET_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "PICK" ADD CONSTRAINT "FK_MEMBER_TO_PICK_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "PICK" ADD CONSTRAINT "FK_LECTURE_TO_PICK_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "MESSENGER" ADD CONSTRAINT "FK_MEMBER_TO_MESSENGER_1" FOREIGN KEY (
	"REF_WRITER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;

ALTER TABLE "MESSENGER" ADD CONSTRAINT "FK_MEMBER_TO_MESSENGER_2" FOREIGN KEY (
	"REF_RECEIVER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;

ALTER TABLE "STUDY_BOARD" ADD CONSTRAINT "FK_MEMBER_TO_STUDY_BOARD_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "STUDY_BOARD" ADD CONSTRAINT "FK_LEC_TO_STUDY_BRD_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE SET NULL;

ALTER TABLE "COUNSEL" ADD CONSTRAINT "FK_MEMBER_TO_COUNSEL_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;
-- 일반 회원 삭제시에 해당 아이디의 질문과 거기에 달린 답변 삭제 trigger 필요

ALTER TABLE "COUNSELING_CHAT" ADD CONSTRAINT "FK_MEMBER_TO_COUNSEL_CHAT_1" FOREIGN KEY (
	"SENDER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;
-- 웹소켓 고려 (db 고민)

ALTER TABLE "COUNSELING_CHAT" ADD CONSTRAINT "FK_MEMBER_TO_COUNSEL_CHAT_2" FOREIGN KEY (
	"RECEIVER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;
-- 웹소켓 고려 (db 고민)

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_MEMBER_TO_PAYMENT_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;

ALTER TABLE "LECTURE_PART" ADD CONSTRAINT "FK_LEC_TO_LEC_PART_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;


ALTER TABLE "STUDY_COMMENT" ADD CONSTRAINT "FK_STUDY_BRD_TO_STUDY_CMT_1" FOREIGN KEY (
	"REF_STD_BRD_NO"
)
REFERENCES "STUDY_BOARD" (
	"STD_BRD_NO"
)
ON DELETE CASCADE;



ALTER TABLE "STUDY_COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_STUDY_COMMENT_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;

ALTER TABLE "SEARCH" ADD CONSTRAINT "FK_MEMBER_TO_SEARCH_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_COMMENT" ADD CONSTRAINT "FK_LECTURE_TO_LEC_CMT_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_LEC_CMT_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE SET NULL;

ALTER TABLE "LECTURE_CLICK" ADD CONSTRAINT "FK_LECTURE_TO_LEC_CLK_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_CLICK" ADD CONSTRAINT "FK_MEMBER_TO_LEC_CLK_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_PROGRESS" ADD CONSTRAINT "FK_MEMBER_TO_LEC_PROG_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_PROGRESS" ADD CONSTRAINT "FK_LEC_TO_LEC_PROG_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "LECTURE_PROGRESS" ADD CONSTRAINT "FK_LEC_CHAP_TO_LEC_PROG_1" FOREIGN KEY (
	"REF_LEC_CHAPTER_NO"
)
REFERENCES "LECTURE_CHAPTER" (
	"LEC_CHAPTER_NO"
)
ON DELETE CASCADE;

ALTER TABLE "TEACHER" ADD CONSTRAINT "FK_MEMBER_TO_TEACHER_1" FOREIGN KEY (
	"REF_MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

ALTER TABLE "TEACHER" ADD CONSTRAINT "FK_LEC_CAT_TO_TEACH_1" FOREIGN KEY (
	"REF_LEC_CAT_NO"
)
REFERENCES "LECTURE_CATEGORY" (
	"LEC_CAT_NO"
);

ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "FK_CONTENTS_GRP_TO_ATTACH_1" FOREIGN KEY (
	"REF_CONTENTS_GROUP_CODE"
)
REFERENCES "CONTENTS_GROUP" (
	"CONTENTS_GROUP_CODE"
);

ALTER TABLE "PAY_LECTURE" ADD CONSTRAINT "FK_PAYMENT_TO_PAY_LECTURE_1" FOREIGN KEY (
	"PAY_CODE"
)
REFERENCES "PAYMENT" (
	"PAY_CODE"
)
ON DELETE CASCADE;

ALTER TABLE "PAY_LECTURE" ADD CONSTRAINT "FK_LECTURE_TO_PAY_LECTURE_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE SET NULL;

ALTER TABLE "LECTURE_CHAPTER" ADD CONSTRAINT "FK_LEC_PART_TO_LEC_CHAP_1" FOREIGN KEY (
	"REF_LEC_PART_NO"
)
REFERENCES "LECTURE_PART" (
	"LECTURE_PART_NO"
)
ON DELETE CASCADE;

ALTER TABLE "STREAMING_DATE" ADD CONSTRAINT "FK_LEC_TO_STREAM_DATE_1" FOREIGN KEY (
	"REF_LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "LEC_STREAMING_SESSION" ADD CONSTRAINT "FK_LEC_TO_LEC_STREAM_SESSION_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
)
ON DELETE CASCADE;

ALTER TABLE "AUTHORITIES" ADD CONSTRAINT "FK_MEMBER_TO_AUTHORITIES_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MEMBER_ID"
)
ON DELETE CASCADE;

--=============================================
-- sequence
--=============================================
DROP SEQUENCE SEQ_LEC_NO;
CREATE SEQUENCE SEQ_LEC_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_LEC_CAT_NO;
CREATE SEQUENCE SEQ_LEC_CAT_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_BASKET_NO;
CREATE SEQUENCE SEQ_BASKET_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_PICK_NO;
CREATE SEQUENCE SEQ_PICK_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_MSG_NO;
CREATE SEQUENCE SEQ_MSG_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_COUNSEL_NO;
CREATE SEQUENCE SEQ_COUNSEL_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_CHAT_NO;
CREATE SEQUENCE SEQ_CHAT_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_PAY_NO;
CREATE SEQUENCE SEQ_PAY_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_LEC_PART_NO;
CREATE SEQUENCE SEQ_LEC_PART_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_LEC_CHAPTER_NO;
CREATE SEQUENCE SEQ_LEC_CHAPTER_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_ATTACH_NO;
CREATE SEQUENCE SEQ_ATTACH_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_NOTICE_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_STD_BRD_NO;
CREATE SEQUENCE SEQ_STD_BRD_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_COMMENT_NO;
CREATE SEQUENCE SEQ_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

--=============================================
-- PL/SQL
--=============================================

-- 회원가입시 user authority 부여하는 트리거
create or replace trigger trg_auth
    after
    insert on member
    for each row
begin
    insert into authorities
    values ('ROLE_USER', :new.member_id);
end;
/


-- 강의 조회수 올리는 프로시져
create or replace procedure proc_upsert_lecture_click (
    p_ref_lecture_no in lecture_click.ref_lecture_no%type,
    p_ref_member_id in lecture_click.ref_member_id%type
)
is
    cnt number := 0;
begin
    select count(*)
    into cnt
    from lecture_click
    where ref_member_id = p_ref_member_id
        and ref_lecture_no = p_ref_lecture_no;
    dbms_output.put_line('cnt = ' || cnt);
    if cnt = 0 then
        -- insert
        insert into lecture_click
        values(p_ref_lecture_no, p_ref_member_id, 1);
    else
        -- update
        update lecture_click
        set click_no = (click_no + 1)
        where ref_member_id = p_ref_member_id
            and ref_lecture_no = p_ref_lecture_no;
    end if;
    commit;
end;
/

--=============================================
-- 테스트 데이터 insert문
--=============================================


--회원
insert into member values ('admin', '$2a$10$X8GL750RHq/TpQh9hVPnd.Krj13dW5QlKAvUIbIIVI.dPVzPYUmd2', null, null);
insert into authorities values ('ROLE_ADMIN', 'admin');
insert into authorities values ('ROLE_USER', 'admin');

insert into member values ('user', '$2a$10$X8GL750RHq/TpQh9hVPnd.Krj13dW5QlKAvUIbIIVI.dPVzPYUmd2', null, null);
insert into authorities values ('ROLE_USER', 'user');

insert into member values ('teacher', '$2a$10$X8GL750RHq/TpQh9hVPnd.Krj13dW5QlKAvUIbIIVI.dPVzPYUmd2', null, null);
insert into authorities values ('ROLE_TEACHER', 'teacher');
insert into authorities values ('ROLE_USER', 'teacher');

insert into member values ('test', '$2a$10$X8GL750RHq/TpQh9hVPnd.Krj13dW5QlKAvUIbIIVI.dPVzPYUmd2', null, null);
insert into authorities values ('ROLE_USER', 'test');

-- 강의 카테고리
insert into lecture_category values(seq_lec_cat_no.nextval, '프런트');
insert into lecture_category values(seq_lec_cat_no.nextval, '백엔드');
insert into lecture_category values(seq_lec_cat_no.nextval, '빅데이터');

--컨텐츠 그룹
insert into contents_group values('LH', '강의 첨부파일', '/resources/upload/lecture/handouts');
insert into contents_group values('N', '공지사항', '/resources/upload/notice');
insert into contents_group values('SB', '공부 게시판', '/resources/upload/studyBoard');
insert into contents_group values('C', '1대1문의', '/resources/upload/counsel');

commit;

--강의 테스트 데이터 50개 삽입 프로시저
begin
    for n in 1..50 loop
        insert into
			lecture
		values (
			seq_lec_no.nextval,
			trunc(dbms_random.value(5,8)),
			'teacher',
			'테스트 강의' || n,
			'V',
			'테스트 강의' || n || ' 입니다',
			'banner1.jpg',
			'20210517_134626520_001.jpg',
			0,
			'Y',
			default
        );
    end loop;
    commit;
end;
/

--강의후기 테스트 데이터 150개
begin
    for n in 1..150 loop
        insert into
			lecture_comment
		values (
			trunc(dbms_random.value(3,20)), -- 실제로 있는 강의 번호값 중에 난수 뽑을 것
			'user', -- 실제로 있는 member_id 쓸것
			trunc(dbms_random.value(1,6)),
			'좋은 강의네여',
			default
        );
    end loop;
    commit;
end;
/

--강의커리큘럼 삽입 프로시저
begin
    for n in 1..10 loop
        insert into lecture_part
        values(
            seq_lec_part_no.nextval,
            3,
            '파트 ' || n
        );
    end loop;
    commit;
end;
/

--강의커리큘럼 삽입 프로시저
begin
    for n in 1..10 loop
        insert into lecture_part
        values(
            seq_lec_part_no.nextval,
            3,
            '파트 ' || n
        );
    end loop;
    commit;
end;
/

begin
    for n in 1..11 loop
        for m in 1..10 loop
            insert into lecture_chapter
            values(
                seq_lec_chapter_no.nextval,
                n,
                '챕터 ' || m,
                null,
                null
            );
        end loop;
    end loop;
    commit;
end;
/