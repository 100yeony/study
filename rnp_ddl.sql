CREATE TABLE public.error_report (
	seq serial4 NOT NULL, -- 일련번호
	service_code varchar(50) NULL, -- 서비스코드
	error_name varchar(100) NULL, -- 오류명
	error_content varchar(5000) NULL, -- 오류내용
	created_time timestamp NULL DEFAULT CURRENT_TIMESTAMP, -- 생성시간
	error_location varchar(500) NULL, -- 오류발생위치
	error_cause varchar(5000) NULL, -- 오류원인
	error_solution varchar(5000) NULL, -- 조치방안
	CONSTRAINT error_report_pkey PRIMARY KEY (seq)
);
COMMENT ON TABLE public.error_report IS '오류 보고서';

-- Column comments

COMMENT ON COLUMN public.error_report.seq IS '일련번호';
COMMENT ON COLUMN public.error_report.service_code IS '서비스코드';
COMMENT ON COLUMN public.error_report.error_name IS '오류명';
COMMENT ON COLUMN public.error_report.error_content IS '오류내용';
COMMENT ON COLUMN public.error_report.created_time IS '생성시간';
COMMENT ON COLUMN public.error_report.error_location IS '오류발생위치';
COMMENT ON COLUMN public.error_report.error_cause IS '오류원인';
COMMENT ON COLUMN public.error_report.error_solution IS '조치방안';


-- public.service_info definition

-- Drop table

-- DROP TABLE public.service_info;

CREATE TABLE public.service_info (
	seq serial4 NOT NULL, -- 일련번호
	service_code varchar(50) NOT NULL, -- 서비스코드
	service_name_eng varchar(100) NULL, -- 서비스명(영어)
	service_name_kr varchar(100) NULL, -- 서비스명(한글)
	service_desc varchar(5000) NULL, -- 서비스개요
	CONSTRAINT service_info_pkey PRIMARY KEY (service_code)
);
COMMENT ON TABLE public.service_info IS '서비스 정보';

-- Column comments

COMMENT ON COLUMN public.service_info.seq IS '일련번호';
COMMENT ON COLUMN public.service_info.service_code IS '서비스코드';
COMMENT ON COLUMN public.service_info.service_name_kr IS '서비스명(한글)';
COMMENT ON COLUMN public.service_info.service_desc IS '서비스개요';
COMMENT ON COLUMN public.service_info.service_name_eng IS '서비스명(영어)';


-- public.user_info definition

-- Drop table

-- DROP TABLE public.user_info;

CREATE TABLE public.user_info (
	seq serial4 NOT NULL, -- 일련번호
	service_code varchar(50) NULL, -- 서비스코드
	email varchar(100) NULL, -- 이메일
	CONSTRAINT user_info_pkey PRIMARY KEY (seq)
);
COMMENT ON TABLE public.user_info IS '사용자 정보';

-- Column comments

COMMENT ON COLUMN public.user_info.seq IS '일련번호';
COMMENT ON COLUMN public.user_info.service_code IS '서비스코드';
COMMENT ON COLUMN public.user_info.email IS '이메일';
