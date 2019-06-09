
TTITLE '구독자 수가 100만 이상 1000만 미만인 유튜버가 주로 사용하는 제품과 사용법'

COLUMN PRO_NAME HEADING '상품 이름'
COLUMN price HEADING '가격'
COLUMN basic_usage HEADING '제품 기본 사용법'

SELECT    A.pro_name, A.price, A.basic_usage
FROM    PRODUCT A, PREFER_PRO B
WHERE   B.youtuber_num
   IN (SELECT youtuber_num
        FROM youtuber
        WHERE subscriber_cnt  BETWEEN 1000000 AND 9999999) 
AND   A.pro_num = B.pro_num;

TTITLE OFF
CLEAR COLUMN