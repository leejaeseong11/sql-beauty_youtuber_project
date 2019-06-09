TTITLE '회원이 장바구니에 등록하고 구매하지 않은 제품을 판매하는 회원의 주소에서 가장 가까운 매장의 정보'

COLUMN pro_name HEADING '제품이름'
COLUMN put_date HEADING '등록 '
COLUMN price HEADING '가격'

select P.pro_name as 제품이름, B.put_date as 등록, P.price 
as 가격,S.store_address as 매장주소
from buy B, product P,administrate A,store S
where  B.mem_num IN (SELECT mem_num
                      FROM member
                      WHERE mem_name LIKE '&mem_name%')
AND B.pur_date IS NULL
AND B.pro_num=P.pro_num
AND P.pro_num=A.pro_num
AND A.store_num=S.store_num
AND S.store_address LIKE '&address%';

TTITLE OFF
CLEAR COLUMN