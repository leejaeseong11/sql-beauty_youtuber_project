TTITLE '최근 일주일간 영상을 업로드한 유투버중에서 구독을 시작한 회원'

COLUMN youtuber_nickname HEADING '유튜버 닉네임'
COLUMN youtuber_name HEADING '유튜버 이름'
COLUMN subscription_date HEADING '구독'
COLUMN mem_name HEADING '회원 이름'

SELECT distinct  Y.youtuber_nickname, Y.youtuber_name, S.subscription_date, M.mem_name        
FROM   youtuber Y, member M, video V, subscribe S
WHERE   V.youtuber_num = Y.youtuber_num
AND   Y.youtuber_num = S.youtuber_num
AND   S.mem_num = M.mem_num
AND  V.video_upload_date  BETWEEN (SYSDATE - 7) AND SYSDATE
AND  S.subscription_date  BETWEEN (SYSDATE - 7) AND SYSDATE
ORDER BY S.subscription_date ;

TTITLE OFF
CLEAR COLUMN