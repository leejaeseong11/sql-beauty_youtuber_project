
TTITLE '특정 제품 종류를 구매한 사람의 이름과 주소'

COLUMN mem_name HEADING '회원 이름'
COLUMN address HEADING '회원 주소'
COLUMN pro_name HEADING '상품 이름'

SELECT	m.mem_name, m.address, p.pro_name
FROM	member m, buy b, product p
WHERE	p.kind IN '&kind'
AND	b.pro_num=p.pro_num
AND	b.mem_num=m.mem_num;

TTITLE OFF
CLEAR COLUMN