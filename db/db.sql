-- 회원 테이블 생성
CREATE TABLE member(
	id VARCHAR(16) PRIMARY KEY, -- 아이디
	pw VARCHAR(330) NOT NULL, -- 비밀번호
	NAME VARCHAR(100) NOT NULL, -- 이름
	email VARCHAR(100) NOT NULL, -- 이메일
	tel VARCHAR(13), -- 전화 번호
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 가입일
	POINT INT DEFAULT 0, -- 포인트
	job INT NOT NULL, -- 직업 학생: 1, 선생님: 2
);

-- 문제 qna 게시판
-- 질문은 학생만
-- 답변은 선생님만
CREATE TABLE problem_qna(
	qno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 진로 qna 게시판
-- 질문은 학생만
-- 답변은 선생님만
CREATE TABLE career_qna(
	qno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 이건 하나의 테이블에 두 게시판 정보를 관리하는 경우
-- 문제,진로 qna 게시판
-- 질문은 학생만
-- 답변은 선생님만
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	cp INT, -- 문제 게시판 1, 진로 게시판 2
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 자유 게시판
-- 모두 사용 가능
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- 자유게시판 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);
	
-- 학생 게시판
-- job을 통해 학생만 접근하도록 설계
CREATE TABLE student_board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- 자유게시판 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0 -- 조회수
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);
	
-- 선생님 게시판
-- job을 통해 학생만 접근하도록 설계
CREATE TABLE teacher_board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- 자유게시판 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0 -- 조회수
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);