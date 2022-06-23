SET ECHO OFF
PROMPT
PROMPT The following tables will be dropped and recreated by
PROMPT this script: BOOK, BOOK_SALES, CURRENCY, and MONTH.
PROMPT
--PAUSE Press ctrl-c to stop, or any other key to continue...
--PAUSE Are you really sure? Press ctrl-c to stop, any other key to continue...

SET ECHO ON
SET DEFINE OFF

DROP TABLE book;
DROP TABLE book_sales;
DROP TABLE currency;
DROP TABLE month;

CREATE TABLE month (
    m       NUMBER, y NUMBER);

INSERT INTO month VALUES (1, 2002);
INSERT INTO month VALUES (2, 2002);
INSERT INTO month VALUES (3, 2002);
INSERT INTO month VALUES (4, 2002);
INSERT INTO month VALUES (5, 2002);
INSERT INTO month VALUES (6, 2002);
INSERT INTO month VALUES (7, 2002);
INSERT INTO month VALUES (8, 2002);
INSERT INTO month VALUES (9, 2002);
INSERT INTO month VALUES (10, 2002);
INSERT INTO month VALUES (11, 2002);
INSERT INTO month VALUES (12, 2002);
INSERT INTO month VALUES (1, 2003);
INSERT INTO month VALUES (2, 2003);
INSERT INTO month VALUES (3, 2003);
INSERT INTO month VALUES (4, 2003);
INSERT INTO month VALUES (5, 2003);
INSERT INTO month VALUES (6, 2003);
INSERT INTO month VALUES (7, 2003);
INSERT INTO month VALUES (8, 2003);
INSERT INTO month VALUES (9, 2003);
INSERT INTO month VALUES (10, 2003);
INSERT INTO month VALUES (11, 2003);
INSERT INTO month VALUES (12, 2003);
INSERT INTO month VALUES (1, 2004);
INSERT INTO month VALUES (2, 2004);
INSERT INTO month VALUES (3, 2004);
INSERT INTO month VALUES (4, 2004);
INSERT INTO month VALUES (5, 2004);
INSERT INTO month VALUES (6, 2004);
INSERT INTO month VALUES (7, 2004);
INSERT INTO month VALUES (8, 2004);
INSERT INTO month VALUES (9, 2004);
INSERT INTO month VALUES (10, 2004);
INSERT INTO month VALUES (11, 2004);
INSERT INTO month VALUES (12, 2004);

COMMIT;

CREATE TABLE book (
    isbn        VARCHAR2(13),
    name        VARCHAR2(50));

CREATE TABLE book_sales (
    isbn            VARCHAR2(13),
    country         VARCHAR2(2),
    year            NUMBER,
    month           NUMBER,
    gross_revenue   NUMBER,
    return_revenue  NUMBER,
    net_revenue     NUMBER,
    gross_units     NUMBER,
    return_units    NUMBER,
    net_units       NUMBER);

CREATE TABLE currency (
    country         VARCHAR2(2),
    to_us           NUMBER);

INSERT INTO currency VALUES ('US',1);
INSERT INTO currency VALUES ('CA',0.74);

COMMIT;

INSERT INTO book VALUES ('0-596-00441-9','Oracle SQL*Plus Pocket Reference, 2nd Edition');
INSERT INTO book VALUES ('1-56592-948-9','Oracle SQL*Loader: The Definitive Guide');
--INSERT INTO book VALUES ('0-596-00601-2','Oracle Regular Expressions Pocket Reference');

COMMIT;

INSERT INTO book_sales VALUES ('0-596-00441-9','US',2002,10,18514.1,0,18514.1,3620,0,3620);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2002,11,8810.2,0,8810.2,1760,0,1760);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2002,12,32154.3,150.4,32003.9,5240,30,5210);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,1,19479.5,825.6,18653.9,3410,130,3280);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,2,8505.4,189.7,8315.7,1300,40,1260);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,3,16909.3,5327.8,11581.5,2670,920,1750);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,4,6977.1,216.2,6760.9,1110,30,1080);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,5,8394.2,2410.6,5983.6,1500,410,1090);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,6,4224.1,552.1,3672,650,140,510);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,7,8172.3,465.1,7707.2,1380,60,1320);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,8,3801,248.1,3552.9,590,30,560);
INSERT INTO book_sales VALUES ('0-596-00441-9','US',2003,9,6591.5,484.5,6107,910,60,850);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,1,24773.7,6150.6,18623.1,1750,360,1390);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,2,7444.4,5283.8,2160.6,440,350,90);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,3,5374.6,894.3,4480.3,280,50,230);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,4,4657.9,2571.3,2086.6,270,150,120);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,5,19540.6,10506.4,9034.2,1140,600,540);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,6,5806.2,8756,-2949.8,330,520,-190);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,7,11127.2,3012.8,8114.4,640,180,460);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,8,3050.6,598.4,2452.2,170,30,140);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,9,2407.8,735.5,1672.3,130,40,90);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,10,850.8,103,747.8,50,0,50);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,11,2567,1414.1,1152.9,150,90,60);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2002,12,5561.3,830.6,4730.7,330,50,280);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,1,6466.4,2038.7,4427.7,390,140,250);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,2,165.3,46,119.3,0,0,0);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,3,7664,1919.5,5744.5,450,140,310);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,4,10195.9,1606.9,8589,590,80,510);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,5,3342.8,280.5,3062.3,200,20,180);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,6,2428.7,1568,860.7,140,130,10);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,7,1211,171.4,1039.6,60,20,40);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,8,6508.1,2765.7,3742.4,360,210,150);
INSERT INTO book_sales VALUES ('1-56592-948-9','US',2003,9,3965,1240.1,2724.9,230,70,160);
--INSERT INTO book_sales VALUES ('0-596-00601-2','US',2003,9,17101.9,0,17101.9,11670,0,11670);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2002,10,9257.05,0,9257.05,1810,0,1810);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2002,11,4405.1,0,4405.1,880,0,880);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2002,12,16077.15,45.12,16032.03,2620,9,2611);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,1,9739.75,247.68,9492.07,1705,39,1666);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,2,4252.7,56.91,4195.79,650,12,638);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,3,8454.65,1598.34,6856.31,1335,276,1059);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,4,3488.55,64.86,3423.69,555,9,546);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,5,4197.1,723.18,3473.92,750,123,627);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,6,2112.05,165.63,1946.42,325,42,283);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,7,4086.15,139.53,3946.62,690,18,672);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,8,1900.5,74.43,1826.07,295,9,286);
INSERT INTO book_sales VALUES ('0-596-00441-9','CA',2003,9,3295.75,145.35,3150.4,455,18,437);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,1,12386.85,1845.18,10541.67,875,108,767);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,2,3722.2,1585.14,2137.06,220,105,115);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,3,2687.3,268.29,2419.01,140,15,125);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,4,2328.95,771.39,1557.56,135,45,90);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,5,9770.3,3151.92,6618.38,570,180,390);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,6,2903.1,2626.8,276.3,165,156,9);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,7,5563.6,903.84,4659.76,320,54,266);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,8,1525.3,179.52,1345.78,85,9,76);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,9,1203.9,220.65,983.25,65,12,53);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,10,425.4,30.9,394.5,25,0,25);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,11,1283.5,424.23,859.27,75,27,48);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2002,12,2780.65,249.18,2531.47,165,15,150);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,1,3233.2,611.61,2621.59,195,42,153);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,2,82.65,13.8,68.85,0,0,0);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,3,3832,575.85,3256.15,225,42,183);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,4,5097.95,482.07,4615.88,295,24,271);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,5,1671.4,84.15,1587.25,100,6,94);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,6,1214.35,470.4,743.95,70,39,31);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,7,605.5,51.42,554.08,30,6,24);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,8,3254.05,829.71,2424.34,180,63,117);
INSERT INTO book_sales VALUES ('1-56592-948-9','CA',2003,9,1982.5,372.03,1610.47,115,21,94);

COMMIT;

SET DEFINE ON
SET ECHO OFF

