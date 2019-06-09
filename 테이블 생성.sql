CREATE TABLE brand(
   brand_num       NUMBER(5) , 
   brand_name       VARCHAR2(30)    NOT NULL, 
   brand_license_num       NUMBER(20)     NOT NULL,
   CONSTRAINT brand_pk PRIMARY KEY(brand_num),
   CONSTRAINT brand_name_uk UNIQUE(brand_name),
   CONSTRAINT brand_lic_uk UNIQUE(brand_license_num));

CREATE SEQUENCE SEQ_brand
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'토니모리',2018136031);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'랑콤',2019136023);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'이니스프리',2018146056);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'더페이스샵',2017136079);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'삐야',2018137079);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'샤넬' ,2017133378);
INSERT INTO brand VALUES(SEQ_brand.NEXTVAL,'네이처리퍼블릭',2015136079);

commit;

CREATE TABLE youtuber(      
   youtuber_num      NUMBER(5), 
   youtuber_name      VARCHAR2(10)    NOT NULL,
   youtuber_nickname   VARCHAR2(35)  NOT NULL,
   subscriber_cnt      NUMBER(20) NOT NULL,
   CONSTRAINT youtuber_num_pk PRIMARY KEY(youtuber_num),
   CONSTRAINT subscriber_cnt_check CHECK(subscriber_cnt >= 100000),
   CONSTRAINT youtuber_youtuber_uk UNIQUE(youtuber_nickname));

CREATE SEQUENCE SEQ_youtuber
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'박혜민', 'PONY MAKUP',2200275);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'최수혜 ','SSIN 씬님',1200964);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'이효민 ','Sunny is Channel',877569);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'최서희','Calary Girl 회사원A',837207);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'박수현 ','다또아',823574);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'최초록','윤짜미 YoonCharmi',697620);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'김수현 ', 'Risabae 이사베', 684412);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'이재성','이씨',133600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'조선주','조장님',72600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'이지원','또아',76600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'라효진','마우스',6954219);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'김은경','db_master',600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'김하영','fnaap',335600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'한승재','어른아이',1600651);
INSERT INTO youtuber VALUES(SEQ_youtuber.NEXTVAL,'장기환','군인',3600651);

commit;


CREATE TABLE prefer_pro(
   pro_num    NUMBER(5) , 
   youtuber_num   NUMBER(5) , 
   CONSTRAINT prefer_n_youtuber_n_pk PRIMARY KEY(pro_num , youtuber_num),
   CONSTRAINT prefer_youtuber_FK FOREIGN KEY (youtuber_num) 
            REFERENCES youtuber(youtuber_num));

CREATE SEQUENCE SEQ_prefer_pro
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,1);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,2);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,3);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,5);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,8);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,5);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,2);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,2);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,8);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,6);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,6);
INSERT INTO prefer_pro VALUES(SEQ_prefer_pro.NEXTVAL,6);


commit;


CREATE TABLE video(
   video_num      NUMBER(5), 
   youtuber_num      NUMBER(5), 
   video_url         VARCHAR2(100)    NOT NULL,
   video_ep      CHAR(15)    NOT NULL,
   video_concept      VARCHAR2(30),
   video_views_cnt      NUMBER(20)   NOT NULL,
   video_upload_date      DATE      NOT NULL,
   CONSTRAINT video_num PRIMARY KEY(video_num),
   CONSTRAINT video_url_UK UNIQUE(video_url),
   CONSTRAINT video_youtuber_FK FOREIGN KEY (youtuber_num) 
            REFERENCES youtuber(youtuber_num));

CREATE SEQUENCE SEQ_video
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO video VALUES(SEQ_video.NEXTVAL,1,'https://www.youtube.com/watch?v=Pt__n76SJ60M','1','청순',12221250,TO_DATE('01/01/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,1,'https://www.youtube.com/watch?v=PXZ8B9LDR8Uo','3','대학생',22516153,TO_DATE('02/13/2017 00:23:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,2,'https://www.youtube.com/watch?v=5gPMZptmFSmWQ','2','청순',213315350,TO_DATE('02/19/2017 00:12:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/watch?v=_kBPRzINGFSGg','1','물놀이',50562250,TO_DATE('02/20/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,2,'https://www.youtube.com/watch?v=VyBj8hd5SGig','6','대학생',201053620,TO_DATE('02/27/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=jXb_amlCfF5Q','2','수학여행',10063450,TO_DATE('03/02/2017 10:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,4,'https://www.youtube.com/watch?v=eFMP4xwtSSFLY','2','야영',137854220,TO_DATE('03/12/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,4,'https://www.youtube.com/watch?v=KIBmKBZnUAZs','3','살구',1055166320,TO_DATE('03/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=Fv5yadBm0sMFWVWFW','1','복숭아',47853215,TO_DATE('04/09/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,4,'https://www.youtube.com/watch?v=JOQPFFalWaLM','1','귀신',132852656,TO_DATE('04/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/watch?v=SC8A9w1QfXFk','7','대학생',565913,TO_DATE('05/03/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/watch?v=nrCDZmLWdwS0','12','섹시',1698675,TO_DATE('05/18/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,1,'https://www.youtube.com/watch?v=Q7aRDXgnWwlE','5','고등학생',1522688,TO_DATE('05/21/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,2,'https://www.youtube.com/watch?v=kI5mYprSs1yQ','11','졸업사진',3513418,TO_DATE('05/26/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=JYZQafKqW7lU','7','커버',1354250,TO_DATE('05/30/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,6,'https://www.youtube.com/watch?v=m9TNTRwkE7tM','1','공주',362525230,TO_DATE('06/02/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=mcasiNVChCADY','1','등산',13345262,TO_DATE('06/05/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,6,'https://www.youtube.com/watch?v=Wd5d3vaicC3Y','4','트로피컬',3356550,TO_DATE('06/07/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/watch?v=NRNuooNo5vWA','18','자두',25363820,TO_DATE('07/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,2,'https://www.youtube.com/watch?v=HGRCaywjdtXA','13','탄생석',2862450,TO_DATE('07/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/user/calarygirlG/videos','19','베이스',112564350,TO_DATE('07/30/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,6,'https://www.youtube.com/watch?v=VtTEhRBG1mgHvI','5','봄',5262350,TO_DATE('08/02/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=DcWw4qXE0b_E','5','여름',2115123,TO_DATE('08/10/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=SCK_goXsr2Ro','1','가을',11226338,TO_DATE('08/13/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,6,'https://www.youtube.com/watch?v=9k376I9DoD4g','8','겨울',22161526,TO_DATE('08/15/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=M_G233JrHM5M','3','군인',33758223,TO_DATE('08/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=BwINwW3FJFyk','7','남자',13524595,TO_DATE('09/11/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=F7E7yKChDrZU','5','10분',46825752,TO_DATE('09/19/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=BEwFEWwW3FJyk','2','몽한',154654350,TO_DATE('09/21/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=QEVCLA307nN-I','1','스냅백',42313730,TO_DATE('09/23/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=RQGJy6v08TJo','3','상가집',621656,TO_DATE('10/01/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=_toWKU1YwJvlo','1','직장인',5133750,TO_DATE('10/15/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=zAZdPnI-MTi-k','7','대학',759662,TO_DATE('10/23/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=UX_lPGGK-OG4T8','5',NULL,1334513,TO_DATE('11/01/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=CQoK_OJNw9bw','7',NULL,2566343,TO_DATE('11/07/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=FSu-aHHYP3e7M8','4','탄생석',33322183,TO_DATE('01/11/2017 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=7VtuI_g6TwB1c','3','별자리',4126633,TO_DATE('01/21/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=E5m_wrsMDZHI','2','등산',23524630,TO_DATE('02/09/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=lZ4plBIoEUko','1','공주',17264680,TO_DATE('02/10/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=WC3f7Eg2qdQ4','베이스',NULL,2662533,TO_DATE('02/19/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=2dVFGGYM59-8','1','10분',2146423,TO_DATE('03/02/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=8eYShHJcVMJpA','6','고등학생',3775631,TO_DATE('03/05/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=U2h2heLK09AEk','3',NULL,5387513,TO_DATE('03/09/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=TSjVsxsKQTes','5','수학여행',2298376,TO_DATE('04/01/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=kM273b5JUz98','1','미스코리아',1458291,TO_DATE('04/03/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=OS8K2GAH6pSs','7','봄',134278250,TO_DATE('05/01/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=9YZjrpOzbSGI','1','여름',7563913,TO_DATE('05/03/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=H6VZHeuvw-F4','1',NULL,453016,TO_DATE('05/10/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=SWu-gCUaro9s','9','가을',7890231,TO_DATE('05/11/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=1xtgKU35ED5U','1','겨울',2210103,TO_DATE('05/13/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=jB2zHOFS871E','3','결혼식',120345,TO_DATE('05/15/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=llrn3uODMP7k','3','스냅백',2340591,TO_DATE('05/16/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=C5A482-D-y8o','1','몽한',2016047,TO_DATE('05/19/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=FWvS5RjhioMg','5',NULL,8990531,TO_DATE('05/19/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=l7cZaB6X6oYs','1','광채',1234563,TO_DATE('06/02/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=8bJ31tF77ELQ','5','촉촉',5378362,TO_DATE('06/08/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=kJP4Xz58WZs8','8','매트',78926523,TO_DATE('06/10/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=D1XKYTKti9HQ','1','숙취',45126319,TO_DATE('06/12/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=y5MzLnExdIms','3','미스코리아',78651473,TO_DATE('07/02/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL ,8,'https://www.youtube.com/watch?v=-xrDsmgElLQU','1','임산부',32051275,TO_DATE('07/13/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=KFgLQHBhAocTY','노안',NULL,6537712,TO_DATE('07/19/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=YRsMzSXZU-o','6','청순',98422333,TO_DATE('08/19/2018 00:22:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=RC5A82-D-y8o','1','상가집',723215,TO_DATE('01/01/2019 00:27:17', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=FEWWvSRjhioMg','5',NULL,5331230,TO_DATE('01/10/2019 05:24:27', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=l7cZSaBX6oYs','1','별자리',5928651,TO_DATE('01/19/2019 07:20:38', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=8bJ31DtF7ELQ','5','물놀이',76157865,TO_DATE('01/21/2019 10:15:24', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=kJP4Xz5FWZs8','8','할로윈',5662016,TO_DATE('01/25/2019 08:00:38', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=D1XKYTKtGiHQ','1',NULL,5318049,TO_DATE('02/01/2019 19:22:05', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=y5MzLnExHdms','3','광채',6560751,TO_DATE('02/05/2019 21:50:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL ,8,'https://www.youtube.com/watch?v=-xrDsmgElLhQ','1','탄생석',3215910,TO_DATE('02/08/2019 17:00:35', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=KFgLQHBhAjoc','6','숙취',5680102,TO_DATE('02/10/2019 23:05:48', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=YRsMzSXZU-okn','6','동안',83200034,TO_DATE('02/13/2019 00:00:37', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,5,'https://www.youtube.com/watch?v=sPXZ8B9LR8Uo','7',NULL,86153533,TO_DATE('02/15/2019 15:19:01', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=vGHsqZYifNiU','9','커버',5290026,TO_DATE('02/20/2019 13:37:43', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=tEe4j5v4fPUM','11','가련',20003050,TO_DATE('03/05/2019 15:53:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,7,'https://www.youtube.com/watch?v=jeXb_amlCf5Q','13','섹시',26343050,TO_DATE('03/07/2019 14:49:31', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=kTS3CkVNLS-A','8','미니멀',536350,TO_DATE('03/08/2019 02:52:01', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,8,'https://www.youtube.com/watch?v=jXb_a5mlCf5Q','11','아바타',8456350,TO_DATE('03/12/2019 09:24:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=kTSCk6VNLS-A','11',NULL,2060350,TO_DATE('03/15/2019 21:40:07', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,9,'https://www.youtube.com/watch?v=NyM-X7V8FRpo','14',NULL,96750350,TO_DATE('03/17/2019 17:13:06', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=DAu_jF6-9AXs','7','왕자',1034550,TO_DATE('03/21/2019 20:37:11', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=jOv_d2E55tRUA','11','커버',320950,TO_DATE('04/02/2019 18:59:16', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=hgutyYNV44K2Q','9','등산',885640,TO_DATE('04/03/2019 16:48:50', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=x9EF-r4LMUIe33','11','직장인',1566418,TO_DATE('04/07/2019 04:56:40', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=eWzDOozQ9bu8','7','봄',5651613,TO_DATE('04/10/2019 16:10:43', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=VefM9_5yI4mfQ','9','대학생',8953645,TO_DATE('04/12/2019 20:13:19', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=0nCvrhynFKpdn13s','11','귀신',72689306,TO_DATE('04/15/2019 08:16:12', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=0nCFKpdrtgbn13s','11','겨울',13348153,TO_DATE('04/19/2019 06:50:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,13,'https://www.youtube.com/watch?v=jNwZ0ZBuvVw8','13','10분',32150095,TO_DATE('05/05/2019 16:42:07', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=Y2gHsXJF2pj8','7','할로윈',1384535605,TO_DATE('05/07/2019 22:32:53', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=1K8vszI2MFl4','9',NULL,123495492,TO_DATE('05/08/2019 23:28:10', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,14,'https://www.youtube.com/watch?v=F2v5yadBm0sM','11','명절',8657035,TO_DATE('05/10/2019 14:24:50', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=Lx1ldV8bP6HY','8','크리스마스',5132034,TO_DATE('05/13/2019 13:40:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=Fkl20VE5X0yU','9','새내기',58974613,TO_DATE('05/17/2019 08:30:09', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,15,'https://www.youtube.com/watch?v=FSu1-aP3e7M8','11','숙취',80049845,TO_DATE('05/22/2019 09:05:07', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,12,'https://www.youtube.com/watch?v=FSu14213e7M8','12','바캉스',498425,TO_DATE('06/03/2019 11:05:07', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,11,'https://www.youtube.com/watch?v=DSFSu1-aP3e7M4','12','탄생석',9845,TO_DATE('06/01/2019 09:03:26', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,10,'https://www.youtube.com/watch?v=1Su1-adsfe7ff8','12','직장인',34945,TO_DATE('05/28/2019 21:49:57', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO video VALUES(SEQ_video.NEXTVAL,3,'https://www.youtube.com/watch?v=FSug3123-dd-78','20','할로윈',3845,TO_DATE('05/31/2019 14:15:08', 'MM/DD/YYYY HH24:MI:SS'));





commit;


CREATE TABLE product (
 pro_num    NUMBER(5),
 brand_num    NUMBER(5) NOT NULL,
 pro_name   VARCHAR2(40) NOT NULL,
 price      NUMBER(12) NOT NULL,
 kind      VARCHAR2(45) NOT NULL,
 basic_usage   VARCHAR2(200) NOT NULL,
 release_date   DATE,
 CONSTRAINT product_PK PRIMARY KEY (pro_num),
 CONSTRAINT pro_name_UK UNIQUE(pro_name),
 CONSTRAINT brand_FK FOREIGN KEY (brand_num)
       REFERENCES brand(brand_num));

CREATE  SEQUENCE  SEQ_PRO
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '피지오겔로션', 25800, '스킨케어', '일정량을 덜어내어 흡수되도록 펴바릅니다.', TO_DATE('07/15/1994','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '수딩크림', 28800, '스킨케어', '일정량을 덜어내어 흡수되도록 펴바릅니다.', TO_DATE('03/24/1975','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '광채쿠션', 22400, '베이스', '퍼프를 활용하여 쿠션에 일정량 덜어 얼굴 전체에 펴바릅니다', TO_DATE('10/04/1985','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '크리니 크치크팝', 26300, '색조', '브러쉬를 사용하여 양 볼에 펴바릅니다.', TO_DATE('08/16/1946','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '잉크블랙카라', 10000, '색조', '속눈썹에 일정량 바릅니다.', TO_DATE('04/15/1971','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '오토브로우 펜슬', 14000, '색조', '눈썹 모양을 따라 그립니다.', TO_DATE('08/24/2012','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '워터프루프 펜라이너', 10500, '색조', '눈의 점막을 채우며 눈매를 또렷히 그립니다.', TO_DATE('10/28/2001','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '컬러링 아이브로우', 15000, '색조', '눈썹 모양을 따라 그립니다.', TO_DATE('12/08/2013','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '슈렉팩', 24000, '스킨케어', '일정량을 덜어 얼굴에 바른 후 굳으면 미온수로 씻어냅니다.', TO_DATE('10/29/1997','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '메디힐 티트리마스크', 20000, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('07/08/2015','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '듀이셀 마스크팩', 19800, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('06/29/2017','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '세라마이딘 마스트', 20000, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('06/19/1973','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '토너패드', 12000, '스킨케어', '세안 후 패드로 얼굴을 닦아냅니다.', TO_DATE('01/09/2018','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '파우더 키스립스틱', 31000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('01/08/2011','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '트리플 핸섬 립밤', 12400, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('07/15/2014','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '페리페라 잉크 더 벨벳', 7200, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('02/28/2014','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '클렌징오일', 7600, '스킨케어', '일정량을 덜어 얼굴에 부드럽게 롤링 후 미온수로 씻어냅니다.', TO_DATE('08/25/2013','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '라벤더 미스트', 10400, '스킨케어', '얼굴로부터 3m 거리에서 분사한다.', TO_DATE('10/25/2014','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '오션 마일드 선밀크', 15800, '스킨케어', '기초화장 후 얼굴에 펴바릅니다.', TO_DATE('11/20/2000','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '블러틴트', 9860, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('06/06/2001','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '스파광쿠션', 22000, '색조', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다. ', TO_DATE('01/28/2004','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '쥬얼섀도우', 9000, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('12/29/2008','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '오토젤 아이라이너', 9500, '색조', '눈의 점막을 채우며 눈매를 또렷히 그립니다.', TO_DATE('12/25/2015','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '소다쿠션', 10600, '색조', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('11/15/2010','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '소프트 필링젤', 8900, '스킨케어', '일정량을 덜어 원하는 부위에 문지른다.', TO_DATE('03/03/1999','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '에센셜 폼클렌저', 14000, '스킨케어', '물을 젹신 후 일정량을 덜어 거품을 내어 롤링한다.', TO_DATE('10/13/1998','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '카모마일 클렌징오일', 12800, '스킨케어', '물을 적신 후 일정량을 덜어 거품을 내어 롤링한다.', TO_DATE('06/20/2005','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '트윙클섀도', 8000, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('08/20/2005','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '바이플라워 블러셔', 6320, '색조', '브러쉬를 사용하여 양 볼에 펴바릅니다.', TO_DATE('10/01/2001','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '트리플 머랭틴트', 11000, '색조', '입술 라인을 따라 그려줍니다.', TO_DATE('04/15/2016','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '섀도팔레트', 24900, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('05/08/2008','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '집중 마스크림 시트', 3000, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('10/07/2008','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '갈아만든 마스크 시트', 1500, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('12/12/2012','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '더마 마일드 마스크', 2500, '스킨케어', '스킨케어 후, 시트를 얼굴에 덮고 15분 후에 떼어냅니다.', TO_DATE('01/30/2010','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '수분 슬리핑팩', 20000, '스킨케어', '자기 전 일정량을 덜어 피부에 펴바른 후 아침이 되면 미온수로 씻어냅니다.', TO_DATE('04/25/1989','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '베이비 페이스팩', 7900, '스킨케어', '자기 전 일정량을 덜어 피부에 펴바른 후 아침이 되면 미온수로 씻어냅니다.', TO_DATE('12/05/2017','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '잉크 래스팅쿠션', 24900, '베이스', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('07/24/2012','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '퍼펙션 BB크림', 23000, '베이스', '퍼프를 활용하여 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('06/06/2016','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '슬림핏 쿠션', 23000, '베이스', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('04/16/2018','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '피지잡는 수분쿠션', 20000, '베이스', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('04/14/1999','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '안티 다크닝쿠션', 20000, '베이스', '퍼프를 활용하여 쿠션에 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('05/18/2000','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '잉크래스팅 파운데이션', 18000, '베이스', '퍼프를 활용하여 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('06/18/2003','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '매직커버 BB크림', 18000, '베이스', '퍼프를 활용하여 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('09/16/2004','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '워터프루프 BB', 18000, '베이스', '퍼프를 활용하여 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('09/27/2017','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '잉크래스팅 프라이머', 18000, '베이스', '퍼프를 활용하여 일정량을 덜어 얼굴 전체에 펴바릅니다.', TO_DATE('10/03/2017','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '모노큐브 아이섀도', 5000, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('02/09/2016','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 2, '싱글 섀도', 9000, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('03/30/2000','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 3, '초코 모노팝 아이즈 섀도우', 9000, '색조', '브러쉬를 사용하여 눈두덩이에 펴바릅니다.', TO_DATE('06/18/2008','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 4, '클로시 터리 립스틱', 12000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('07/18/2014','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 5, '틴트 스틱', 11000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('08/12/2016','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 6, '콜라겐 앰플 립스틱', 19000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('09/29/2019','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 7, '네온팝 립스틱', 12000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('03/29/2029','MM/DD/YYYY'));
INSERT INTO product VALUES (SEQ_PRO.NEXTVAL, 1, '멜팅 컬러 립 크리머', 8000, '립', '입술 라인을 따라 그려줍니다.', TO_DATE('03/13/2013','MM/DD/YYYY'));

commit;

CREATE TABLE member (
 mem_num   NUMBER(5),
 mem_id      VARCHAR2(20) NOT NULL,
 mem_name   VARCHAR2(30) NOT NULL,
 pw      VARCHAR2(20) NOT NULL,
address      VARCHAR2(60) NOT NULL,
cellphone   VARCHAR2(30) NOT NULL,
nickname   VARCHAR2(20) NOT NULL,
birthday      DATE,
CONSTRAINT mem_PK PRIMARY KEY (mem_num),
CONSTRAINT mem_id_UK UNIQUE(mem_id),
CONSTRAINT cellphone_UK UNIQUE(cellphone),
CONSTRAINT nicname_UK UNIQUE(nickname));

CREATE  SEQUENCE  SEQ_MEM
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'yjhwang', '황영주', 'dwvf5689', '서울시 중구 충무로1가', '010-5234-8879', 'gkgkenf12', TO_DATE('03/01/1993','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'srkim', '김수련', 'fdbvjsg5526', '부산시 동래구 명륜동', '010-1675-4951', 'ewjfno186', TO_DATE('04/21/1999','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'shlee', '이성현', 'ewvgr168ew', '광주시 남구 지석동', '010-7826-6975', 'ew561d4', TO_DATE('10/25/2001','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'hnjang', '정한나', 'wybnceq14!', '광주시 남구 도금동', '010-7820-1567', 'uqfce94', TO_DATE('03/24/1995','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'mylee', '이명연', 'vwk58jw', '부산시 영도구 봉래동5가', '010-2697-0150', '1518605qwd', TO_DATE('05/10/1995','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'yskim', '김영숙', 'bmxvol', '경기도 과천시 중앙동', '010-1403-7305', '156eva651', TO_DATE('05/07/1997','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'jekim', '김정은', '1568sa', '경기도 시흥시 신천동', '010-0168-4865', 'W61ca6a1', TO_DATE('07/10/1992','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'yjko', '고영주', 'v17brsgV', '대전시 서구 둔산1동', '010-8640-0846', '161ve38a', TO_DATE('10/16/1992','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'cyahn', '안철영', 'ddi2dqw', '경기도 수원시 장안구 파장동', '010-8461-1516', 'devb4613', TO_DATE('10/29/1998','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'jmkim', '김진모', 'ooqbe6', '광주시 서구 화정4동', '010-5168-7792', '123845w', TO_DATE('10/01/1999','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'ycshul', '설영찬', 'bowvq1561', '광주시 서구 쌍촌동', '010-5691-2325', 'qbdwf1245', TO_DATE('12/14/1998','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'jjko', '고재진', '1961qve', '경기도 시흥시 대야동', '010-1568-1866', 'vevabea156', TO_DATE('12/07/1996','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'hwlee', '이현우', 'wopqv58', '전라남도 목포시 항동', '010-4681-7963', 'vew4e5861', TO_DATE('02/06/2004','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'cskang', '강찬숙', 'qzmzc82', '부산시 영도구 청학1동', '010-1668-4916', '1861wflwsv', TO_DATE('02/08/2001','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'chpark', '박철호', 'zpkvg19650', '경기도 수원시 권선구 매산로1가', '010-7921-1653', 'f1sv65fsv', TO_DATE('10/10/1997','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'shleere', '이상훈', 'pqirinv695', '광주시 서구 쌍촌동', '010-5905-1965', '6g53we', TO_DATE('08/25/1998','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'yjbae', '배용진', 'yrebvkc22', '서울시 은평구 녹번동', '010-4865-1358', '4615efcdav', TO_DATE('07/17/2008','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'bkcha', '차범길', 'owvjdcq385', '대구시 달서구 신당동', '010-6086-8998', '16vwcddas', TO_DATE('04/28/2007','MM/DD/YYYY'));
INSERT INTO member VALUES (SEQ_MEM.NEXTVAL, 'mskim', '김문수', 'cbwovbow65', '서울시 은평구 대조동', '010-1686-1979', 'v1sdv315', TO_DATE('02/20/2001','MM/DD/YYYY'));

commit;

CREATE TABLE store(
 store_num   NUMBER(5),
 store_name   VARCHAR2(40) NOT NULL,
 store_address   VARCHAR2(100) NOT NULL,
CONSTRAINT  store_PK PRIMARY KEY (store_num),
CONSTRAINT  store_address_UK UNIQUE(store_address)
);

CREATE  SEQUENCE  SEQ_STORE
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '랑콤(동진점)', '경상남도 진주시 동진로 25 450-2번지 태성빌딩 102호');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '랑콤(조치원점)', '세종특별자치시 조치원읍 조치원로 5 1,2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '랑콤(권광점)', '경기도 수원시 팔달구 권광로 202 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '랑콤(선릉점)', '서울특별시 강남구 선릉로 703 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(퇴계점)', '서울특별시 중구 퇴계로 127 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(한강점)', '대구광역시 북구 한강로 52-1 에메랄드 1층(사수동)');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(광명점)', '경기도 광명시 광명로 897');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(하안점)', '경기도 광명시 하안로 289 태홍빌딩 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(분당점)', '경기도 성남시 분당구 성남대로331번길 7 정자동 스타빌딩 104호');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '이니스프리(금천점)', '서울특별시 금천구 가산디지털1로 186 (가산동) 제이플라츠 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '이니스프리(경강점)', '강원도 강릉시 경강로 2120 (옥천동) 씨네몰 6층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '이니스프리(광나루점)', '서울특별시 광진구 광나루로56길 85 (구의동) 테크노마트 9층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '이니스프리(동천점)', '서울특별시 동천구 나산디지털1로 186 (불당동) 제이플라츠 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '이니스프리(서북점)', '충청남도 천안시 서북구 공원로 227 (불당동) 천안갤러리아백화점 8층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(장평점)', '경상남도 거제시 장평로 12 디큐브백화점 6층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(구리점)', '경기도 구리시 건원대로 3 (인창동) 흥화오피스텔 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(함박로)', '경상남도 김해시 함박로 102 (외동, 한국APT2차상가) 3층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(여의도점)', '서울시 영등포구 여의도동 85-1 이랜드 크루즈 2번 선착장 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(목동점)', '서울특별시 양천구 목동동로 309 (목동) 목동행복한백화점 5층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '더페이스샵(성남점)', '경기도 성남시 분당구 성남대로 151, 엠코헤리츠 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(청량점)', '서울시 동대문구 왕산로 214 청량리 롯데백화점 지하 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(황새울점)', '경기도 성남시 분당구 황새울로200번길 45 분당롯데백화점 지하2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(관악점)', '서울특별시 관악구 남부순환로 1820 (봉천동) 라붐아울렛 9층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(동소문점)', '서울특별시 성북구 동소문로 106 (동선동1가) 유타몰 7층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(마장점)', '인천광역시 부평구 마장로 489 (청천동) 아이즈빌아울렛 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(토성면)', '강원도 고성군 토성면 동해대로 4800 켄싱턴리조트설악비치 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '토니모리(올림픽점)', '서울특별시 송파구 올림픽로 240 롯데월드 웰빙센터 3층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '삐야(매탄점)', '수원시 영통구 매탄1동 웰빙센터 9층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(동천점)', '부산광역시 부산진구 동천로 92 NC서면점 (구 밀리오레) 5층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(북점)', '경상북도 포항시 북구 중앙상가길 6 (대흥동) NC포항점 7층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(왕십리점)', '서울시 성동구 왕십리로 241 서울숲 더샵 파크에비뉴 엔터식스 3층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(만남점)', '충청남도 천안시 동남구 신부동 만남로 43 아라리오 갤러리 1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(중봉점)', '인천광역시 서구 중봉대로 587 (경서동) 청라홈플러스 2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '네이처리퍼블릭(양화점)', '서울특별시 마포구 양화로 129 (서교동) 경남빌딩 지하1층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(김유정점)', '강원 춘천시 김유정로 1840 춘천홈플러스 지하2층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(금정점)', '부산 금정구 부산대학로63번길 2 부산대NC백화점 6층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(충민점)', '서울특별시 송파구 충민로 66 가든파이브라이프 YOUNG관 7층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(북점)', '부산광역시 북구 만덕대로 23 폴라렉스 부산덕천뉴코아아울렛 6층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(사하점)', '부산광역시 사하구 사하로 190 (괴정동) 괴정뉴코아아울렛 5층');
INSERT INTO store VALUES(SEQ_STORE.NEXTVAL, '샤넬(잠원점)', '서울특별시 서초구 잠원로 69 (잠원동) 킴스주차타워 1층');

commit;

CREATE TABLE administrate(
 pro_num   NUMBER(5) ,
 store_num   NUMBER(5),
 stock      NUMBER(15) NOT NULL,
CONSTRAINT administrate_PK PRIMARY KEY (pro_num, store_num),
CONSTRAINT administrate_FK FOREIGN KEY (pro_num)
      REFERENCES product(pro_num),
CONSTRAINT administrate_FK1 FOREIGN KEY (store_num)
      REFERENCES store(store_num)
);

INSERT INTO administrate VALUES(1, 4, 10);
INSERT INTO administrate VALUES(1, 7, 8);
INSERT INTO administrate VALUES(2, 3, 8);
INSERT INTO administrate VALUES(5, 1, 8);
INSERT INTO administrate VALUES(1, 5, 8);
INSERT INTO administrate VALUES(2, 6, 8);
INSERT INTO administrate VALUES(18, 7, 56);
INSERT INTO administrate VALUES(12, 3, 105);
INSERT INTO administrate VALUES(16, 3, 19);
INSERT INTO administrate VALUES(18, 4, 168);
INSERT INTO administrate VALUES(25, 4, 200);
INSERT INTO administrate VALUES(24, 5, 151);
INSERT INTO administrate VALUES(23, 5, 651);
INSERT INTO administrate VALUES(13, 3, 78);
INSERT INTO administrate VALUES(46, 15, 98);
INSERT INTO administrate VALUES(18, 16, 26);
INSERT INTO administrate VALUES(19, 17, 15);
INSERT INTO administrate VALUES(5, 18, 56);
INSERT INTO administrate VALUES(22, 19, 88);
INSERT INTO administrate VALUES(9, 20, 78);
INSERT INTO administrate VALUES(28, 21, 98);
INSERT INTO administrate VALUES(29, 22, 65);
INSERT INTO administrate VALUES(37, 23, 16);
INSERT INTO administrate VALUES(38, 24, 59);
INSERT INTO administrate VALUES(29, 25, 72);
INSERT INTO administrate VALUES(36, 26, 27);
INSERT INTO administrate VALUES(6, 27, 91);
INSERT INTO administrate VALUES(28, 28, 100);
INSERT INTO administrate VALUES(24, 29, 15);
INSERT INTO administrate VALUES(26, 30, 56);
INSERT INTO administrate VALUES(16, 31, 88);
INSERT INTO administrate VALUES(20, 32, 78);
INSERT INTO administrate VALUES(20, 33, 98);
INSERT INTO administrate VALUES(2, 34, 65);
INSERT INTO administrate VALUES(28, 35, 16);
INSERT INTO administrate VALUES(37, 36, 59);
INSERT INTO administrate VALUES(38, 37, 72);
INSERT INTO administrate VALUES(29, 38, 27);
INSERT INTO administrate VALUES(20, 19, 91);
INSERT INTO administrate VALUES(25, 5, 100);
INSERT INTO administrate VALUES(3, 1, 34);
INSERT INTO administrate VALUES(5, 2, 43);
INSERT INTO administrate VALUES(8, 3, 62);
INSERT INTO administrate VALUES(10, 4, 61);
INSERT INTO administrate VALUES(19, 5, 26);
INSERT INTO administrate VALUES(26, 6, 15);
INSERT INTO administrate VALUES(16, 7, 31);
INSERT INTO administrate VALUES(29, 9, 43);
INSERT INTO administrate VALUES(40, 8, 16);
INSERT INTO administrate VALUES(41, 10, 161);
INSERT INTO administrate VALUES(29, 11, 56);
INSERT INTO administrate VALUES(28, 12, 60);
INSERT INTO administrate VALUES(27, 13, 43);
INSERT INTO administrate VALUES(26, 14, 34);
INSERT INTO administrate VALUES(25, 15, 16);
INSERT INTO administrate VALUES(22, 16, 95);
INSERT INTO administrate VALUES(12, 17, 58);
INSERT INTO administrate VALUES(16, 18, 74);
INSERT INTO administrate VALUES(30, 19, 29);
INSERT INTO administrate VALUES(26, 20, 34);
INSERT INTO administrate VALUES(13, 21, 26);
INSERT INTO administrate VALUES(20, 22, 92);
INSERT INTO administrate VALUES(1, 23, 37);
INSERT INTO administrate VALUES(26, 24, 82);
INSERT INTO administrate VALUES(28, 25, 28);
INSERT INTO administrate VALUES(35, 26, 18);
INSERT INTO administrate VALUES(34, 27, 92);
INSERT INTO administrate VALUES(18, 28, 63);
INSERT INTO administrate VALUES(28, 29, 81);
INSERT INTO administrate VALUES(16, 30, 16);
INSERT INTO administrate VALUES(18, 31, 51);
INSERT INTO administrate VALUES(31, 32, 58);
INSERT INTO administrate VALUES(28, 33, 75);
INSERT INTO administrate VALUES(29, 34, 16);
INSERT INTO administrate VALUES(16, 35, 28);
INSERT INTO administrate VALUES(40, 36, 43);
INSERT INTO administrate VALUES(26, 37, 2);
INSERT INTO administrate VALUES(28, 38, 15);
INSERT INTO administrate VALUES(16, 29, 65);
INSERT INTO administrate VALUES(15, 16, 156);

CREATE TABLE coupon (
 mem_num   NUMBER(5),
 coupon_num   NUMBER(5),
 issue_date   DATE  DEFAULT SYSDATE NOT NULL,
 discount   NUMBER(3) NOT NULL CHECK(discount BETWEEN 1 AND 100),
 CONSTRAINT coupon_pk PRIMARY KEY (mem_num, coupon_num));

ALTER TABLE coupon
 ADD CONSTRAINT coupon_mem_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num);

CREATE  SEQUENCE  seq_coupon
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

INSERT INTO coupon VALUES(1, seq_coupon.NEXTVAL, TO_DATE('2019/03/02 11:54:12','YYYY/MM/DD HH24:MI:SS'), 10);
INSERT INTO coupon VALUES(2, seq_coupon.NEXTVAL, TO_DATE('2019/03/02 11:54:15','YYYY/MM/DD HH24:MI:SS'), 10);
INSERT INTO coupon VALUES(3, seq_coupon.NEXTVAL, TO_DATE('2019/04/11 12:54:58','YYYY/MM/DD HH24:MI:SS'), 30);
INSERT INTO coupon VALUES(4, seq_coupon.NEXTVAL, TO_DATE('2019/04/11 16:54:42','YYYY/MM/DD HH24:MI:SS'), 50);
INSERT INTO coupon VALUES(5, seq_coupon.NEXTVAL, TO_DATE('2019/04/12 20:54:31','YYYY/MM/DD HH24:MI:SS'), 10);
INSERT INTO coupon VALUES(5, seq_coupon.NEXTVAL, TO_DATE('2019/04/22 11:54:12','YYYY/MM/DD HH24:MI:SS'), 5);
INSERT INTO coupon VALUES(6, seq_coupon.NEXTVAL, TO_DATE('2019/04/23 11:34:12','YYYY/MM/DD HH24:MI:SS'), 5);
INSERT INTO coupon VALUES(6, seq_coupon.NEXTVAL, TO_DATE('2019/05/01 12:54:58','YYYY/MM/DD HH24:MI:SS'), 10);
INSERT INTO coupon VALUES(6, seq_coupon.NEXTVAL, TO_DATE('2019/05/01 16:54:42','YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO coupon VALUES(7, seq_coupon.NEXTVAL, TO_DATE('2019/05/29 20:54:31','YYYY/MM/DD HH24:MI:SS'), 100);

CREATE TABLE comprise (
pro_num      NUMBER(5),
video_num   NUMBER(5),
CONSTRAINT comprise_pk PRIMARY KEY (pro_num, video_num));

ALTER TABLE comprise
 ADD CONSTRAINT comprise_pro_fk FOREIGN KEY (pro_num) REFERENCES product(pro_num);
ALTER TABLE comprise
 ADD CONSTRAINT comprise_video_fk FOREIGN KEY (video_num) REFERENCES video(video_num);

INSERT INTO comprise VALUES(1, 31);
INSERT INTO comprise VALUES(8, 4);
INSERT INTO comprise VALUES(11, 15);
INSERT INTO comprise VALUES(11, 27);
INSERT INTO comprise VALUES(32, 31);
INSERT INTO comprise VALUES(16, 44);
INSERT INTO comprise VALUES(23, 47);
INSERT INTO comprise VALUES(33, 60);
INSERT INTO comprise VALUES(43, 55);
INSERT INTO comprise VALUES(32, 77);

CREATE TABLE saving (
 mem_num   NUMBER(5),
 save_date   DATE,
 save_money   NUMBER(6) NOT NULL,
 CONSTRAINT saving_pk PRIMARY KEY (mem_num, save_date));

ALTER TABLE saving
 ADD CONSTRAINT saving_mem_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num);

INSERT INTO saving VALUES(1, TO_DATE('2019/03/01 11:54:12','YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO saving VALUES(2, TO_DATE('2019/03/01 13:54:12','YYYY/MM/DD HH24:MI:SS'), 9300);
INSERT INTO saving VALUES(3, TO_DATE('2019/03/01 16:54:13','YYYY/MM/DD HH24:MI:SS'), 500);
INSERT INTO saving VALUES(4, TO_DATE('2019/03/01 23:54:12','YYYY/MM/DD HH24:MI:SS'), 4000);
INSERT INTO saving VALUES(5, TO_DATE('2019/03/05 11:24:22','YYYY/MM/DD HH24:MI:SS'), 200);
INSERT INTO saving VALUES(6, TO_DATE('2019/03/11 09:54:13','YYYY/MM/DD HH24:MI:SS'), 100);
INSERT INTO saving VALUES(7, TO_DATE('2019/03/25 11:54:34','YYYY/MM/DD HH24:MI:SS'), 9300);
INSERT INTO saving VALUES(8, TO_DATE('2019/04/13 02:54:12','YYYY/MM/DD HH24:MI:SS'), 500);
INSERT INTO saving VALUES(9, TO_DATE('2019/04/29 06:11:11','YYYY/MM/DD HH24:MI:SS'), 4000);
INSERT INTO saving VALUES(10, TO_DATE('2019/05/01 11:54:12','YYYY/MM/DD HH24:MI:SS'), 200);

CREATE TABLE subscribe(
 mem_num   NUMBER(5),
 youtuber_num   NUMBER(5),         
 subscription_date   DATE DEFAULT SYSDATE NOT NULL,
 CONSTRAINT subscribe_pk PRIMARY KEY (mem_num, youtuber_num));

ALTER TABLE subscribe
 ADD CONSTRAINT subscribe_mem_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num);
ALTER TABLE subscribe
 ADD CONSTRAINT subscribe_youtuber_fk FOREIGN KEY (youtuber_num) REFERENCES youtuber (youtuber_num);

INSERT INTO subscribe VALUES(1, 1, TO_DATE('2019/03/01 11:54:12','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(11, 3, TO_DATE('2019/03/02 12:35:25','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(11, 6, TO_DATE('2019/03/03 13:22:35','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(14, 5, TO_DATE('2019/03/15 13:24:16','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(15, 10, TO_DATE('2019/03/30 14:26:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(12, 11, TO_DATE('2019/04/01 11:54:12','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(3, 12, TO_DATE('2019/03/02 12:35:25','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(9, 12, TO_DATE('2019/03/15 13:22:35','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(8, 4, TO_DATE('2019/04/13 13:24:16','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(2, 8, TO_DATE('2019/05/11 14:26:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(8, 3, TO_DATE('2019/05/12 13:24:16','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(2, 9, TO_DATE('2019/05/13 14:26:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(3, 6, TO_DATE('2019/05/13 13:24:16','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(1, 7, TO_DATE('2019/05/14 14:26:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(1,12,TO_DATE('2019/05/28 14:23:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(4,13,TO_DATE('2019/06/01 14:23:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(3,5,TO_DATE('2019/06/02 11:23:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(4,14,TO_DATE('2019/06/02 12:23:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(4,15,TO_DATE('2019/06/03 13:23:37','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(8,12,TO_DATE('2019/06/02 14:27:38','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(10,11,TO_DATE('2019/06/02 15:26:27','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(11,10,TO_DATE('2019/05/28 16:25:31','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(3,3,TO_DATE('2019/05/29 17:24:35','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(2,12,TO_DATE('2019/06/01 18:33:44','YYYY/MM/DD HH24:MI:SS'));
INSERT INTO subscribe VALUES(7,11,TO_DATE('2019/06/02 19:13:55','YYYY/MM/DD HH24:MI:SS'));

CREATE SEQUENCE SEQ_tec
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

CREATE TABLE technic (
 tech_num   NUMBER(5),
 tech_kind   NUMBER(5) NOT NULL,
 usage      VARCHAR2(60) NOT NULL,
 part      VARCHAR2(20) NOT NULL,
CONSTRAINT technic_PK PRIMARY KEY (tech_num));

INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 7, '눈 밑에 발라 다크서클을 없앤다.', '눈');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 3, '손으로 입술에 바른다.', '입술');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 6, '틴트를 바르기 전 입술색을 지우기 위해 바른다.', '입술');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 6, '생기를 위해 브러쉬를 이용하여 이마에 바른다.', '이마');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 2, '화장솜에 덜어 팩으로 사용한다.', '피부');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 6, '작은 브러쉬로 코에 음영을 준다.', '코');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 7, '생기있어 보이도록 얼굴에 바른다.', '얼굴');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 3, '원하는 부위에 점을 찍어 매력을 높힌다.','얼굴');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 4, '피부의 흉터를 가리기 위해 컨실러 대신으로 사용한다.', '얼굴');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 3, '별, 하트 등 다양한 모양을 그려 컨셉을 강조한다.', '얼굴');
INSERT INTO technic VALUES (SEQ_tec.NEXTVAL, 3, '비어있는 이마를 채운다.','이마');

CREATE TABLE show(
 video_num   NUMBER(5),
 tech_num   NUMBER(5),
CONSTRAINT show_PK PRIMARY KEY ( video_num, tech_num),
CONSTRAINT show_video_fk FOREIGN KEY (video_num)
      REFERENCES video(video_num),
CONSTRAINT show_tech_fk FOREIGN KEY (tech_num)
      REFERENCES technic (tech_num));


INSERT INTO show VALUES (1,2);
INSERT INTO show VALUES (1,4);
INSERT INTO show VALUES (2,7);
INSERT INTO show VALUES (2,11);
INSERT INTO show VALUES (3,6);
INSERT INTO show VALUES (3,10);
INSERT INTO show VALUES (4,1);
INSERT INTO show VALUES (4,8);
INSERT INTO show VALUES (5,3);
INSERT INTO show VALUES (5,10);
INSERT INTO show VALUES (6,5);
INSERT INTO show VALUES (6,7);
INSERT INTO show VALUES (7,1);
INSERT INTO show VALUES (7,6);
INSERT INTO show VALUES (8,2);
INSERT INTO show VALUES (8,11);
INSERT INTO show VALUES (9,3);
INSERT INTO show VALUES (9,7);
INSERT INTO show VALUES (10,4);
INSERT INTO show VALUES (10,10);
INSERT INTO show VALUES (11,8);
INSERT INTO show VALUES (11,5);
INSERT INTO show VALUES (12,1);
INSERT INTO show VALUES (12,6);
INSERT INTO show VALUES (13,2);
INSERT INTO show VALUES (13,8);
INSERT INTO show VALUES (13,3);
INSERT INTO show VALUES (14,7);
INSERT INTO show VALUES (14,2);
INSERT INTO show VALUES (15,4);
INSERT INTO show VALUES (15,5);



CREATE SEQUENCE SEQ_buy
 START WITH 1
 INCREMENT BY 1
 CACHE 10
 NOCYCLE;

CREATE TABLE buy(
 pur_num   NUMBER(5) NOT NULL,
 mem_num   NUMBER(5) NOT NULL,
 pro_num      NUMBER(5) NOT NULL,
 pur_date      DATE,
 deposit      CHAR(1) default 'N' CHECK(deposit IN ('Y','N')),
 virtual_account   VARCHAR2(20),
 address      VARCHAR2(50),
 delivery      CHAR(1) default 'N' CHECK(delivery IN ('Y','N')),
 pur_amount   NUMBER(7),
 waybill_num   VARCHAR2(17),
 put_date      DATE,
 pro_quantity   NUMBER(3),

CONSTRAINT buy_PK PRIMARY KEY(pur_num),
CONSTRAINT buy_mem_fk FOREIGN KEY(mem_num)
      REFERENCES member(mem_num),
CONSTRAINT buy_pro_fk FOREIGN KEY(pro_num)
      REFERENCES product(pro_num)
);

INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 3, TO_DATE( '19/01/01 00:00:01', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 3, 7, TO_DATE( '19/01/07 17:02:23', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 7, 1, TO_DATE( '19/02/05 21:53:18', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 10, 8, TO_DATE( '19/02/19 07:08:41', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 2, 18, TO_DATE( '19/03/16 16:23:53', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 8, 5, TO_DATE( '19/04/19 23:50:35', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 9, 2, TO_DATE( '19/05/22 16:22:17', 'YY/MM/DD HH24:MI:SS'));

INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 1, 50, TO_DATE( '19/01/04 10:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '156518-1568456', '서울시 중구 충무로1가', 'Y', 22000, '172274829488', TO_DATE( '19/01/03 13:00:01', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 7, 15, TO_DATE( '19/01/06 23:16:01', 'YY/MM/DD HH24:MI:SS'), 'Y', '456841-1279758','경기도 시흥시 신천동', 'Y', 12400, '1758362959837', TO_DATE( '19/01/03 18:30:31', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 10, 23, TO_DATE( '19/01/16 17:30:22', 'YY/MM/DD HH24:MI:SS'), 'Y', '156878-1659230', '광주시 서구 화정4동', 'Y', 19000, '749385628374', TO_DATE( '19/01/14 11:41:14', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 14, 27, TO_DATE( '19/01/20 15:27:28', 'YY/MM/DD HH24:MI:SS'), 'Y', '795817-2465319', '부산시 영도구 청학1동', 'Y', 12800, '794836293857', TO_DATE( '19/01/18 23:25:57', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 3, 10, TO_DATE( '19/02/01 19:57:30', 'YY/MM/DD HH24:MI:SS'), 'Y', '134502-4568792', '광주시 남구 지석동', 'Y', 54000, '473629583726', TO_DATE( '19/01/30 17:47:06', 'YY/MM/DD HH24:MI:SS'), 3);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 8, 35, TO_DATE( '19/02/04 08:27:47', 'YY/MM/DD HH24:MI:SS'), 'Y', '789652-2210036', '대전시 서구 둔산1동', 'Y', 40000, '467495026485', TO_DATE( '19/02/01 19:02:10', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 11, 40, TO_DATE( '19/02/21 19:20:19', 'YY/MM/DD HH24:MI:SS'), 'Y', '320356-621387',  '광주시 서구 쌍촌동', 'Y', 20000, '583029174937', TO_DATE( '19/02/18 22:59:53', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 13, 48, TO_DATE( '19/03/18 09:47:21', 'YY/MM/DD HH24:MI:SS'), 'Y', '465389-7982137', '전라남도 목포시 항동', 'Y', 18000, '47294863847', TO_DATE( '19/03/15 13:20:27', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 12, 36, TO_DATE( '19/03/21 22:25:59', 'YY/MM/DD HH24:MI:SS'), 'Y', '895231-5152388', '경기도 시흥시 대야동', 'Y', 15800, '174938265938', TO_DATE( '19/03/18 17:27:59', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 5, 29, TO_DATE( '19/04/01 15:30:07', 'YY/MM/DD HH24:MI:SS'), 'Y', '132783-8895306',  '부산시 영도구 봉래동5가', 'Y', 12660, '049362689374', TO_DATE( '19/03/29 21:00:00', 'YY/MM/DD HH24:MI:SS'), 2);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 2, 51, TO_DATE( '19/04/05 21:19:51', 'YY/MM/DD HH24:MI:SS'), 'Y', '835120-5598753', '부산시 동래구 명륜동', 'Y', 19000, '274938265948', TO_DATE( '19/04/02 23:36:49', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 17, 47, TO_DATE( '19/05/07 22:21:39', 'YY/MM/DD HH24:MI:SS'), 'Y', '540358-4532198', '서울시 은평구 녹번동', 'Y', 27000, '117493925584', TO_DATE( '19/05/05 15:47:18', 'YY/MM/DD HH24:MI:SS'), 3);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 19, 53, TO_DATE( '19/05/13 12:04:41', 'YY/MM/DD HH24:MI:SS'), 'Y', '456512-8953217', '서울시 은평구 대조동', 'Y', 8000, '147209729348', TO_DATE( '19/05/10 16:18:29', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 18, 11, TO_DATE( '19/05/21 11:30:27', 'YY/MM/DD HH24:MI:SS'), 'Y', '568423-0213215', '대구시 달서구 신당동', 'Y', 19800, '798836263748', TO_DATE( '19/05/19 18:52:42', 'YY/MM/DD HH24:MI:SS'), 1);
INSERT INTO buy VALUES (SEQ_buy.NEXTVAL, 3, 19, TO_DATE( '19/05/30 13:00:06', 'YY/MM/DD HH24:MI:SS'), 'Y', '456890-1322065', '광주시 남구 지석동', 'Y', 15800, '798836284722', TO_DATE( '19/05/28 23:07:59', 'YY/MM/DD HH24:MI:SS'), 1);

INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 5, 10, TO_DATE( '19/01/13 00:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '113231-4565123', '부산시 영도구 봉래동5가', 'Y', 20000, '790037284920', 1);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 3, 3,TO_DATE( '19/01/20 00:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '203156-2564789', '광주시 남구 지석동', 'Y', 44800, '790037284920', 2);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 2, 52,TO_DATE( '19/02/23 00:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '546789-1234567', '부산시 동래구 명륜동', 'Y', 7600, '790037284920', 1);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 7, 12,TO_DATE( '19/02/27 00:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '156786-7410259', '경기도 시흥시 신천동', 'Y', 18000, '790037284920', 1);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 10, 19, TO_DATE( '19/03/02 00:00:00', 'YY/MM/DD HH24:MI:SS'),'Y', '684658-7892547', '광주시 서구 화정4동', 'Y', 15800, '790037284920', 1);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 15, 20, TO_DATE( '19/04/23 00:00:00', 'YY/MM/DD HH24:MI:SS'),'Y', '456878-2315605', '경기도 수원시 권선구 매산로1가', 'Y', 9860, '790037284920', 1);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 4, 7, TO_DATE( '19/04/28 00:00:00', 'YY/MM/DD HH24:MI:SS'),'Y', '935278-0142872',  '광주시 남구 도금동', 'Y', 21000, '790037284920', 2);
INSERT INTO buy (pur_num, mem_num, pro_num, pur_date, deposit, virtual_account, address, delivery, pur_amount, waybill_num, pro_quantity)
   VALUES (SEQ_buy.NEXTVAL, 8, 49, TO_DATE( '19/05/22 00:00:00', 'YY/MM/DD HH24:MI:SS'), 'Y', '351201-4562138', '대전시 서구 둔산1동', 'Y', 24000, '790037284920', 2);


INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 12, TO_DATE( '19/06/01 11:28:12', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1,13, TO_DATE( '19/05/28 12:10:58', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 18, TO_DATE( '19/05/24 09:26:57', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 21, TO_DATE( '19/05/20 01:10:05', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 24, TO_DATE( '19/05/19 01:10:05', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 4, TO_DATE( '19/05/27 02:10:05', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO buy (pur_num, mem_num, pro_num, put_date)
   VALUES ( SEQ_buy.NEXTVAL, 1, 5, TO_DATE( '19/05/25 01:10:05', 'YY/MM/DD HH24:MI:SS'));


CREATE TABLE review(
 mem_num   NUMBER(5),
 pro_num   NUMBER(5),
 review_date   DATE NOT NULL,
 content      VARCHAR2(100) NOT NULL,
 picture      CHAR(1) DEFAULT 'N' CHECK (picture IN('Y', 'N')),
 score      CHAR(3) NOT NULL,
 report      CHAR(1) DEFAULT 'N' CHECK (report IN('Y', 'N')),
CONSTRAINT review_PK PRIMARY KEY (mem_num, pro_num),
CONSTRAINT review_num_fk FOREIGN KEY (mem_num)
      REFERENCES member (mem_num),
CONSTRAINT review_pro_fk FOREIGN KEY (pro_num)
      REFERENCES product (pro_num),
CONSTRAINT score_check
   CHECK (score BETWEEN 1 AND 5) );


INSERT INTO review VALUES (5, 10,TO_DATE('19/01/16 13:27:31', 'YY/MM/DDHH24:MI:SS'), '마스크 치고는 비싼데 효과는 좋은 것 같아요', 'N', '4','N' );
INSERT INTO review VALUES (3, 3, TO_DATE('19/01/22 10:27:00', 'YY/MM/DD HH24:MI:SS'), '유튜브 보고 구매했어요 커버 잘 되고 좋네요', 'N', '4', 'N');
INSERT INTO review VALUES (2, 52, TO_DATE('19/02/25 11:40:08', 'YY/MM/DD HH24:MI:SS'), '색이 저랑 좀 안맞는 것 같아서 아쉬워요','Y', '2', 'Y');
INSERT INTO review VALUES (1, 50, TO_DATE('19/01/10 11:40:08', 'YY/MM/DD HH24:MI:SS'), '입술 라인 잘 따지고 좋네요 다음에 또 구매 할 예정입니다.','Y', '5', 'Y');
INSERT INTO review VALUES (10, 23, TO_DATE('19/01/20 11:40:08', 'YY/MM/DD HH24:MI:SS'), '아이라이너는 처음 써 보는데 좋네요 추천드립니다.','Y', '4', 'Y');
INSERT INTO review VALUES (8, 35, TO_DATE('19/02/07 11:40:08', 'YY/MM/DD HH24:MI:SS'), '자기 전에 바르고 씻어야되는게 조금 귀찮아요','Y', '3', 'Y');
INSERT INTO review VALUES (13, 48, TO_DATE('19/03/21 11:40:08', 'YY/MM/DD HH24:MI:SS'), '유튜브 영상 보고 눈 말고도 다른데도 발라 봤는데 훨씬 좋네요','Y', '5', 'Y');
INSERT INTO review VALUES (7, 12, TO_DATE('19/03/01 11:40:08', 'YY/MM/DD HH24:MI:SS'), '향이 좋아요','Y', '2', 'Y');
INSERT INTO review VALUES (12, 36, TO_DATE('19/03/27 11:40:08', 'YY/MM/DD HH24:MI:SS'), '효과 좋습니다 다음에도 살게요','Y', '2', 'Y');
INSERT INTO review VALUES (19, 53, TO_DATE('19/05/20 11:40:08', 'YY/MM/DD HH24:MI:SS'), '잘 발리기는 하는데 저랑은 맞지 않습니다.','Y', '2', 'Y');
INSERT INTO review VALUES (4, 7, TO_DATE('19/05/01 11:40:08', 'YY/MM/DD HH24:MI:SS'), '정말 물로는 안지워지네요','Y', '2', 'Y');
INSERT INTO review VALUES (18, 11, TO_DATE('19/05/24 11:40:08', 'YY/MM/DD HH24:MI:SS'), '진짜 많이 샀는데 정말 효과 좋습니다.','Y', '2', 'Y');
INSERT INTO review VALUES (3, 19, TO_DATE('19/05/31 11:40:08', 'YY/MM/DD HH24:MI:SS'), '선크림 기능은 잘 하는 것 같아요','Y', '2', 'Y');

CREATE   INDEX   brand_num_idx
   ON   product(brand_num);

CREATE   INDEX youtuber_num_idx
   ON   video(youtuber_num);

purge recyclebin