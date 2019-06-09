TTITLE '브랜드 별 별점 평균'

SELECT brand_name "브랜드 이름", ROUND(AVG(score),2) "평균"
FROM review R, product P, brand B 
WHERE  R.pro_num = P.pro_num
AND P.brand_num = B.brand_num
GROUP BY brand_name
HAVING brand_name = '&brand_name';

TTITLE  OFF