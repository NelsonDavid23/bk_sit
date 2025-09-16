--
-- PostgreSQL database dump
--

\restrict OvV03awIfcW7uuXsyK1rov8y1mSQ3y0ZE8W7LDhbc7KnTghGO3CztvUsIdRUxws

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-15 23:32:11 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 236 (class 1259 OID 16533)
-- Name: academic_cut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_cut (
    academic_cut_id integer NOT NULL,
    semester_id integer,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    cut_type_id integer,
    CONSTRAINT academic_cut_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE public.academic_cut OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16532)
-- Name: academic_cut_academic_cut_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academic_cut_academic_cut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academic_cut_academic_cut_id_seq OWNER TO postgres;

--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 235
-- Name: academic_cut_academic_cut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academic_cut_academic_cut_id_seq OWNED BY public.academic_cut.academic_cut_id;


--
-- TOC entry 254 (class 1259 OID 16712)
-- Name: academic_cut_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_cut_grades (
    academic_cut_grade_id integer NOT NULL,
    student_id integer NOT NULL,
    academic_cut_id integer NOT NULL,
    delivery_time timestamp without time zone,
    grade numeric(2,1) NOT NULL,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT academic_cut_grades_grade_check CHECK (((grade >= 0.0) AND (grade <= 5.0))),
    CONSTRAINT academic_cut_grades_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE public.academic_cut_grades OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16711)
-- Name: academic_cut_grades_academic_cut_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academic_cut_grades_academic_cut_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academic_cut_grades_academic_cut_grade_id_seq OWNER TO postgres;

--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 253
-- Name: academic_cut_grades_academic_cut_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academic_cut_grades_academic_cut_grade_id_seq OWNED BY public.academic_cut_grades.academic_cut_grade_id;


--
-- TOC entry 286 (class 1259 OID 17003)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    auth_group_id integer NOT NULL,
    name character varying(150)
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17002)
-- Name: auth_group_auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 285
-- Name: auth_group_auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_auth_group_id_seq OWNED BY public.auth_group.auth_group_id;


--
-- TOC entry 290 (class 1259 OID 17022)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    auth_group_permissions_id integer NOT NULL,
    permission_id integer,
    group_id integer
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 17021)
-- Name: auth_group_permissions_auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 289
-- Name: auth_group_permissions_auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.auth_group_permissions_id;


--
-- TOC entry 284 (class 1259 OID 16996)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    auth_permission_id integer NOT NULL,
    name character varying(25),
    content_type integer,
    codename character varying(100)
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16995)
-- Name: auth_permission_auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 283
-- Name: auth_permission_auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_auth_permission_id_seq OWNED BY public.auth_permission.auth_permission_id;


--
-- TOC entry 295 (class 1259 OID 24691)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    user_id integer NOT NULL,
    password character varying(128) DEFAULT ''::character varying NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean DEFAULT false NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    date_joined timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 24690)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 294
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.user_id;


--
-- TOC entry 242 (class 1259 OID 16607)
-- Name: classification_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classification_types (
    type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    category character varying(50),
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT classification_types_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.classification_types OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16606)
-- Name: classification_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classification_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classification_types_type_id_seq OWNER TO postgres;

--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 241
-- Name: classification_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classification_types_type_id_seq OWNED BY public.classification_types.type_id;


--
-- TOC entry 228 (class 1259 OID 16417)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    semester_id integer,
    name character varying(50) NOT NULL,
    acronym character varying(10) NOT NULL,
    description text,
    credits integer DEFAULT 3
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16416)
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_course_id_seq OWNER TO postgres;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 227
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- TOC entry 232 (class 1259 OID 16503)
-- Name: course_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_students (
    course_id integer NOT NULL,
    student_id integer NOT NULL,
    course_student_id integer NOT NULL,
    enrollment_date timestamp without time zone,
    final_grade numeric(2,1),
    status character varying(10)
);


ALTER TABLE public.course_students OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16502)
-- Name: course_students_course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_students_course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_students_course_course_id_seq OWNER TO postgres;

--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 231
-- Name: course_students_course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_students_course_course_id_seq OWNED BY public.course_students.course_id;


--
-- TOC entry 234 (class 1259 OID 16508)
-- Name: course_teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_teachers (
    course_id integer NOT NULL,
    teacher_id integer NOT NULL,
    course_teacher_id integer NOT NULL,
    assignment_date timestamp without time zone,
    status character varying(10),
    CONSTRAINT course_teachers_status_chk CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying, 'pending'::character varying, 'cancelled'::character varying, 'completed'::character varying])::text[])))
);


ALTER TABLE public.course_teachers OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16507)
-- Name: course_teachers_course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_teachers_course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_teachers_course_course_id_seq OWNER TO postgres;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 233
-- Name: course_teachers_course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_teachers_course_course_id_seq OWNED BY public.course_teachers.course_id;


--
-- TOC entry 292 (class 1259 OID 17051)
-- Name: cut_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cut_type (
    cut_type_id integer NOT NULL,
    name character varying(50),
    percentage numeric(5,2)
);


ALTER TABLE public.cut_type OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 17050)
-- Name: cut_type_cut_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cut_type_cut_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cut_type_cut_type_id_seq OWNER TO postgres;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 291
-- Name: cut_type_cut_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cut_type_cut_type_id_seq OWNED BY public.cut_type.cut_type_id;


--
-- TOC entry 246 (class 1259 OID 16630)
-- Name: data_test_model_prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_test_model_prediction (
    data_train_model_prediction_id integer NOT NULL,
    course_id integer,
    type_id integer,
    item1 numeric(3,2),
    item2 numeric(3,2),
    item3 numeric(3,2),
    item4 numeric(3,2),
    item5 numeric(3,2),
    item6 numeric(3,2),
    item7 numeric(3,2),
    item8 numeric(3,2),
    item9 numeric(3,2),
    item10 numeric(3,2),
    item11 numeric(3,2),
    item12 numeric(3,2),
    item13 numeric(3,2),
    item14 numeric(3,2),
    item15 numeric(3,2),
    item16 numeric(3,2),
    item17 numeric(3,2),
    item18 numeric(3,2),
    item19 numeric(3,2),
    item20 numeric(3,2),
    item21 numeric(3,2),
    item22 numeric(3,2),
    item23 numeric(3,2),
    item24 numeric(3,2),
    item25 numeric(3,2),
    item26 numeric(3,2),
    item27 numeric(3,2),
    item28 numeric(3,2),
    item29 numeric(3,2),
    item30 numeric(3,2),
    item31 numeric(3,2),
    item32 numeric(3,2),
    item33 numeric(3,2),
    item34 numeric(3,2),
    item35 numeric(3,2),
    item36 numeric(3,2),
    c1 numeric(5,2),
    c2 numeric(5,2),
    c3 numeric(5,2),
    n_final numeric(2,1)
);


ALTER TABLE public.data_test_model_prediction OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16629)
-- Name: data_test_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_test_model_prediction_data_train_model_prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_test_model_prediction_data_train_model_prediction_id_seq OWNER TO postgres;

--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 245
-- Name: data_test_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_test_model_prediction_data_train_model_prediction_id_seq OWNED BY public.data_test_model_prediction.data_train_model_prediction_id;


--
-- TOC entry 244 (class 1259 OID 16618)
-- Name: data_train_model_prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_train_model_prediction (
    data_train_model_prediction_id integer NOT NULL,
    course_id integer,
    type_id integer,
    item1 numeric(3,2),
    item2 numeric(3,2),
    item3 numeric(3,2),
    item4 numeric(3,2),
    item5 numeric(3,2),
    item6 numeric(3,2),
    item7 numeric(3,2),
    item8 numeric(3,2),
    item9 numeric(3,2),
    item10 numeric(3,2),
    item11 numeric(3,2),
    item12 numeric(3,2),
    item13 numeric(3,2),
    item14 numeric(3,2),
    item15 numeric(3,2),
    item16 numeric(3,2),
    item17 numeric(3,2),
    item18 numeric(3,2),
    item19 numeric(3,2),
    item20 numeric(3,2),
    item21 numeric(3,2),
    item22 numeric(3,2),
    item23 numeric(3,2),
    item24 numeric(3,2),
    item25 numeric(3,2),
    item26 numeric(3,2),
    item27 numeric(3,2),
    item28 numeric(3,2),
    item29 numeric(3,2),
    item30 numeric(3,2),
    item31 numeric(3,2),
    item32 numeric(3,2),
    item33 numeric(3,2),
    item34 numeric(3,2),
    item35 numeric(3,2),
    item36 numeric(3,2),
    c1 numeric(5,2),
    c2 numeric(5,2),
    c3 numeric(5,2),
    n_final numeric(2,1)
);


ALTER TABLE public.data_train_model_prediction OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16617)
-- Name: data_train_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_train_model_prediction_data_train_model_prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_train_model_prediction_data_train_model_prediction_id_seq OWNER TO postgres;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 243
-- Name: data_train_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_train_model_prediction_data_train_model_prediction_id_seq OWNED BY public.data_train_model_prediction.data_train_model_prediction_id;


--
-- TOC entry 280 (class 1259 OID 16978)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    django_admin_log_id integer NOT NULL,
    action_time timestamp without time zone,
    object_id text,
    object_rpr character varying(200),
    action_flag smallint,
    change_message text,
    content_type integer,
    user_id integer
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16977)
-- Name: django_admin_log_django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 279
-- Name: django_admin_log_django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_django_admin_log_id_seq OWNED BY public.django_admin_log.django_admin_log_id;


--
-- TOC entry 278 (class 1259 OID 16971)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    django_content_type_id integer NOT NULL,
    app_label character varying(100),
    model character varying(100)
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16970)
-- Name: django_content_type_django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 277
-- Name: django_content_type_django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_django_content_type_id_seq OWNED BY public.django_content_type.django_content_type_id;


--
-- TOC entry 282 (class 1259 OID 16987)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    django_migrations_id integer NOT NULL,
    app character varying,
    name character varying,
    action_time timestamp without time zone
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16986)
-- Name: django_migrations_django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 281
-- Name: django_migrations_django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_django_migrations_id_seq OWNED BY public.django_migrations.django_migrations_id;


--
-- TOC entry 260 (class 1259 OID 16796)
-- Name: item_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_header (
    item_header_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT item_header_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.item_header OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16795)
-- Name: item_header_item_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_header_item_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_header_item_header_id_seq OWNER TO postgres;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 259
-- Name: item_header_item_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_header_item_header_id_seq OWNED BY public.item_header.item_header_id;


--
-- TOC entry 264 (class 1259 OID 16818)
-- Name: item_response_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_response_detail (
    item_response_detail_id integer NOT NULL,
    mslq_response_id integer,
    mslq_item_id integer,
    response_date timestamp without time zone,
    score integer,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT item_response_detail_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.item_response_detail OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16817)
-- Name: item_response_detail_item_response_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_response_detail_item_response_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_response_detail_item_response_detail_id_seq OWNER TO postgres;

--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 263
-- Name: item_response_detail_item_response_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_response_detail_item_response_detail_id_seq OWNED BY public.item_response_detail.item_response_detail_id;


--
-- TOC entry 262 (class 1259 OID 16807)
-- Name: mslq_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mslq_item (
    mslq_item_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    category character varying(50),
    item_number integer,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT mslq_item_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.mslq_item OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16806)
-- Name: mslq_item_mslq_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mslq_item_mslq_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mslq_item_mslq_item_id_seq OWNER TO postgres;

--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 261
-- Name: mslq_item_mslq_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mslq_item_mslq_item_id_seq OWNED BY public.mslq_item.mslq_item_id;


--
-- TOC entry 258 (class 1259 OID 16782)
-- Name: mslq_response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mslq_response (
    mslq_response_id integer NOT NULL,
    course_student_id integer NOT NULL,
    total_score numeric(5,2),
    response_date timestamp without time zone,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT mslq_response_status_check CHECK (((status)::text = ANY (ARRAY['completed'::text, 'partial'::text, 'invalid'::text])))
);


ALTER TABLE public.mslq_response OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16781)
-- Name: mslq_response_mslq_response_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mslq_response_mslq_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mslq_response_mslq_response_id_seq OWNER TO postgres;

--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 257
-- Name: mslq_response_mslq_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mslq_response_mslq_response_id_seq OWNED BY public.mslq_response.mslq_response_id;


--
-- TOC entry 248 (class 1259 OID 16643)
-- Name: output_model_prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.output_model_prediction (
    output_model_prediction_id integer NOT NULL,
    course_student_id integer,
    academic_cut_id integer,
    n_final_pred numeric(5,2) NOT NULL,
    confidence_score numeric(5,2),
    model_version character varying(20),
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT output_model_prediction_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.output_model_prediction OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16642)
-- Name: output_model_prediction_output_model_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.output_model_prediction_output_model_prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.output_model_prediction_output_model_prediction_id_seq OWNER TO postgres;

--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 247
-- Name: output_model_prediction_output_model_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.output_model_prediction_output_model_prediction_id_seq OWNED BY public.output_model_prediction.output_model_prediction_id;


--
-- TOC entry 226 (class 1259 OID 16410)
-- Name: semester; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semester (
    semester_id integer NOT NULL,
    semester_level character varying(20)
);


ALTER TABLE public.semester OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16409)
-- Name: semester_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semester_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semester_semester_id_seq OWNER TO postgres;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 225
-- Name: semester_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semester_semester_id_seq OWNED BY public.semester.semester_id;


--
-- TOC entry 276 (class 1259 OID 16949)
-- Name: student_exercise_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_exercise_attempts (
    student_exercise_attempt_id integer NOT NULL,
    student_id integer,
    support_exercise_id integer,
    attempt_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score numeric(5,2) NOT NULL,
    execution_time_ms integer,
    feedback text,
    code_submitted text,
    status character varying(10) NOT NULL
);


ALTER TABLE public.student_exercise_attempts OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16948)
-- Name: student_exercise_attempts_student_exercise_attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_exercise_attempts_student_exercise_attempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_exercise_attempts_student_exercise_attempt_id_seq OWNER TO postgres;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 275
-- Name: student_exercise_attempts_student_exercise_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_exercise_attempts_student_exercise_attempt_id_seq OWNED BY public.student_exercise_attempts.student_exercise_attempt_id;


--
-- TOC entry 230 (class 1259 OID 16450)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    student_code character varying(20) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16590)
-- Name: students_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_tasks (
    students_task_id integer NOT NULL,
    students_student_id integer NOT NULL,
    task_task_id integer NOT NULL
);


ALTER TABLE public.students_tasks OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16589)
-- Name: students_task_task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_task_task_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_task_task_task_id_seq OWNER TO postgres;

--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 239
-- Name: students_task_task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_task_task_task_id_seq OWNED BY public.students_tasks.task_task_id;


--
-- TOC entry 274 (class 1259 OID 16938)
-- Name: support_exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_exercise (
    support_exercise_id integer NOT NULL,
    assignment_id integer,
    title character varying(200) NOT NULL,
    statement text NOT NULL,
    difficulty_level integer NOT NULL,
    number_of_tries integer,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL
);


ALTER TABLE public.support_exercise OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 16937)
-- Name: support_exercise_support_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_exercise_support_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.support_exercise_support_exercise_id_seq OWNER TO postgres;

--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 273
-- Name: support_exercise_support_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_exercise_support_exercise_id_seq OWNED BY public.support_exercise.support_exercise_id;


--
-- TOC entry 266 (class 1259 OID 16843)
-- Name: support_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_topics (
    support_topic_id integer NOT NULL,
    academic_cut_id integer,
    topic character varying(150) NOT NULL,
    description text,
    status character varying(20) DEFAULT 'Active'::character varying NOT NULL
);


ALTER TABLE public.support_topics OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16842)
-- Name: support_topics_support_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_topics_support_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.support_topics_support_topic_id_seq OWNER TO postgres;

--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 265
-- Name: support_topics_support_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_topics_support_topic_id_seq OWNED BY public.support_topics.support_topic_id;


--
-- TOC entry 238 (class 1259 OID 16562)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    task_id integer NOT NULL,
    course_teacher_id integer NOT NULL,
    academic_cut_id integer,
    name character varying(150) NOT NULL,
    description text NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    percentage numeric(5,2) DEFAULT 0.00
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16734)
-- Name: task_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_grades (
    task_grade_id integer NOT NULL,
    students_task_id integer NOT NULL,
    delivery_time timestamp without time zone,
    results text,
    grade numeric(2,1) NOT NULL,
    status character varying(10) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT task_grades_grade_check CHECK (((grade >= 0.0) AND (grade <= 5.0))),
    CONSTRAINT task_grades_status_check CHECK (((status)::text = ANY (ARRAY['open'::text, 'closed'::text, 'pending'::text, 'completed'::text, 'cancelled'::text, 'active'::text, 'inactive'::text])))
);


ALTER TABLE public.task_grades OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16733)
-- Name: task_grades_task_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_grades_task_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_grades_task_grade_id_seq OWNER TO postgres;

--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 255
-- Name: task_grades_task_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_grades_task_grade_id_seq OWNED BY public.task_grades.task_grade_id;


--
-- TOC entry 237 (class 1259 OID 16561)
-- Name: task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_task_id_seq OWNER TO postgres;

--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 237
-- Name: task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_task_id_seq OWNED BY public.task.task_id;


--
-- TOC entry 229 (class 1259 OID 16440)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    speciality character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16662)
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    blacklisted_token_id integer NOT NULL,
    blacklisted_at timestamp without time zone,
    token_id bigint
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16661)
-- Name: token_blacklist_blacklistedtoken_blacklisted_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_blacklisted_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_blacklistedtoken_blacklisted_token_id_seq OWNER TO postgres;

--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 249
-- Name: token_blacklist_blacklistedtoken_blacklisted_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_blacklisted_token_id_seq OWNED BY public.token_blacklist_blacklistedtoken.blacklisted_token_id;


--
-- TOC entry 252 (class 1259 OID 16669)
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    outstanding_token_id integer NOT NULL,
    token text,
    created_at timestamp without time zone
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16668)
-- Name: token_blacklist_outstandingtoken_outstanding_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_outstanding_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_outstandingtoken_outstanding_token_id_seq OWNER TO postgres;

--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 251
-- Name: token_blacklist_outstandingtoken_outstanding_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_outstanding_token_id_seq OWNED BY public.token_blacklist_outstandingtoken.outstanding_token_id;


--
-- TOC entry 268 (class 1259 OID 16865)
-- Name: tutoring_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutoring_group (
    tutoring_group_id integer NOT NULL,
    course_teacher_id integer,
    tutoring_topic_id integer,
    tutoring_date date NOT NULL,
    tutoring_hour time without time zone NOT NULL,
    tutoring_site text,
    tutoring_message text,
    date date NOT NULL,
    status character varying(20) DEFAULT 'Schedule'::character varying NOT NULL
);


ALTER TABLE public.tutoring_group OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16864)
-- Name: tutoring_group_tutoring_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tutoring_group_tutoring_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tutoring_group_tutoring_group_id_seq OWNER TO postgres;

--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 267
-- Name: tutoring_group_tutoring_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tutoring_group_tutoring_group_id_seq OWNED BY public.tutoring_group.tutoring_group_id;


--
-- TOC entry 272 (class 1259 OID 16897)
-- Name: tutoring_participation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutoring_participation (
    tutoring_participation_id integer NOT NULL,
    tutoring_group_id integer,
    course_student_id integer,
    enrollment_date timestamp without time zone,
    participation_status character varying(15) DEFAULT 'Active'::character varying NOT NULL
);


ALTER TABLE public.tutoring_participation OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 16896)
-- Name: tutoring_participation_tutoring_participation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tutoring_participation_tutoring_participation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tutoring_participation_tutoring_participation_id_seq OWNER TO postgres;

--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 271
-- Name: tutoring_participation_tutoring_participation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tutoring_participation_tutoring_participation_id_seq OWNED BY public.tutoring_participation.tutoring_participation_id;


--
-- TOC entry 270 (class 1259 OID 16881)
-- Name: tutoring_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutoring_topic (
    tutoring_topic_id integer NOT NULL,
    topic character varying(150) NOT NULL,
    description text,
    status character varying(20) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT tutoring_topic_status_check CHECK (((status)::text = ANY (ARRAY['active'::text, 'inactive'::text])))
);


ALTER TABLE public.tutoring_topic OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16880)
-- Name: tutoring_topics_tutoring_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tutoring_topics_tutoring_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tutoring_topics_tutoring_topic_id_seq OWNER TO postgres;

--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 269
-- Name: tutoring_topics_tutoring_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tutoring_topics_tutoring_topic_id_seq OWNED BY public.tutoring_topic.tutoring_topic_id;


--
-- TOC entry 288 (class 1259 OID 17010)
-- Name: user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_groups (
    user_groups_id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.user_groups OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17009)
-- Name: user_groups_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_groups_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_groups_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 287
-- Name: user_groups_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_groups_user_groups_id_seq OWNED BY public.user_groups.user_groups_id;


--
-- TOC entry 3399 (class 2604 OID 16536)
-- Name: academic_cut academic_cut_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut ALTER COLUMN academic_cut_id SET DEFAULT nextval('public.academic_cut_academic_cut_id_seq'::regclass);


--
-- TOC entry 3413 (class 2604 OID 16715)
-- Name: academic_cut_grades academic_cut_grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut_grades ALTER COLUMN academic_cut_grade_id SET DEFAULT nextval('public.academic_cut_grades_academic_cut_grade_id_seq'::regclass);


--
-- TOC entry 3441 (class 2604 OID 17006)
-- Name: auth_group auth_group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN auth_group_id SET DEFAULT nextval('public.auth_group_auth_group_id_seq'::regclass);


--
-- TOC entry 3443 (class 2604 OID 17025)
-- Name: auth_group_permissions auth_group_permissions_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN auth_group_permissions_id SET DEFAULT nextval('public.auth_group_permissions_auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3440 (class 2604 OID 16999)
-- Name: auth_permission auth_permission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN auth_permission_id SET DEFAULT nextval('public.auth_permission_auth_permission_id_seq'::regclass);


--
-- TOC entry 3445 (class 2604 OID 24694)
-- Name: auth_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN user_id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 16610)
-- Name: classification_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classification_types ALTER COLUMN type_id SET DEFAULT nextval('public.classification_types_type_id_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 16420)
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- TOC entry 3397 (class 2604 OID 16506)
-- Name: course_students course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_students ALTER COLUMN course_id SET DEFAULT nextval('public.course_students_course_course_id_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 16511)
-- Name: course_teachers course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_teachers ALTER COLUMN course_id SET DEFAULT nextval('public.course_teachers_course_course_id_seq'::regclass);


--
-- TOC entry 3444 (class 2604 OID 17054)
-- Name: cut_type cut_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cut_type ALTER COLUMN cut_type_id SET DEFAULT nextval('public.cut_type_cut_type_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 16633)
-- Name: data_test_model_prediction data_train_model_prediction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_test_model_prediction ALTER COLUMN data_train_model_prediction_id SET DEFAULT nextval('public.data_test_model_prediction_data_train_model_prediction_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 16621)
-- Name: data_train_model_prediction data_train_model_prediction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_train_model_prediction ALTER COLUMN data_train_model_prediction_id SET DEFAULT nextval('public.data_train_model_prediction_data_train_model_prediction_id_seq'::regclass);


--
-- TOC entry 3438 (class 2604 OID 16981)
-- Name: django_admin_log django_admin_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN django_admin_log_id SET DEFAULT nextval('public.django_admin_log_django_admin_log_id_seq'::regclass);


--
-- TOC entry 3437 (class 2604 OID 16974)
-- Name: django_content_type django_content_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN django_content_type_id SET DEFAULT nextval('public.django_content_type_django_content_type_id_seq'::regclass);


--
-- TOC entry 3439 (class 2604 OID 16990)
-- Name: django_migrations django_migrations_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN django_migrations_id SET DEFAULT nextval('public.django_migrations_django_migrations_id_seq'::regclass);


--
-- TOC entry 3419 (class 2604 OID 16799)
-- Name: item_header item_header_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_header ALTER COLUMN item_header_id SET DEFAULT nextval('public.item_header_item_header_id_seq'::regclass);


--
-- TOC entry 3423 (class 2604 OID 16821)
-- Name: item_response_detail item_response_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_response_detail ALTER COLUMN item_response_detail_id SET DEFAULT nextval('public.item_response_detail_item_response_detail_id_seq'::regclass);


--
-- TOC entry 3421 (class 2604 OID 16810)
-- Name: mslq_item mslq_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mslq_item ALTER COLUMN mslq_item_id SET DEFAULT nextval('public.mslq_item_mslq_item_id_seq'::regclass);


--
-- TOC entry 3417 (class 2604 OID 16785)
-- Name: mslq_response mslq_response_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mslq_response ALTER COLUMN mslq_response_id SET DEFAULT nextval('public.mslq_response_mslq_response_id_seq'::regclass);


--
-- TOC entry 3409 (class 2604 OID 16646)
-- Name: output_model_prediction output_model_prediction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.output_model_prediction ALTER COLUMN output_model_prediction_id SET DEFAULT nextval('public.output_model_prediction_output_model_prediction_id_seq'::regclass);


--
-- TOC entry 3394 (class 2604 OID 16413)
-- Name: semester semester_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester ALTER COLUMN semester_id SET DEFAULT nextval('public.semester_semester_id_seq'::regclass);


--
-- TOC entry 3435 (class 2604 OID 16952)
-- Name: student_exercise_attempts student_exercise_attempt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exercise_attempts ALTER COLUMN student_exercise_attempt_id SET DEFAULT nextval('public.student_exercise_attempts_student_exercise_attempt_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 16593)
-- Name: students_tasks task_task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_tasks ALTER COLUMN task_task_id SET DEFAULT nextval('public.students_task_task_task_id_seq'::regclass);


--
-- TOC entry 3433 (class 2604 OID 16941)
-- Name: support_exercise support_exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_exercise ALTER COLUMN support_exercise_id SET DEFAULT nextval('public.support_exercise_support_exercise_id_seq'::regclass);


--
-- TOC entry 3425 (class 2604 OID 16846)
-- Name: support_topics support_topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_topics ALTER COLUMN support_topic_id SET DEFAULT nextval('public.support_topics_support_topic_id_seq'::regclass);


--
-- TOC entry 3401 (class 2604 OID 16565)
-- Name: task task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN task_id SET DEFAULT nextval('public.task_task_id_seq'::regclass);


--
-- TOC entry 3415 (class 2604 OID 16737)
-- Name: task_grades task_grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_grades ALTER COLUMN task_grade_id SET DEFAULT nextval('public.task_grades_task_grade_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 16665)
-- Name: token_blacklist_blacklistedtoken blacklisted_token_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN blacklisted_token_id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_blacklisted_token_id_seq'::regclass);


--
-- TOC entry 3412 (class 2604 OID 16672)
-- Name: token_blacklist_outstandingtoken outstanding_token_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN outstanding_token_id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_outstanding_token_id_seq'::regclass);


--
-- TOC entry 3427 (class 2604 OID 16868)
-- Name: tutoring_group tutoring_group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_group ALTER COLUMN tutoring_group_id SET DEFAULT nextval('public.tutoring_group_tutoring_group_id_seq'::regclass);


--
-- TOC entry 3431 (class 2604 OID 16900)
-- Name: tutoring_participation tutoring_participation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_participation ALTER COLUMN tutoring_participation_id SET DEFAULT nextval('public.tutoring_participation_tutoring_participation_id_seq'::regclass);


--
-- TOC entry 3429 (class 2604 OID 16884)
-- Name: tutoring_topic tutoring_topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_topic ALTER COLUMN tutoring_topic_id SET DEFAULT nextval('public.tutoring_topics_tutoring_topic_id_seq'::regclass);


--
-- TOC entry 3442 (class 2604 OID 17013)
-- Name: user_groups user_groups_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN user_groups_id SET DEFAULT nextval('public.user_groups_user_groups_id_seq'::regclass);


--
-- TOC entry 3738 (class 0 OID 16533)
-- Dependencies: 236
-- Data for Name: academic_cut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academic_cut (academic_cut_id, semester_id, start_date, end_date, status, cut_type_id) FROM stdin;
1	1	2025-01-15	2025-03-15	active	1
2	1	2025-03-16	2025-05-15	active	2
3	1	2025-05-16	2025-06-25	active	3
4	2	2026-02-01	2026-03-15	active	1
6	2	2026-05-01	2026-06-10	active	3
5	2	2026-03-16	2026-04-30	active	2
\.


--
-- TOC entry 3756 (class 0 OID 16712)
-- Dependencies: 254
-- Data for Name: academic_cut_grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academic_cut_grades (academic_cut_grade_id, student_id, academic_cut_id, delivery_time, grade, status) FROM stdin;
1	1	1	2025-02-20 14:00:00	4.0	active
2	1	2	2025-03-01 16:30:00	3.5	active
3	1	3	2025-04-10 10:15:00	4.5	active
4	2	1	2025-06-05 09:45:00	3.0	inactive
5	2	2	2025-04-25 23:50:00	2.0	active
6	2	3	2025-06-15 10:45:00	3.7	active
7	4	1	2025-02-25 10:00:00	4.5	active
8	4	2	2025-04-10 10:15:00	4.3	active
9	4	3	2025-06-08 08:30:00	4.0	active
10	6	1	2025-03-05 09:00:00	3.2	active
11	6	2	2025-04-20 15:30:00	3.5	active
12	6	3	2025-06-05 09:45:00	3.0	inactive
13	7	1	2025-02-28 12:00:00	2.5	active
14	7	2	2025-04-25 23:50:00	2.0	active
15	7	3	2025-06-12 16:20:00	2.8	active
\.


--
-- TOC entry 3788 (class 0 OID 17003)
-- Dependencies: 286
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (auth_group_id, name) FROM stdin;
1	Administrators
2	Researchers
3	Moderators
4	Viewers
5	Analysts
\.


--
-- TOC entry 3792 (class 0 OID 17022)
-- Dependencies: 290
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (auth_group_permissions_id, permission_id, group_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	2
5	5	4
\.


--
-- TOC entry 3786 (class 0 OID 16996)
-- Dependencies: 284
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (auth_permission_id, name, content_type, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can add article	4	add_article
4	Can change experiment	5	change_experiment
5	Can view session	3	view_session
\.


--
-- TOC entry 3796 (class 0 OID 24691)
-- Dependencies: 295
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (user_id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$dummy	\N	f	carlos.ramirez	Carlos	Ramírez	carlos.ramirez@email.com	f	t	2025-09-15 14:00:58.705582+00
2	pbkdf2_sha256$dummy	\N	f	maria.gomez	María	Gómez	maria.gomez@email.com	f	t	2025-09-15 14:00:58.705582+00
3	pbkdf2_sha256$dummy	\N	f	andres.perez	Andrés	Pérez	andres.perez@email.com	f	t	2025-09-15 14:00:58.705582+00
4	pbkdf2_sha256$dummy	\N	f	laura.martinez	Laura	Martínez	laura.martinez@email.com	f	t	2025-09-15 14:00:58.705582+00
5	pbkdf2_sha256$dummy	\N	f	jorge.fernandez	Jorge	Fernández	jorge.fernandez@email.com	f	t	2025-09-15 14:00:58.705582+00
6	pbkdf2_sha256$dummy	\N	f	diana.lopez	Diana	López	diana.lopez@email.com	f	t	2025-09-15 14:00:58.705582+00
7	pbkdf2_sha256$dummy	\N	f	pedro.castano	Pedro	Castaño	pedro.castano@email.com	f	t	2025-09-15 14:00:58.705582+00
\.


--
-- TOC entry 3744 (class 0 OID 16607)
-- Dependencies: 242
-- Data for Name: classification_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classification_types (type_id, name, description, category, status) FROM stdin;
1	Nota	Clasificación por notas del estudiante	Academico	active
2	Tema	Tipos de temas para apoyo	Contenido	active
3	Dificultad	Niveles de dificultad de ejercicios	Metadatos	active
\.


--
-- TOC entry 3730 (class 0 OID 16417)
-- Dependencies: 228
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, semester_id, name, acronym, description, credits) FROM stdin;
1	1	Fundamentos de programacion	PROG101	Introduccion a la programacion. Bases para entender mejor	3
2	1	Sistemas de base de datos	BD201	Diseño y administracion de bases de datos relacionales	4
3	1	Estructuras de datos	ED301	Estructuras de datos avanzadas y algoritmos	2
4	2	Programacion Movil	SE401	Programacion para dispositivos moviles con ionic	3
5	2	Inteligencia Artificial	IA501	Introduccion y diseño de modelos de inteligencia artificial	4
\.


--
-- TOC entry 3734 (class 0 OID 16503)
-- Dependencies: 232
-- Data for Name: course_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_students (course_id, student_id, course_student_id, enrollment_date, final_grade, status) FROM stdin;
1	1	1	2025-09-01 00:00:00	\N	enrolled
1	2	2	2025-09-01 00:00:00	\N	enrolled
2	4	3	2025-09-01 00:00:00	\N	enrolled
2	6	4	2025-09-01 00:00:00	\N	completed
3	1	5	2025-09-01 00:00:00	\N	enrolled
4	7	6	2025-08-01 00:00:00	\N	enrolled
5	2	7	2025-09-01 00:00:00	\N	enrolled
5	4	8	2025-09-01 00:00:00	\N	completed
\.


--
-- TOC entry 3736 (class 0 OID 16508)
-- Dependencies: 234
-- Data for Name: course_teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_teachers (course_id, teacher_id, course_teacher_id, assignment_date, status) FROM stdin;
1	7	1	2025-02-01 09:00:00	active
2	3	2	2024-08-15 10:00:00	active
3	6	3	2025-01-10 11:00:00	active
4	4	4	2025-03-20 08:30:00	active
5	5	5	2025-05-05 14:00:00	active
\.


--
-- TOC entry 3794 (class 0 OID 17051)
-- Dependencies: 292
-- Data for Name: cut_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cut_type (cut_type_id, name, percentage) FROM stdin;
1	primer corte	30.00
2	segundo corte	30.00
3	tercer corte	40.00
\.


--
-- TOC entry 3748 (class 0 OID 16630)
-- Dependencies: 246
-- Data for Name: data_test_model_prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_test_model_prediction (data_train_model_prediction_id, course_id, type_id, item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25, item26, item27, item28, item29, item30, item31, item32, item33, item34, item35, item36, c1, c2, c3, n_final) FROM stdin;
1	1	1	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	83.00	79.50	81.25	3.4
\.


--
-- TOC entry 3746 (class 0 OID 16618)
-- Dependencies: 244
-- Data for Name: data_train_model_prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_train_model_prediction (data_train_model_prediction_id, course_id, type_id, item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25, item26, item27, item28, item29, item30, item31, item32, item33, item34, item35, item36, c1, c2, c3, n_final) FROM stdin;
1	1	1	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	1.00	85.00	80.00	82.50	3.5
2	1	2	0.50	0.75	0.60	0.40	0.80	0.90	0.10	0.00	1.00	0.50	0.60	0.70	0.80	0.90	1.00	0.30	0.20	0.10	0.40	0.50	0.60	0.70	0.80	0.90	0.95	0.85	0.75	0.65	0.55	0.45	0.35	0.25	0.15	0.05	0.00	0.00	70.00	68.00	72.00	2.8
\.


--
-- TOC entry 3782 (class 0 OID 16978)
-- Dependencies: 280
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (django_admin_log_id, action_time, object_id, object_rpr, action_flag, change_message, content_type, user_id) FROM stdin;
1	2024-04-02 10:00:00	1	admin user: postgres	1	Added via admin UI	1	1
2	2024-04-02 11:15:00	42	Research Article #42	1	Imported from CSV	4	2
3	2024-04-03 09:20:00	42	Research Article #42	2	Updated title and tags	4	2
4	2024-05-10 14:05:00	exp-7	Experiment 7	1	Created experiment	5	2
5	2024-06-01 08:45:00	sess-abc	Session abc	3	Deleted expired session	3	3
\.


--
-- TOC entry 3780 (class 0 OID 16971)
-- Dependencies: 278
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (django_content_type_id, app_label, model) FROM stdin;
1	auth	user
2	auth	group
3	sessions	session
4	research	article
5	research	experiment
\.


--
-- TOC entry 3784 (class 0 OID 16987)
-- Dependencies: 282
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (django_migrations_id, app, name, action_time) FROM stdin;
1	auth	0001_initial	2023-01-10 08:15:00
2	contenttypes	0001_initial	2023-01-10 08:16:00
3	sessions	0001_initial	2023-01-10 08:17:00
4	research	0001_initial	2024-03-05 12:00:00
5	research	0002_add_experiment_field	2024-04-01 09:30:00
\.


--
-- TOC entry 3762 (class 0 OID 16796)
-- Dependencies: 260
-- Data for Name: item_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_header (item_header_id, name, description, status) FROM stdin;
1	Condiciones Algorítmicas	Ejercicios sobre if, switch y toma de decisiones	active
2	Ciclos Algorítmicos	Ejercicios sobre for, while y bucles anidados	active
3	Funciones Algorítmicas	Ejercicios sobre definición y uso de funciones	active
\.


--
-- TOC entry 3766 (class 0 OID 16818)
-- Dependencies: 264
-- Data for Name: item_response_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_response_detail (item_response_detail_id, mslq_response_id, mslq_item_id, response_date, score, status) FROM stdin;
1	1	1	2025-09-01 10:00:00	1	active
2	1	2	2025-09-01 10:05:00	2	active
3	2	3	2025-09-03 17:00:00	3	active
4	2	4	2025-09-03 17:05:00	2	active
\.


--
-- TOC entry 3764 (class 0 OID 16807)
-- Dependencies: 262
-- Data for Name: mslq_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mslq_item (mslq_item_id, name, description, category, item_number, status) FROM stdin;
1	Condición simple 1	Determinar si un número es par o impar	Condiciones	1	active
2	Condición media 2	Calcular si estudiante aprueba (>=3.0) y mostrar mensaje	Condiciones	2	active
3	Ciclo simple 1	Sumar los primeros N números	Ciclos	3	active
4	Ciclo anidado 2	Imprimir tabla de multiplicar hasta N	Ciclos	4	active
5	Función simple 1	Función que devuelve el máximo de dos valores	Funciones	5	active
\.


--
-- TOC entry 3760 (class 0 OID 16782)
-- Dependencies: 258
-- Data for Name: mslq_response; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mslq_response (mslq_response_id, course_student_id, total_score, response_date, status) FROM stdin;
1	1	7.50	2025-09-01 10:10:00	completed
2	2	4.25	2025-09-03 16:30:00	completed
\.


--
-- TOC entry 3750 (class 0 OID 16643)
-- Dependencies: 248
-- Data for Name: output_model_prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.output_model_prediction (output_model_prediction_id, course_student_id, academic_cut_id, n_final_pred, confidence_score, model_version, status) FROM stdin;
1	1	1	3.40	78.50	v1.0	active
2	2	1	2.60	65.20	v1.0	active
3	3	1	4.20	85.00	v1.1	active
4	4	1	2.90	60.50	v1.1	active
\.


--
-- TOC entry 3728 (class 0 OID 16410)
-- Dependencies: 226
-- Data for Name: semester; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semester (semester_id, semester_level) FROM stdin;
1	I
2	II
3	III
4	IV
5	V
\.


--
-- TOC entry 3778 (class 0 OID 16949)
-- Dependencies: 276
-- Data for Name: student_exercise_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_exercise_attempts (student_exercise_attempt_id, student_id, support_exercise_id, attempt_date, score, execution_time_ms, feedback, code_submitted, status) FROM stdin;
1	1	1	2025-09-02 15:30:00	3.50	\N	Tienes la idea, mejora los casos frontera	def es_par(n): return n%2==0	partial
2	2	2	2025-09-03 16:00:00	2.00	\N	Revisa la condición de igualdad	if x>=3: print("aprob")	partial
3	3	6	2025-09-04 18:20:00	4.50	\N	Excelente	for i in range(1,n+1): sum+=i	passed
4	1	6	2025-09-05 14:00:00	4.00	\N	Buena lógica, cuida los índices	sum = 0\\nfor i in range(1,N+1): sum+=i	passed
5	2	11	2025-09-06 09:30:00	3.00	\N	Funciona, documenta la función	def doble(x): return x*2	partial
6	4	9	2025-09-07 11:10:00	2.25	\N	Faltan pruebas para casos límite	for i in range(n): ...	failed
\.


--
-- TOC entry 3732 (class 0 OID 16450)
-- Dependencies: 230
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, student_code) FROM stdin;
1	9025091234
2	9025095678
4	9125094321
6	9125098765
7	9025082468
3	9025086543
5	9025091122
\.


--
-- TOC entry 3742 (class 0 OID 16590)
-- Dependencies: 240
-- Data for Name: students_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_tasks (students_task_id, students_student_id, task_task_id) FROM stdin;
1	1	1
2	2	1
3	4	3
4	6	4
5	7	5
6	1	3
7	2	7
8	4	8
23	1	9
24	2	9
25	4	9
26	6	9
27	7	9
28	1	10
29	2	10
30	4	10
31	6	10
32	7	10
33	1	11
34	2	11
35	4	11
36	6	11
37	7	11
38	1	12
39	2	12
40	4	12
41	6	12
42	7	12
43	1	13
44	2	13
45	4	13
46	6	13
47	7	13
48	1	14
49	2	14
50	4	14
51	6	14
52	7	14
\.


--
-- TOC entry 3776 (class 0 OID 16938)
-- Dependencies: 274
-- Data for Name: support_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_exercise (support_exercise_id, assignment_id, title, statement, difficulty_level, number_of_tries, status) FROM stdin;
1	1	Condición - Nivel 1	Dado un número entero, imprimir "PAR" si es par y "IMPAR" si no.	1	3	active
2	1	Condición - Nivel 2	Dado el puntaje de un estudiante (0-5) imprimir "Aprobado" si >=3.0, sino "Reprobado".	2	3	active
3	1	Condición - Nivel 3	Dado un año, determinar si es bisiesto (reglas completas).	3	3	active
4	1	Condición - Nivel 4	Dado el salario y horas trabajadas, aplicar descuentos según bandas y mostrar salario neto.	4	3	active
5	1	Condición - Nivel 5	Resolver un problema con múltiples condiciones anidadas y excepciones de entrada.	5	3	active
6	2	Ciclo - Nivel 1	Sumar los primeros N enteros positivos dados.	1	3	active
7	2	Ciclo - Nivel 2	Calcular factorial de N mediante un bucle.	2	3	active
8	2	Ciclo - Nivel 3	Dado un arreglo, encontrar el máximo y mínimo usando un bucle.	3	3	active
9	2	Ciclo - Nivel 4	Imprimir la matriz triangular superior usando ciclos anidados.	4	3	active
10	2	Ciclo - Nivel 5	Resolver el problema de las torres de Hanoi iterativamente (o simular con pila).	5	3	active
11	3	Funciones - Nivel 1	Escribir una función que devuelva el doble de un número.	1	3	active
12	3	Funciones - Nivel 2	Función que calcule la suma de elementos de una lista.	2	3	active
13	3	Funciones - Nivel 3	Función que reciba otra función (callback) y la aplique a cada elemento.	3	3	active
14	3	Funciones - Nivel 4	Implementar memoización para una función recursiva (fibonacci).	4	3	active
15	3	Funciones - Nivel 5	Diseñar una API de funciones que validen y transformen datos de entrada complejos.	5	3	active
\.


--
-- TOC entry 3768 (class 0 OID 16843)
-- Dependencies: 266
-- Data for Name: support_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_topics (support_topic_id, academic_cut_id, topic, description, status) FROM stdin;
1	1	Condiciones	Condiciones básicas y anidadas	active
2	1	Ciclos	For, while y bucles anidados	active
3	1	Funciones	Definición, parámetros y retorno	active
\.


--
-- TOC entry 3740 (class 0 OID 16562)
-- Dependencies: 238
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (task_id, course_teacher_id, academic_cut_id, name, description, start_date, end_date, status, percentage) FROM stdin;
16	3	2	Problemas Avanzados	Ejercicios complejos de estructuras de datos	2025-09-30 00:00:00	2025-10-07 23:59:59	open	10.00
17	4	2	Presentación App	Demo y explicación de la aplicación móvil	2025-10-03 10:00:00	2025-10-03 12:00:00	pending	10.00
21	3	2	Algoritmos - Grafos	Problemas de teoría de grafos y recorridos	2025-10-05 00:00:00	2025-10-12 23:59:59	open	10.00
22	4	2	App - Base de Datos	Integración con base de datos local	2025-10-01 00:00:00	2025-10-08 23:59:59	open	10.00
26	3	2	Proyecto Algoritmos	Implementación de algoritmos complejos	2025-10-10 00:00:00	2025-10-25 23:59:59	open	10.00
27	4	2	App Final	Aplicación móvil completa con todas las features	2025-10-12 00:00:00	2025-10-26 23:59:59	open	15.00
28	5	3	Proyecto Final IA	Sistema completo de inteligencia artificial	2025-10-28 00:00:00	2025-11-15 23:59:59	pending	25.00
6	5	3	Entrega IA - Modelo	Entrenamiento y reporte del modelo	2025-10-01 00:00:00	2025-10-20 23:59:59	open	25.00
13	5	3	Proyecto IA - Validación	Pruebas y validación del modelo de machine learning	2025-10-15 00:00:00	2025-10-30 23:59:59	pending	15.00
18	5	3	Paper IA - Análisis	Análisis de investigación en inteligencia artificial	2025-10-25 00:00:00	2025-11-05 23:59:59	open	20.00
10	2	1	Proyecto BD - Implementación	Creación de tablas y inserción de datos	2025-09-20 00:00:00	2025-10-10 23:59:59	open	10.00
15	2	1	Consulta BD - Optimización	Optimización de queries y índices	2025-09-28 00:00:00	2025-10-05 23:59:59	open	5.00
19	1	1	Reto Programación	Competencia de programación con problemas desafiantes	2025-09-22 16:00:00	2025-09-22 18:00:00	pending	5.00
20	2	1	BD - Normalización	Ejercicios de normalización de bases de datos	2025-10-02 00:00:00	2025-10-09 23:59:59	open	5.00
24	1	1	Examen Final - Programación	Evaluación integral de programación	2025-10-10 08:00:00	2025-10-10 11:00:00	pending	10.00
25	2	1	Proyecto Final BD	Sistema completo de base de datos	2025-10-08 00:00:00	2025-10-20 23:59:59	open	20.00
4	3	2	Tarea Estructuras	Problemas de listas y árboles	2025-09-12 00:00:00	2025-09-26 23:59:59	open	5.00
5	4	2	Laboratorio Móvil	Desarrollo de app básica con Ionic	2025-09-15 10:00:00	2025-09-29 23:59:59	pending	10.00
11	3	2	Examen Parcial - Algoritmos	Evaluación teórica y práctica de algoritmos	2025-09-25 08:00:00	2025-09-25 10:00:00	pending	10.00
12	4	2	App Móvil - Avanzada	Desarrollo con funcionalidades avanzadas y API	2025-09-22 00:00:00	2025-10-05 23:59:59	open	10.00
23	5	3	IA - Deployment	Despliegue del modelo en producción	2025-10-20 00:00:00	2025-11-01 23:59:59	pending	15.00
1	1	1	Entrega 1 - Fundamentos	Trabajo práctico 1 sobre variables y estructuras	2025-09-01 08:00:00	2025-09-15 23:59:59	open	5.00
2	1	1	Quiz 1 - Fundamentos	Evaluación corta de conceptos básicos	2025-09-05 09:00:00	2025-09-05 09:30:00	closed	5.00
3	2	1	Proyecto BD - Diseño	Entrega del diagrama ER y scripts	2025-09-10 00:00:00	2025-10-01 23:59:59	completed	10.00
7	2	1	Exposición BD	Presentación grupal del proyecto	2025-10-05 08:00:00	2025-10-05 10:00:00	pending	5.00
8	1	1	Revisión Entrega 1	Feedback y corrección	2025-09-20 09:00:00	2025-09-20 11:00:00	completed	5.00
9	1	1	Quiz 2 - Programación	Evaluación de estructuras de control y funciones	2025-09-12 09:00:00	2025-09-12 09:45:00	closed	5.00
14	1	1	Taller Práctico	Sesión práctica de resolución de problemas	2025-09-18 14:00:00	2025-09-18 16:00:00	completed	10.00
\.


--
-- TOC entry 3758 (class 0 OID 16734)
-- Dependencies: 256
-- Data for Name: task_grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_grades (task_grade_id, students_task_id, delivery_time, results, grade, status) FROM stdin;
1	1	2025-09-10 14:30:00	Entrega completa y funcional	4.0	completed
2	2	2025-09-10 15:05:00	Falta un archivo, corregido luego	3.5	completed
3	3	2025-09-12 10:15:00	Código y documentación entregados	4.5	completed
4	4	2025-09-26 23:50:00	Entrega tardía con penalización	2.0	closed
5	5	2025-09-20 09:00:00	Buen trabajo práctico	3.8	completed
6	6	2025-09-11 11:45:00	Revisión y mejoras aplicadas	4.2	completed
7	7	2025-10-05 09:30:00	Presentación realizada	3.0	completed
8	8	2025-09-20 10:00:00	Resubida con correcciones	4.0	completed
23	23	2025-09-12 09:40:00	Excelente desempeño	4.8	completed
24	24	2025-09-12 09:35:00	Buen trabajo	4.2	completed
25	25	2025-09-12 09:42:00	Algunos errores menores	3.8	completed
26	26	2025-09-12 09:30:00	Perfecto	5.0	completed
27	27	2025-09-12 09:38:00	Muy bien	4.5	completed
28	28	2025-10-08 14:20:00	Implementación completa	4.7	completed
29	29	2025-10-09 16:45:00	Buen diseño de tablas	4.3	completed
30	30	2025-10-05 11:30:00	Optimización excelente	4.9	completed
31	31	2025-10-10 10:15:00	Faltan algunas relaciones	3.5	completed
32	32	2025-10-07 13:50:00	Estructura sólida	4.6	completed
33	33	2025-09-25 09:50:00	Dominio teórico excelente	4.8	completed
34	34	2025-09-25 09:30:00	Buen desempeño práctico	4.4	completed
35	35	2025-09-25 10:00:00	Algoritmos eficientes	4.7	completed
36	36	2025-09-25 09:45:00	Problemas resueltos correctamente	4.9	completed
37	37	2025-09-25 09:35:00	Solución óptima	4.6	completed
\.


--
-- TOC entry 3731 (class 0 OID 16440)
-- Dependencies: 229
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (teacher_id, speciality) FROM stdin;
3	Matemáticas
4	Lengua y Literatura
5	Historia
6	Ciencias Naturales
7	Programación
\.


--
-- TOC entry 3752 (class 0 OID 16662)
-- Dependencies: 250
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_blacklistedtoken (blacklisted_token_id, blacklisted_at, token_id) FROM stdin;
1	2025-09-01 09:15:00	1234567890
2	2025-09-10 14:00:00	9876543210
\.


--
-- TOC entry 3754 (class 0 OID 16669)
-- Dependencies: 252
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_outstandingtoken (outstanding_token_id, token, created_at) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.exemplo	2025-08-20 08:00:00
2	eyJzdWIiOiIxMjM0NTY3ODkwIn0.anotoken	2025-09-05 12:30:00
\.


--
-- TOC entry 3770 (class 0 OID 16865)
-- Dependencies: 268
-- Data for Name: tutoring_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutoring_group (tutoring_group_id, course_teacher_id, tutoring_topic_id, tutoring_date, tutoring_hour, tutoring_site, tutoring_message, date, status) FROM stdin;
1	1	1	2025-09-20	18:00:00	Aula 3B / Zoom	Tutoría para estudiantes con nota <= 4.0 en condicionales	2025-09-14	scheduled
2	1	2	2025-09-22	17:00:00	Laboratorio 1	Tutoría sobre ciclos y ejercicios prácticos	2025-09-14	scheduled
\.


--
-- TOC entry 3774 (class 0 OID 16897)
-- Dependencies: 272
-- Data for Name: tutoring_participation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutoring_participation (tutoring_participation_id, tutoring_group_id, course_student_id, enrollment_date, participation_status) FROM stdin;
1	1	1	2025-09-14 11:00:00	active
2	1	2	2025-09-14 11:05:00	active
3	2	3	2025-09-14 12:00:00	active
\.


--
-- TOC entry 3772 (class 0 OID 16881)
-- Dependencies: 270
-- Data for Name: tutoring_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutoring_topic (tutoring_topic_id, topic, description, status) FROM stdin;
1	Refuerzo Condiciones	Tutoría centrada en estructuras condicionales y resolución de casos	active
2	Refuerzo Ciclos	Tutoría sobre bucles y control de iteraciones	active
3	Refuerzo Funciones	Tutoría sobre diseño y pruebas de funciones	active
\.


--
-- TOC entry 3790 (class 0 OID 17010)
-- Dependencies: 288
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_groups (user_groups_id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 235
-- Name: academic_cut_academic_cut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academic_cut_academic_cut_id_seq', 1, false);


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 253
-- Name: academic_cut_grades_academic_cut_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academic_cut_grades_academic_cut_grade_id_seq', 1, false);


--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 285
-- Name: auth_group_auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_auth_group_id_seq', 1, false);


--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 289
-- Name: auth_group_permissions_auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 283
-- Name: auth_permission_auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_auth_permission_id_seq', 1, false);


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 294
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 241
-- Name: classification_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classification_types_type_id_seq', 1, false);


--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 227
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 1, false);


--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 231
-- Name: course_students_course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_students_course_course_id_seq', 1, false);


--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 233
-- Name: course_teachers_course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_teachers_course_course_id_seq', 1, false);


--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 291
-- Name: cut_type_cut_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cut_type_cut_type_id_seq', 3, true);


--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 245
-- Name: data_test_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_test_model_prediction_data_train_model_prediction_id_seq', 1, false);


--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 243
-- Name: data_train_model_prediction_data_train_model_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_train_model_prediction_data_train_model_prediction_id_seq', 1, false);


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 279
-- Name: django_admin_log_django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_django_admin_log_id_seq', 1, false);


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 277
-- Name: django_content_type_django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_django_content_type_id_seq', 1, false);


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 281
-- Name: django_migrations_django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_django_migrations_id_seq', 1, false);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 259
-- Name: item_header_item_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_header_item_header_id_seq', 1, false);


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 263
-- Name: item_response_detail_item_response_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_response_detail_item_response_detail_id_seq', 1, false);


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 261
-- Name: mslq_item_mslq_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mslq_item_mslq_item_id_seq', 1, false);


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 257
-- Name: mslq_response_mslq_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mslq_response_mslq_response_id_seq', 1, false);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 247
-- Name: output_model_prediction_output_model_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.output_model_prediction_output_model_prediction_id_seq', 1, false);


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 225
-- Name: semester_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semester_semester_id_seq', 1, false);


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 275
-- Name: student_exercise_attempts_student_exercise_attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_exercise_attempts_student_exercise_attempt_id_seq', 1, false);


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 239
-- Name: students_task_task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_task_task_task_id_seq', 1, false);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 273
-- Name: support_exercise_support_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_exercise_support_exercise_id_seq', 1, false);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 265
-- Name: support_topics_support_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_topics_support_topic_id_seq', 1, false);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 255
-- Name: task_grades_task_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_grades_task_grade_id_seq', 1, false);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 237
-- Name: task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_task_id_seq', 1, false);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 249
-- Name: token_blacklist_blacklistedtoken_blacklisted_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_blacklisted_token_id_seq', 1, false);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 251
-- Name: token_blacklist_outstandingtoken_outstanding_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_outstanding_token_id_seq', 1, false);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 267
-- Name: tutoring_group_tutoring_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tutoring_group_tutoring_group_id_seq', 1, false);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 271
-- Name: tutoring_participation_tutoring_participation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tutoring_participation_tutoring_participation_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 269
-- Name: tutoring_topics_tutoring_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tutoring_topics_tutoring_topic_id_seq', 1, false);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 287
-- Name: user_groups_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_user_groups_id_seq', 1, false);


--
-- TOC entry 3500 (class 2606 OID 16722)
-- Name: academic_cut_grades academic_cut_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut_grades
    ADD CONSTRAINT academic_cut_grades_pkey PRIMARY KEY (academic_cut_grade_id);


--
-- TOC entry 3482 (class 2606 OID 16540)
-- Name: academic_cut academic_cut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut
    ADD CONSTRAINT academic_cut_pkey PRIMARY KEY (academic_cut_id);


--
-- TOC entry 3536 (class 2606 OID 17027)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (auth_group_permissions_id);


--
-- TOC entry 3532 (class 2606 OID 17008)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (auth_group_id);


--
-- TOC entry 3530 (class 2606 OID 17001)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (auth_permission_id);


--
-- TOC entry 3540 (class 2606 OID 24707)
-- Name: auth_user auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_email_key UNIQUE (email);


--
-- TOC entry 3542 (class 2606 OID 24703)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3544 (class 2606 OID 24705)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3488 (class 2606 OID 16616)
-- Name: classification_types classification_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classification_types
    ADD CONSTRAINT classification_types_pkey PRIMARY KEY (type_id);


--
-- TOC entry 3470 (class 2606 OID 16425)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 3478 (class 2606 OID 16558)
-- Name: course_students course_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_pkey PRIMARY KEY (course_student_id);


--
-- TOC entry 3480 (class 2606 OID 16560)
-- Name: course_teachers course_teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_teachers
    ADD CONSTRAINT course_teachers_pkey PRIMARY KEY (course_teacher_id);


--
-- TOC entry 3451 (class 2606 OID 24589)
-- Name: course_students course_teachers_status_chk; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.course_students
    ADD CONSTRAINT course_teachers_status_chk CHECK (((status)::text = ANY (ARRAY[('enrolled'::character varying)::text, ('dropped'::character varying)::text, ('completed'::character varying)::text, ('failed'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3538 (class 2606 OID 17056)
-- Name: cut_type cut_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cut_type
    ADD CONSTRAINT cut_type_pkey PRIMARY KEY (cut_type_id);


--
-- TOC entry 3492 (class 2606 OID 16635)
-- Name: data_test_model_prediction data_test_model_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_test_model_prediction
    ADD CONSTRAINT data_test_model_prediction_pkey PRIMARY KEY (data_train_model_prediction_id);


--
-- TOC entry 3490 (class 2606 OID 16623)
-- Name: data_train_model_prediction data_train_model_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_train_model_prediction
    ADD CONSTRAINT data_train_model_prediction_pkey PRIMARY KEY (data_train_model_prediction_id);


--
-- TOC entry 3526 (class 2606 OID 16985)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (django_admin_log_id);


--
-- TOC entry 3524 (class 2606 OID 16976)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (django_content_type_id);


--
-- TOC entry 3528 (class 2606 OID 16994)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (django_migrations_id);


--
-- TOC entry 3506 (class 2606 OID 16805)
-- Name: item_header item_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_header
    ADD CONSTRAINT item_header_pkey PRIMARY KEY (item_header_id);


--
-- TOC entry 3510 (class 2606 OID 16825)
-- Name: item_response_detail item_response_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_response_detail
    ADD CONSTRAINT item_response_detail_pkey PRIMARY KEY (item_response_detail_id);


--
-- TOC entry 3508 (class 2606 OID 16816)
-- Name: mslq_item mslq_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mslq_item
    ADD CONSTRAINT mslq_item_pkey PRIMARY KEY (mslq_item_id);


--
-- TOC entry 3504 (class 2606 OID 16789)
-- Name: mslq_response mslq_response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mslq_response
    ADD CONSTRAINT mslq_response_pkey PRIMARY KEY (mslq_response_id);


--
-- TOC entry 3494 (class 2606 OID 16650)
-- Name: output_model_prediction output_model_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.output_model_prediction
    ADD CONSTRAINT output_model_prediction_pkey PRIMARY KEY (output_model_prediction_id);


--
-- TOC entry 3468 (class 2606 OID 16415)
-- Name: semester semester_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester
    ADD CONSTRAINT semester_pkey PRIMARY KEY (semester_id);


--
-- TOC entry 3522 (class 2606 OID 16958)
-- Name: student_exercise_attempts student_exercise_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exercise_attempts
    ADD CONSTRAINT student_exercise_attempts_pkey PRIMARY KEY (student_exercise_attempt_id);


--
-- TOC entry 3474 (class 2606 OID 16454)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 3476 (class 2606 OID 16456)
-- Name: students students_student_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_student_code_key UNIQUE (student_code);


--
-- TOC entry 3486 (class 2606 OID 16595)
-- Name: students_tasks students_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_tasks
    ADD CONSTRAINT students_task_pkey PRIMARY KEY (students_task_id);


--
-- TOC entry 3520 (class 2606 OID 16947)
-- Name: support_exercise support_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_exercise
    ADD CONSTRAINT support_exercise_pkey PRIMARY KEY (support_exercise_id);


--
-- TOC entry 3512 (class 2606 OID 16852)
-- Name: support_topics support_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_topics
    ADD CONSTRAINT support_topics_pkey PRIMARY KEY (support_topic_id);


--
-- TOC entry 3502 (class 2606 OID 16744)
-- Name: task_grades task_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_grades
    ADD CONSTRAINT task_grades_pkey PRIMARY KEY (task_grade_id);


--
-- TOC entry 3484 (class 2606 OID 16571)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);


--
-- TOC entry 3472 (class 2606 OID 16444)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 3496 (class 2606 OID 16667)
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (blacklisted_token_id);


--
-- TOC entry 3498 (class 2606 OID 16676)
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (outstanding_token_id);


--
-- TOC entry 3514 (class 2606 OID 16874)
-- Name: tutoring_group tutoring_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_group
    ADD CONSTRAINT tutoring_group_pkey PRIMARY KEY (tutoring_group_id);


--
-- TOC entry 3464 (class 2606 OID 24662)
-- Name: tutoring_group tutoring_group_status_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.tutoring_group
    ADD CONSTRAINT tutoring_group_status_check CHECK (((status)::text = ANY (ARRAY[('scheduled'::character varying)::text, ('in_progress'::character varying)::text, ('completed'::character varying)::text, ('cancelled'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3518 (class 2606 OID 16904)
-- Name: tutoring_participation tutoring_participation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_participation
    ADD CONSTRAINT tutoring_participation_pkey PRIMARY KEY (tutoring_participation_id);


--
-- TOC entry 3466 (class 2606 OID 24663)
-- Name: tutoring_participation tutoring_participation_status_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.tutoring_participation
    ADD CONSTRAINT tutoring_participation_status_check CHECK (((participation_status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text, ('completed'::character varying)::text, ('dropped'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3516 (class 2606 OID 16890)
-- Name: tutoring_topic tutoring_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_topic
    ADD CONSTRAINT tutoring_topics_pkey PRIMARY KEY (tutoring_topic_id);


--
-- TOC entry 3534 (class 2606 OID 17015)
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (user_groups_id);


--
-- TOC entry 3564 (class 2606 OID 16728)
-- Name: academic_cut_grades academic_cut_grades_academic_cut_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut_grades
    ADD CONSTRAINT academic_cut_grades_academic_cut_id_fkey FOREIGN KEY (academic_cut_id) REFERENCES public.academic_cut(academic_cut_id) ON DELETE CASCADE;


--
-- TOC entry 3565 (class 2606 OID 16723)
-- Name: academic_cut_grades academic_cut_grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut_grades
    ADD CONSTRAINT academic_cut_grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 16541)
-- Name: academic_cut academic_cut_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut
    ADD CONSTRAINT academic_cut_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semester(semester_id);


--
-- TOC entry 3580 (class 2606 OID 17033)
-- Name: auth_group_permissions auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(auth_group_id);


--
-- TOC entry 3581 (class 2606 OID 17028)
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(auth_permission_id);


--
-- TOC entry 3545 (class 2606 OID 16426)
-- Name: course course_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semester(semester_id);


--
-- TOC entry 3548 (class 2606 OID 16512)
-- Name: course_students course_students_course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) NOT VALID;


--
-- TOC entry 3549 (class 2606 OID 16517)
-- Name: course_students course_students_students_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_students
    ADD CONSTRAINT course_students_students_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;


--
-- TOC entry 3550 (class 2606 OID 16522)
-- Name: course_teachers course_teachers_course_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_teachers
    ADD CONSTRAINT course_teachers_course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) NOT VALID;


--
-- TOC entry 3551 (class 2606 OID 16527)
-- Name: course_teachers course_teachers_teachers_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_teachers
    ADD CONSTRAINT course_teachers_teachers_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id) NOT VALID;


--
-- TOC entry 3560 (class 2606 OID 16636)
-- Name: data_test_model_prediction data_test_model_prediction_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_test_model_prediction
    ADD CONSTRAINT data_test_model_prediction_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3558 (class 2606 OID 16624)
-- Name: data_train_model_prediction data_train_model_prediction_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_train_model_prediction
    ADD CONSTRAINT data_train_model_prediction_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3577 (class 2606 OID 24725)
-- Name: django_admin_log fk_admin_log_user_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT fk_admin_log_user_groups FOREIGN KEY (user_id) REFERENCES public.auth_user(user_id);


--
-- TOC entry 3553 (class 2606 OID 17057)
-- Name: academic_cut fk_cut_type_academic_cut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_cut
    ADD CONSTRAINT fk_cut_type_academic_cut FOREIGN KEY (cut_type_id) REFERENCES public.cut_type(cut_type_id);


--
-- TOC entry 3571 (class 2606 OID 16891)
-- Name: tutoring_group fk_tutoring_group_tutoring_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_group
    ADD CONSTRAINT fk_tutoring_group_tutoring_topic_id FOREIGN KEY (tutoring_topic_id) REFERENCES public.tutoring_topic(tutoring_topic_id) NOT VALID;


--
-- TOC entry 3559 (class 2606 OID 17040)
-- Name: data_train_model_prediction fk_type_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_train_model_prediction
    ADD CONSTRAINT fk_type_data FOREIGN KEY (type_id) REFERENCES public.classification_types(type_id) NOT VALID;


--
-- TOC entry 3561 (class 2606 OID 17045)
-- Name: data_test_model_prediction fk_type_test; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_test_model_prediction
    ADD CONSTRAINT fk_type_test FOREIGN KEY (type_id) REFERENCES public.classification_types(type_id) NOT VALID;


--
-- TOC entry 3578 (class 2606 OID 24720)
-- Name: user_groups fk_user_user_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT fk_user_user_groups FOREIGN KEY (user_id) REFERENCES public.auth_user(user_id);


--
-- TOC entry 3568 (class 2606 OID 16831)
-- Name: item_response_detail item_response_detail_mslq_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_response_detail
    ADD CONSTRAINT item_response_detail_mslq_item_id_fkey FOREIGN KEY (mslq_item_id) REFERENCES public.mslq_item(mslq_item_id);


--
-- TOC entry 3569 (class 2606 OID 16826)
-- Name: item_response_detail item_response_detail_mslq_response_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_response_detail
    ADD CONSTRAINT item_response_detail_mslq_response_id_fkey FOREIGN KEY (mslq_response_id) REFERENCES public.mslq_response(mslq_response_id);


--
-- TOC entry 3567 (class 2606 OID 16790)
-- Name: mslq_response mslq_response_course_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mslq_response
    ADD CONSTRAINT mslq_response_course_student_id_fkey FOREIGN KEY (course_student_id) REFERENCES public.course_students(course_student_id) ON DELETE CASCADE;


--
-- TOC entry 3562 (class 2606 OID 16656)
-- Name: output_model_prediction output_model_prediction_academic_cut_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.output_model_prediction
    ADD CONSTRAINT output_model_prediction_academic_cut_id_fkey FOREIGN KEY (academic_cut_id) REFERENCES public.academic_cut(academic_cut_id);


--
-- TOC entry 3563 (class 2606 OID 16651)
-- Name: output_model_prediction output_model_prediction_course_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.output_model_prediction
    ADD CONSTRAINT output_model_prediction_course_student_id_fkey FOREIGN KEY (course_student_id) REFERENCES public.course_students(course_student_id);


--
-- TOC entry 3575 (class 2606 OID 16959)
-- Name: student_exercise_attempts student_exercise_attempts_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exercise_attempts
    ADD CONSTRAINT student_exercise_attempts_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- TOC entry 3576 (class 2606 OID 16964)
-- Name: student_exercise_attempts student_exercise_attempts_support_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exercise_attempts
    ADD CONSTRAINT student_exercise_attempts_support_exercise_id_fkey FOREIGN KEY (support_exercise_id) REFERENCES public.support_exercise(support_exercise_id);


--
-- TOC entry 3556 (class 2606 OID 16596)
-- Name: students_tasks students_task_students_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_tasks
    ADD CONSTRAINT students_task_students_student_id_fkey FOREIGN KEY (students_student_id) REFERENCES public.students(student_id) NOT VALID;


--
-- TOC entry 3557 (class 2606 OID 16601)
-- Name: students_tasks students_task_task_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_tasks
    ADD CONSTRAINT students_task_task_task_id_fkey FOREIGN KEY (task_task_id) REFERENCES public.task(task_id) NOT VALID;


--
-- TOC entry 3547 (class 2606 OID 24715)
-- Name: students students_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_user_id_fkey FOREIGN KEY (student_id) REFERENCES public.auth_user(user_id);


--
-- TOC entry 3570 (class 2606 OID 16853)
-- Name: support_topics support_topics_academic_cut_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_topics
    ADD CONSTRAINT support_topics_academic_cut_id_fkey FOREIGN KEY (academic_cut_id) REFERENCES public.academic_cut(academic_cut_id);


--
-- TOC entry 3554 (class 2606 OID 16577)
-- Name: task task_academic_cut_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_academic_cut_id_fkey FOREIGN KEY (academic_cut_id) REFERENCES public.academic_cut(academic_cut_id);


--
-- TOC entry 3555 (class 2606 OID 16572)
-- Name: task task_course_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_course_teacher_id_fkey FOREIGN KEY (course_teacher_id) REFERENCES public.course_teachers(course_teacher_id);


--
-- TOC entry 3566 (class 2606 OID 16745)
-- Name: task_grades task_grades_students_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_grades
    ADD CONSTRAINT task_grades_students_task_id_fkey FOREIGN KEY (students_task_id) REFERENCES public.students_tasks(students_task_id) ON DELETE CASCADE;


--
-- TOC entry 3546 (class 2606 OID 24710)
-- Name: teachers teachers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_user_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.auth_user(user_id);


--
-- TOC entry 3572 (class 2606 OID 16875)
-- Name: tutoring_group tutoring_group_course_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_group
    ADD CONSTRAINT tutoring_group_course_teacher_id_fkey FOREIGN KEY (course_teacher_id) REFERENCES public.course_teachers(course_teacher_id);


--
-- TOC entry 3573 (class 2606 OID 16910)
-- Name: tutoring_participation tutoring_participation_course_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_participation
    ADD CONSTRAINT tutoring_participation_course_student_id_fkey FOREIGN KEY (course_student_id) REFERENCES public.course_students(course_student_id);


--
-- TOC entry 3574 (class 2606 OID 16905)
-- Name: tutoring_participation tutoring_participation_tutoring_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutoring_participation
    ADD CONSTRAINT tutoring_participation_tutoring_group_id_fkey FOREIGN KEY (tutoring_group_id) REFERENCES public.tutoring_group(tutoring_group_id);


--
-- TOC entry 3579 (class 2606 OID 17016)
-- Name: user_groups user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(auth_group_id);


-- Completed on 2025-09-15 23:32:12 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict OvV03awIfcW7uuXsyK1rov8y1mSQ3y0ZE8W7LDhbc7KnTghGO3CztvUsIdRUxws

