--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-21 21:56:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 57356)
-- Name: customers; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    customer_type_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_email character varying(50) NOT NULL,
    customer_phone character varying(30) NOT NULL
);


ALTER TABLE public.customers OWNER TO gb_user;

--
-- TOC entry 204 (class 1259 OID 57354)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO gb_user;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 204
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 225 (class 1259 OID 57453)
-- Name: customers_types; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.customers_types (
    id integer NOT NULL,
    customer_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.customers_types OWNER TO gb_user;

--
-- TOC entry 224 (class 1259 OID 57451)
-- Name: customers_types_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.customers_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_types_id_seq OWNER TO gb_user;

--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 224
-- Name: customers_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.customers_types_id_seq OWNED BY public.customers_types.id;


--
-- TOC entry 209 (class 1259 OID 57376)
-- Name: discounts; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    discount_name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    discount_amount double precision NOT NULL,
    discount_unit_id integer NOT NULL
);


ALTER TABLE public.discounts OWNER TO gb_user;

--
-- TOC entry 208 (class 1259 OID 57374)
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO gb_user;

--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 208
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;


--
-- TOC entry 237 (class 1259 OID 57514)
-- Name: discounts_units; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.discounts_units (
    id integer NOT NULL,
    discount_unit character varying(50) NOT NULL
);


ALTER TABLE public.discounts_units OWNER TO gb_user;

--
-- TOC entry 236 (class 1259 OID 57512)
-- Name: discounts_units_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.discounts_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_units_id_seq OWNER TO gb_user;

--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 236
-- Name: discounts_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.discounts_units_id_seq OWNED BY public.discounts_units.id;


--
-- TOC entry 219 (class 1259 OID 57424)
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    point_id integer NOT NULL,
    text text NOT NULL,
    sent_at timestamp without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- TOC entry 218 (class 1259 OID 57422)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 218
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 213 (class 1259 OID 57396)
-- Name: orders; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    point_id integer NOT NULL,
    service_id integer NOT NULL,
    amount_total double precision NOT NULL,
    created_at timestamp without time zone NOT NULL,
    order_status_id integer NOT NULL,
    order_status_changed_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO gb_user;

--
-- TOC entry 212 (class 1259 OID 57394)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO gb_user;

--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 215 (class 1259 OID 57404)
-- Name: orders_products; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.orders_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_added_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders_products OWNER TO gb_user;

--
-- TOC entry 214 (class 1259 OID 57402)
-- Name: orders_products_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.orders_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_products_id_seq OWNER TO gb_user;

--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 214
-- Name: orders_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;


--
-- TOC entry 239 (class 1259 OID 57524)
-- Name: orders_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.orders_statuses (
    id integer NOT NULL,
    order_status character varying(20) NOT NULL
);


ALTER TABLE public.orders_statuses OWNER TO gb_user;

--
-- TOC entry 238 (class 1259 OID 57522)
-- Name: orders_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.orders_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_statuses_id_seq OWNER TO gb_user;

--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 238
-- Name: orders_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.orders_statuses_id_seq OWNED BY public.orders_statuses.id;


--
-- TOC entry 203 (class 1259 OID 57348)
-- Name: points; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.points (
    id integer NOT NULL,
    point_type_id integer NOT NULL,
    point_city character varying(50) NOT NULL,
    point_name character varying(100) NOT NULL,
    point_address character varying(250) NOT NULL,
    staff_id integer NOT NULL
);


ALTER TABLE public.points OWNER TO gb_user;

--
-- TOC entry 202 (class 1259 OID 57346)
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_id_seq OWNER TO gb_user;

--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 202
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;


--
-- TOC entry 221 (class 1259 OID 57435)
-- Name: points_products; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.points_products (
    id integer NOT NULL,
    point_id integer NOT NULL,
    product_id integer NOT NULL,
    is_active boolean NOT NULL,
    product_amount double precision NOT NULL
);


ALTER TABLE public.points_products OWNER TO gb_user;

--
-- TOC entry 220 (class 1259 OID 57433)
-- Name: points_products_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.points_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_products_id_seq OWNER TO gb_user;

--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 220
-- Name: points_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.points_products_id_seq OWNED BY public.points_products.id;


--
-- TOC entry 223 (class 1259 OID 57443)
-- Name: points_types; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.points_types (
    id integer NOT NULL,
    point_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.points_types OWNER TO gb_user;

--
-- TOC entry 222 (class 1259 OID 57441)
-- Name: points_types_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.points_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_types_id_seq OWNER TO gb_user;

--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 222
-- Name: points_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.points_types_id_seq OWNED BY public.points_types.id;


--
-- TOC entry 207 (class 1259 OID 57366)
-- Name: products; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_kind_id integer NOT NULL,
    product_type_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    product_unit_id integer NOT NULL,
    product_price double precision NOT NULL,
    discount_id integer NOT NULL,
    description character varying(250)
);


ALTER TABLE public.products OWNER TO gb_user;

--
-- TOC entry 229 (class 1259 OID 57473)
-- Name: products_categories; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products_categories (
    id integer NOT NULL,
    product_category character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.products_categories OWNER TO gb_user;

--
-- TOC entry 228 (class 1259 OID 57471)
-- Name: products_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_categories_id_seq OWNER TO gb_user;

--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 228
-- Name: products_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_categories_id_seq OWNED BY public.products_categories.id;


--
-- TOC entry 206 (class 1259 OID 57364)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO gb_user;

--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 231 (class 1259 OID 57483)
-- Name: products_kinds; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products_kinds (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_kind character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.products_kinds OWNER TO gb_user;

--
-- TOC entry 230 (class 1259 OID 57481)
-- Name: products_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_kinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_kinds_id_seq OWNER TO gb_user;

--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_kinds_id_seq OWNED BY public.products_kinds.id;


--
-- TOC entry 233 (class 1259 OID 57494)
-- Name: products_types; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products_types (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_kind_id integer NOT NULL,
    product_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.products_types OWNER TO gb_user;

--
-- TOC entry 232 (class 1259 OID 57492)
-- Name: products_types_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_types_id_seq OWNER TO gb_user;

--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 232
-- Name: products_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_types_id_seq OWNED BY public.products_types.id;


--
-- TOC entry 235 (class 1259 OID 57504)
-- Name: products_units; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products_units (
    id integer NOT NULL,
    product_unit character varying(50) NOT NULL
);


ALTER TABLE public.products_units OWNER TO gb_user;

--
-- TOC entry 234 (class 1259 OID 57502)
-- Name: products_units_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_units_id_seq OWNER TO gb_user;

--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 234
-- Name: products_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_units_id_seq OWNED BY public.products_units.id;


--
-- TOC entry 211 (class 1259 OID 57386)
-- Name: services; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.services (
    id integer NOT NULL,
    service_type_id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    service_price double precision NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.services OWNER TO gb_user;

--
-- TOC entry 210 (class 1259 OID 57384)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO gb_user;

--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 210
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 227 (class 1259 OID 57463)
-- Name: services_types; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.services_types (
    id integer NOT NULL,
    service_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.services_types OWNER TO gb_user;

--
-- TOC entry 226 (class 1259 OID 57461)
-- Name: services_types_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.services_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_types_id_seq OWNER TO gb_user;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 226
-- Name: services_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.services_types_id_seq OWNED BY public.services_types.id;


--
-- TOC entry 217 (class 1259 OID 57412)
-- Name: staff; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    staff_name character varying(100) NOT NULL,
    staff_code character varying(10) NOT NULL,
    staff_email character varying(50) NOT NULL,
    staff_phone character varying(30) NOT NULL
);


ALTER TABLE public.staff OWNER TO gb_user;

--
-- TOC entry 216 (class 1259 OID 57410)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO gb_user;

--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 216
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- TOC entry 2944 (class 2604 OID 57359)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 57456)
-- Name: customers_types id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers_types ALTER COLUMN id SET DEFAULT nextval('public.customers_types_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 57379)
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- TOC entry 2960 (class 2604 OID 57517)
-- Name: discounts_units id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts_units ALTER COLUMN id SET DEFAULT nextval('public.discounts_units_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 57427)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 57399)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 57407)
-- Name: orders_products id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 57527)
-- Name: orders_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_statuses ALTER COLUMN id SET DEFAULT nextval('public.orders_statuses_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 57351)
-- Name: points id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);


--
-- TOC entry 2952 (class 2604 OID 57438)
-- Name: points_products id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_products ALTER COLUMN id SET DEFAULT nextval('public.points_products_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 57446)
-- Name: points_types id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_types ALTER COLUMN id SET DEFAULT nextval('public.points_types_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 57369)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 2956 (class 2604 OID 57476)
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 57486)
-- Name: products_kinds id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_kinds ALTER COLUMN id SET DEFAULT nextval('public.products_kinds_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 57497)
-- Name: products_types id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_types ALTER COLUMN id SET DEFAULT nextval('public.products_types_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 57507)
-- Name: products_units id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_units ALTER COLUMN id SET DEFAULT nextval('public.products_units_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 57389)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 57466)
-- Name: services_types id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services_types ALTER COLUMN id SET DEFAULT nextval('public.services_types_id_seq'::regclass);


--
-- TOC entry 2950 (class 2604 OID 57415)
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- TOC entry 3181 (class 0 OID 57356)
-- Dependencies: 205
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.customers (id, customer_type_id, customer_name, customer_email, customer_phone) FROM stdin;
1	3	Ariana Frank	facilisis.non@google.couk	(862) 821-3824
2	2	Kennedy Donaldson	orci.consectetuer@protonmail.ca	1-514-612-5131
3	3	Keaton Gillespie	aliquam.nec@icloud.com	1-477-443-3465
4	1	Trevor Price	faucibus.leo.in@yahoo.org	1-284-816-0244
5	2	Emma Shaw	pede.malesuada@yahoo.com	(851) 782-2527
6	3	Brandon Pruitt	lobortis.class@protonmail.couk	(963) 313-5873
7	2	Tatiana Franklin	ipsum@icloud.ca	(582) 719-3589
8	2	Brenna Berry	arcu@outlook.com	1-948-345-5755
9	2	Kane Blair	vitae.risus.duis@outlook.edu	1-662-973-1914
10	2	Yeo Dejesus	proin.vel.arcu@icloud.edu	1-972-333-6614
11	1	Kiayada Phelps	libero@yahoo.edu	(669) 231-4264
12	3	Tyrone Wall	aliquam.fringilla@hotmail.couk	1-633-553-3043
13	2	Joan Ball	magna.lorem@yahoo.com	(111) 633-3494
14	1	Philip Simmons	curabitur.ut@google.ca	1-961-563-9150
15	3	Hyatt French	vulputate.nisi@hotmail.couk	(582) 677-0893
16	3	Cairo Hubbard	dolor@aol.org	(823) 437-1154
17	2	Geraldine Hawkins	non.vestibulum.nec@aol.net	(481) 156-8885
18	2	Edward Oneil	pede.sagittis@outlook.couk	(222) 652-3686
19	2	Lara Foley	vel@aol.edu	(436) 508-4313
20	2	Andrew Klein	integer.mollis@protonmail.org	1-623-565-3349
21	1	Perry Tyson	nunc.est@protonmail.org	(312) 201-3531
22	1	Nero Contreras	nunc.quisque@yahoo.edu	1-205-261-6869
23	1	Beverly Cooper	facilisis.non@aol.ca	1-613-266-5352
24	2	Venus Morin	nam@aol.org	(548) 453-5718
25	3	Macon Cantrell	eu.lacus@outlook.couk	(427) 272-2591
26	1	Chastity Clemons	tempus.risus@yahoo.edu	(217) 286-2846
27	3	Brennan Hicks	malesuada.id@icloud.edu	1-712-273-2322
28	1	Maris Barton	elementum.sem@aol.ca	(551) 722-7261
29	3	Jared Watts	donec.tempus.lorem@google.com	(869) 538-0412
30	2	Regina Richard	pellentesque.eget@outlook.net	(395) 905-3221
31	2	Kermit Bass	eu.enim.etiam@outlook.net	(884) 242-5597
32	2	Sonia Knight	tristique@hotmail.couk	(139) 458-7338
33	1	Fay Moran	et.ipsum.cursus@google.ca	1-992-781-2381
34	2	Caleb Foley	consequat.purus@outlook.com	(560) 828-3722
35	3	Isaiah Calhoun	tempor.erat@icloud.com	(835) 824-8446
36	2	Beau Best	ante.ipsum@icloud.edu	(894) 451-9601
37	3	Raja Levine	tincidunt.aliquam@hotmail.org	(678) 581-6670
38	1	Leslie Hoffman	facilisis@outlook.edu	1-288-224-4619
39	2	Allistair Pope	scelerisque@protonmail.edu	1-801-633-2922
40	1	Cecilia Ayala	eleifend@aol.couk	(128) 805-2869
41	2	Daria Torres	vel.arcu@yahoo.org	(997) 622-3608
42	2	Vaughan Preston	amet@protonmail.edu	1-926-729-0485
43	1	Vladimir Kerr	non.dapibus.rutrum@icloud.net	(591) 848-4454
44	2	Brielle Mclean	et.magna@yahoo.edu	(485) 247-7892
45	1	Nathaniel Duran	ut@protonmail.edu	1-700-357-6468
46	1	Armando Golden	donec.non@aol.net	(464) 810-8664
47	2	Wynter Conrad	aliquam@outlook.couk	(861) 288-9339
48	2	September Decker	erat.volutpat@google.com	(606) 107-7175
49	1	Oleg Hardy	non.feugiat@aol.couk	(285) 478-6813
50	3	Hannah Randall	a.nunc@icloud.org	1-331-415-9023
51	2	Judith Walter	erat.in@outlook.org	1-414-246-7281
52	2	Zane Gallegos	eu.nulla.at@yahoo.edu	1-426-829-1367
53	2	Alma O'donnell	posuere@outlook.com	(114) 842-2617
54	3	Uta Best	eu.dui@protonmail.edu	1-815-210-8261
55	1	Julie Nicholson	enim.nisl.elementum@protonmail.net	(319) 563-1854
56	1	Phelan Gonzalez	congue@protonmail.com	(477) 535-8364
57	3	Alyssa Crane	purus@aol.ca	1-545-719-6333
58	1	Warren Wilkinson	sociis.natoque.penatibus@outlook.com	1-771-260-9186
59	3	Clark Fernandez	erat.etiam@hotmail.couk	1-477-225-7175
60	1	Justin Bridges	sed@hotmail.ca	1-392-233-6998
61	2	Vladimir Savage	est@protonmail.couk	1-676-302-6000
62	2	Gisela Clemons	mollis.non.cursus@google.net	(648) 568-1825
63	2	Jarrod Wise	parturient@google.couk	(470) 659-6343
64	3	Clinton Noel	ultrices.iaculis.odio@icloud.ca	(114) 653-6016
65	2	Sawyer Yang	dolor.donec@protonmail.ca	1-525-415-3353
66	1	Catherine Dean	bibendum.ullamcorper.duis@outlook.com	1-565-582-6268
67	2	Cherokee Robbins	est.tempor@icloud.net	(537) 533-5704
68	2	Wyatt Aguilar	euismod.mauris@google.couk	1-349-953-3227
69	1	Shannon Stone	morbi.sit@google.org	1-928-416-4017
70	2	Quintessa Rosales	a@hotmail.edu	(618) 381-4093
71	3	Maryam Rasmussen	aliquet.magna.a@protonmail.edu	1-518-656-3031
72	2	Dominic Dyer	nunc.mauris@protonmail.edu	1-424-694-0786
73	3	Chandler Bernard	nulla.interdum@aol.edu	(414) 165-4057
74	2	Victoria Cleveland	vitae.diam.proin@hotmail.couk	(312) 285-8686
75	1	Wyatt Estes	in.sodales.elit@google.net	(371) 510-5447
76	3	Hamish Mcgee	amet.ante@hotmail.couk	(873) 878-1610
77	3	Willa Thornton	quis.urna.nunc@yahoo.com	(609) 254-3375
78	3	Montana Erickson	vitae@aol.ca	1-414-486-4826
79	2	Aretha Mills	mauris.elit@hotmail.ca	(148) 291-7588
80	2	Clayton Watts	sagittis.duis.gravida@icloud.com	1-342-965-9282
81	2	Montana Arnold	est.nunc.ullamcorper@aol.com	(914) 591-9614
82	2	Ali Barnett	eu.enim@outlook.edu	1-128-746-6920
83	1	Danielle Cross	consectetuer.euismod@icloud.net	(222) 654-2466
84	2	Orli Vaughan	arcu.vel@yahoo.couk	(318) 436-0293
85	1	Anika Langley	metus.aenean@protonmail.couk	1-632-327-3022
86	1	Adrian Whitehead	ipsum.primis@outlook.net	(152) 685-3682
87	2	Macaulay Raymond	amet@protonmail.ca	1-463-440-1726
88	3	Michael Matthews	urna.vivamus.molestie@protonmail.org	1-474-554-9697
89	2	Marah Gill	dictum@yahoo.edu	1-645-234-5855
90	2	Alma Estes	ligula.aenean@outlook.couk	1-735-148-1465
91	2	Porter Kaufman	ante.iaculis.nec@google.net	1-876-883-2121
92	3	Alan Kaufman	ipsum.dolor@aol.org	(118) 573-7787
93	2	Rhoda Ford	integer@google.couk	1-344-121-3311
94	2	Arthur Mendez	fringilla.purus@outlook.edu	(976) 238-4173
95	2	Barrett Sweeney	phasellus.at@yahoo.edu	(770) 866-6604
96	1	Nadine Goff	aliquet.proin@icloud.net	1-329-554-9257
97	2	Anjolie Farrell	donec@yahoo.com	(480) 831-5522
98	2	Ruby Hood	cras.pellentesque.sed@google.org	1-332-332-3311
99	1	Cara Sellers	a.dui.cras@hotmail.edu	(285) 519-6658
100	2	Hop Soto	pede@aol.org	1-580-661-1953
\.


--
-- TOC entry 3201 (class 0 OID 57453)
-- Dependencies: 225
-- Data for Name: customers_types; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.customers_types (id, customer_type, is_active) FROM stdin;
1	retail	f
2	wholesale	f
3	small-batch	t
\.


--
-- TOC entry 3185 (class 0 OID 57376)
-- Dependencies: 209
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.discounts (id, discount_name, is_active, discount_amount, discount_unit_id) FROM stdin;
1	dui, nec tempus	f	2	2
2	dignissim tempor arcu.	f	9	2
3	Lorem ipsum	t	7	1
4	Duis elementum,	t	7	1
5	sed turpis	f	9	2
6	Sed dictum. Proin	t	20	2
7	volutpat	t	9	3
8	lobortis, nisi	t	20	1
9	sit amet	t	15	3
10	Nam porttitor	t	5	3
11	ante blandit	f	15	3
12	Phasellus elit pede,	t	19	2
13	interdum. Nunc	t	13	2
14	sit amet,	f	15	3
15	dictum augue	t	20	2
16	et malesuada	f	14	3
17	In faucibus.	t	9	2
18	magna.	f	12	2
19	mi. Duis	t	10	1
20	vitae sodales	f	12	2
\.


--
-- TOC entry 3213 (class 0 OID 57514)
-- Dependencies: 237
-- Data for Name: discounts_units; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.discounts_units (id, discount_unit) FROM stdin;
1	sem
2	suspendisse
3	orci, consectetuer
\.


--
-- TOC entry 3195 (class 0 OID 57424)
-- Dependencies: 219
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, customer_id, point_id, text, sent_at) FROM stdin;
1	35	21	vitae, posuere at, velit. Cras lorem lorem, luctus	2021-11-12 17:12:52
2	42	20	sed leo. Cras vehicula aliquet libero. Integer in	2021-12-02 18:54:58
7	93	10	at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus	2021-11-17 22:01:14
9	32	25	Pellentesque tincidunt tempus risus. Donec egestas. Duis	2021-12-11 17:30:37
18	33	21	nec, leo. Morbi neque tellus, imperdiet non, vestibulum	2021-11-16 13:19:55
25	50	17	porta elit, a feugiat tellus lorem eu metus.	2021-11-28 05:14:30
32	6	28	Class aptent taciti sociosqu ad litora torquent per	2021-11-12 01:41:03
44	34	6	Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla	2021-12-07 07:34:48
49	93	15	elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede.	2021-11-14 18:39:39
3	66	29	Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	2021-11-29 19:58:12
4	32	11	elit sed consequat auctor, nunc nulla vulputate dui, nec	2021-11-24 20:20:04
5	42	8	Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.	2021-11-12 19:31:30
6	78	21	placerat velit. Quisque varius. Nam porttitor scelerisque	2021-12-04 20:14:08
8	81	18	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec	2021-12-09 14:29:51
10	30	6	turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie	2021-12-10 10:45:34
11	50	13	mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis.	2021-11-14 20:43:42
12	9	10	et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,	2021-11-13 22:06:07
13	45	1	varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum.	2021-11-27 09:21:06
14	74	14	lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue,	2021-11-20 21:55:20
15	3	11	amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc	2021-12-11 11:58:53
16	13	6	sed consequat auctor, nunc nulla vulputate dui, nec tempus	2021-12-03 05:13:59
17	34	26	tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis	2021-12-04 07:03:56
19	42	2	enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero	2021-11-28 00:45:15
20	98	3	id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor,	2021-11-21 16:15:58
21	50	19	Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis	2021-11-12 23:41:29
22	91	19	non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum	2021-11-23 12:30:33
23	45	9	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac,	2021-11-21 08:39:26
24	96	2	metus facilisis lorem tristique aliquet. Phasellus fermentum convallis	2021-11-29 14:59:02
26	22	29	felis purus ac tellus. Suspendisse	2021-12-04 22:40:39
27	80	19	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim	2021-11-22 02:06:46
28	44	9	lorem, sit amet ultricies sem magna	2021-11-25 10:17:26
29	46	5	eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus	2021-12-07 20:53:43
30	58	8	luctus lobortis. Class aptent taciti sociosqu	2021-12-04 15:31:51
31	71	29	facilisis vitae, orci. Phasellus dapibus quam quis diam.	2021-11-21 20:25:51
33	2	15	egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper,	2021-11-25 13:02:55
34	40	18	mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy	2021-12-08 20:26:02
35	31	27	nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet	2021-12-07 18:47:39
36	19	24	nunc. In at pede. Cras vulputate velit eu	2021-12-04 20:22:08
37	8	8	amet ornare lectus justo eu arcu. Morbi	2021-11-23 18:17:38
38	51	6	commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies	2021-12-07 23:36:23
39	56	9	Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,	2021-11-20 21:51:18
40	63	13	augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan	2021-11-17 22:31:33
41	92	19	pretium neque. Morbi quis urna. Nunc quis	2021-11-29 09:28:27
42	32	24	euismod urna. Nullam lobortis quam	2021-11-22 23:10:39
43	59	10	ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis	2021-11-28 14:25:37
45	64	8	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	2021-12-11 00:01:31
46	17	16	dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus	2021-11-21 14:43:00
47	23	21	ante ipsum primis in faucibus orci	2021-12-02 14:41:03
48	49	23	dui, in sodales elit erat vitae risus. Duis a mi fringilla	2021-11-28 21:19:13
50	3	11	posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2021-11-15 14:51:16
\.


--
-- TOC entry 3189 (class 0 OID 57396)
-- Dependencies: 213
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.orders (id, customer_id, point_id, service_id, amount_total, created_at, order_status_id, order_status_changed_at) FROM stdin;
1	62	1	17	1932.52	2021-12-06 03:29:10	7	2021-11-13 10:31:02
2	73	3	19	251.8	2021-11-26 16:06:49	8	2021-12-01 10:58:38
3	58	24	5	1513.41	2021-11-16 19:33:05	5	2021-12-06 18:46:22
4	51	18	3	102.41	2021-12-02 10:07:26	9	2021-12-07 20:06:47
5	99	3	8	1388.34	2021-12-04 17:21:37	7	2021-12-06 12:47:17
6	95	10	5	1877.43	2021-12-04 06:09:12	5	2021-11-25 20:49:59
7	57	6	3	364.24	2021-11-28 01:47:01	3	2021-11-22 09:04:46
8	83	4	7	830.16	2021-11-19 06:54:46	7	2021-12-06 20:23:59
9	92	28	17	1444.85	2021-12-09 17:14:08	7	2021-11-15 20:51:05
10	64	14	4	1943.64	2021-11-27 16:26:22	7	2021-12-08 02:01:03
11	49	8	15	747.75	2021-11-19 22:36:00	8	2021-11-19 21:32:01
12	54	7	19	1064.35	2021-11-30 19:14:40	9	2021-11-15 12:24:26
13	88	14	7	368.34	2021-11-24 11:36:53	4	2021-12-09 20:58:33
14	56	3	17	1984.26	2021-11-12 06:55:12	4	2021-11-25 02:34:51
15	53	24	7	1446.68	2021-11-14 11:13:13	3	2021-11-20 09:44:30
16	87	11	5	1268.79	2021-12-08 11:32:51	3	2021-11-19 14:51:08
17	59	10	8	1962.19	2021-11-23 00:58:12	3	2021-11-19 23:56:16
18	84	12	15	1147.31	2021-12-03 07:53:18	2	2021-12-03 01:05:37
19	68	21	13	56.52	2021-12-07 01:44:49	7	2021-12-07 14:05:09
20	8	7	17	1594.46	2021-11-24 07:44:52	6	2021-12-02 02:02:31
21	79	8	9	370.85	2021-12-01 13:14:19	3	2021-12-10 03:15:25
22	27	23	18	407.4	2021-11-14 23:50:04	8	2021-12-03 13:13:49
23	95	4	8	1355.12	2021-11-16 05:05:55	3	2021-11-15 13:07:14
24	52	11	18	1471.31	2021-11-23 22:28:13	3	2021-12-11 05:18:55
25	14	26	17	1873.1	2021-12-01 23:15:56	3	2021-12-04 05:47:08
26	21	16	13	1706.49	2021-12-08 19:27:21	3	2021-11-25 13:08:09
27	38	8	7	1087.7	2021-11-25 07:19:45	2	2021-11-24 01:03:56
28	71	4	11	1856.18	2021-11-18 14:25:16	7	2021-11-17 21:53:05
29	32	11	14	517	2021-12-02 04:42:35	7	2021-12-10 15:36:45
30	29	27	9	1308.49	2021-12-08 20:38:36	8	2021-11-12 20:28:55
31	63	29	13	1689.36	2021-11-22 12:18:57	2	2021-11-21 22:28:07
32	10	24	9	442.75	2021-12-10 12:57:58	7	2021-12-07 23:38:57
33	33	11	4	1392.38	2021-11-17 15:42:41	5	2021-12-06 00:45:46
34	39	12	4	463.59	2021-11-17 07:02:48	4	2021-11-14 19:10:18
35	21	15	15	1915.39	2021-11-30 10:49:52	2	2021-11-18 07:19:01
36	99	14	17	1069.55	2021-11-29 12:43:36	2	2021-12-09 00:00:27
37	14	23	8	341.14	2021-11-24 13:32:50	7	2021-11-23 19:58:23
38	47	23	17	513.51	2021-11-23 18:33:42	6	2021-12-01 12:41:48
39	71	9	11	1368.44	2021-12-05 23:57:01	3	2021-12-02 00:08:33
40	69	4	19	1371.91	2021-11-19 02:57:02	6	2021-11-27 07:06:20
41	25	19	10	1005.71	2021-12-01 08:50:18	8	2021-12-06 21:13:19
42	29	29	4	1754.79	2021-11-30 06:49:51	8	2021-12-07 11:46:06
43	66	16	7	110.1	2021-12-08 10:17:53	3	2021-11-13 04:17:12
44	55	1	13	1060.03	2021-11-21 11:40:05	8	2021-12-03 01:51:51
45	14	21	12	795.19	2021-11-20 16:22:55	2	2021-11-14 08:28:53
46	54	14	16	1676.18	2021-11-13 12:43:37	3	2021-12-07 02:30:30
47	33	18	9	531.75	2021-12-07 05:41:55	6	2021-11-14 03:55:01
48	40	7	6	964.24	2021-11-20 20:00:59	7	2021-11-20 02:35:32
49	48	5	17	100.84	2021-12-10 17:28:43	3	2021-11-24 19:13:32
50	33	13	19	711.58	2021-11-25 18:19:09	3	2021-12-04 13:28:58
51	20	6	19	1209.66	2021-12-06 14:30:45	6	2021-11-28 06:43:06
52	8	15	15	1034.98	2021-12-08 06:00:36	3	2021-12-07 07:50:15
53	51	4	15	1159.48	2021-12-08 22:43:59	2	2021-11-25 13:52:15
54	63	17	2	1319.82	2021-11-27 12:50:58	9	2021-11-20 17:16:09
55	14	7	19	1262.96	2021-12-07 01:51:07	7	2021-11-21 16:04:42
56	85	6	3	1340.57	2021-11-28 16:50:28	4	2021-11-13 16:54:10
57	63	6	15	1864.12	2021-11-20 11:32:24	4	2021-12-09 20:07:55
58	58	21	17	1642.13	2021-11-21 10:35:40	7	2021-11-22 19:05:24
59	76	19	14	903.09	2021-11-20 16:40:45	1	2021-11-14 16:13:27
60	32	9	2	738.65	2021-11-13 12:07:42	2	2021-12-10 07:07:03
61	84	8	12	1240.57	2021-12-06 04:31:57	2	2021-12-06 14:04:12
62	11	15	14	68.53	2021-11-26 18:09:11	5	2021-11-17 11:55:55
63	98	19	1	1748.12	2021-11-20 02:06:08	2	2021-12-06 22:56:26
64	41	20	12	1464.88	2021-12-08 17:30:17	8	2021-11-22 02:50:54
65	92	20	8	176.28	2021-11-29 11:05:46	5	2021-11-25 19:55:33
66	15	4	4	1951.01	2021-12-04 09:12:48	8	2021-12-06 11:17:03
67	29	4	7	1452.62	2021-11-17 05:47:31	6	2021-11-21 18:49:33
68	5	8	15	889.1	2021-12-04 07:20:35	6	2021-11-16 22:33:00
69	18	26	2	1274.17	2021-11-12 18:22:05	4	2021-12-02 07:41:35
70	77	16	2	504.13	2021-12-04 17:21:04	6	2021-11-26 10:56:23
71	88	23	13	376.83	2021-12-02 05:45:39	6	2021-11-26 08:43:27
72	24	6	1	1135.19	2021-12-01 20:19:05	2	2021-11-24 10:09:34
73	19	27	16	345.41	2021-12-05 16:06:46	1	2021-11-25 06:53:33
74	30	24	20	833.85	2021-12-05 10:34:09	3	2021-11-24 05:32:11
75	70	28	1	1818.11	2021-11-16 04:12:44	3	2021-11-14 11:34:42
76	24	22	7	1515.63	2021-11-14 03:44:00	7	2021-11-19 00:48:32
77	98	17	11	1714.23	2021-11-30 15:37:06	5	2021-11-20 04:34:14
78	77	23	8	303.11	2021-11-17 16:59:47	4	2021-12-01 23:54:49
79	82	22	4	190.71	2021-12-06 11:18:50	4	2021-12-01 15:05:09
80	26	28	14	420.51	2021-11-25 01:03:35	6	2021-11-16 14:02:41
81	3	27	4	19.96	2021-11-13 00:58:26	6	2021-11-23 12:43:47
82	95	17	18	884.87	2021-11-19 12:09:24	2	2021-12-09 01:27:12
83	30	25	7	637.86	2021-11-22 16:34:37	7	2021-11-23 07:40:49
84	97	14	12	266.94	2021-11-26 23:59:53	7	2021-12-11 17:07:32
85	47	8	1	192.09	2021-11-22 02:23:56	5	2021-12-03 14:15:18
86	33	27	2	1711.78	2021-11-26 14:33:46	7	2021-11-26 07:48:02
87	28	14	8	213.01	2021-12-04 05:00:22	4	2021-12-05 08:53:03
88	87	20	18	696.68	2021-12-02 15:39:23	5	2021-12-02 19:28:56
89	25	7	15	1630.01	2021-11-28 15:56:04	3	2021-11-21 03:56:02
90	53	16	15	1599.69	2021-12-03 05:52:44	2	2021-11-22 12:12:53
91	51	27	14	1489.48	2021-11-14 12:43:48	3	2021-11-30 12:58:25
92	23	6	12	1000.43	2021-12-08 07:35:45	3	2021-11-30 01:07:12
93	88	10	17	632.31	2021-11-21 22:18:29	6	2021-11-24 00:59:52
94	31	19	4	1442.3	2021-11-13 00:53:31	2	2021-11-24 22:05:04
95	33	7	16	832.97	2021-11-23 18:07:39	8	2021-11-29 10:25:54
96	73	28	9	763.93	2021-12-02 06:53:28	5	2021-11-26 09:04:56
97	40	30	4	188.65	2021-12-03 22:11:19	8	2021-11-15 22:59:19
98	86	26	19	1616.88	2021-11-21 18:33:24	5	2021-12-03 11:01:39
99	48	29	17	529.03	2021-12-02 10:03:22	4	2021-11-19 09:46:58
100	73	9	18	205.69	2021-11-19 04:46:03	3	2021-12-05 20:41:31
\.


--
-- TOC entry 3191 (class 0 OID 57404)
-- Dependencies: 215
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.orders_products (id, order_id, product_id, product_added_at) FROM stdin;
1	92	68	2021-12-06 13:26:34
2	24	31	2021-12-10 13:26:23
3	97	28	2021-11-18 15:00:49
4	77	95	2021-12-09 11:05:54
5	36	55	2021-11-17 21:23:53
6	93	28	2021-11-30 08:40:19
7	87	33	2021-12-10 15:57:07
8	37	28	2021-11-14 00:12:53
9	15	4	2021-12-03 21:59:02
10	50	64	2021-12-06 07:46:35
11	12	91	2021-11-27 22:42:08
12	5	65	2021-11-21 12:43:14
13	86	91	2021-11-23 14:59:39
14	92	45	2021-11-15 21:10:01
15	45	52	2021-11-22 13:45:19
16	3	72	2021-11-13 08:25:37
17	37	72	2021-11-14 05:02:21
18	32	97	2021-11-27 03:22:40
19	42	91	2021-11-24 15:44:21
20	84	81	2021-11-28 07:11:51
21	2	10	2021-11-24 02:09:09
22	48	22	2021-12-07 20:39:34
23	38	17	2021-12-04 03:06:36
24	53	98	2021-11-19 22:57:36
25	95	48	2021-11-30 01:28:12
26	25	36	2021-11-26 15:18:03
27	28	94	2021-12-01 06:33:22
28	83	7	2021-12-10 01:03:06
29	14	16	2021-11-12 17:30:59
30	46	15	2021-11-26 21:31:57
31	68	39	2021-12-06 22:33:23
32	14	49	2021-11-29 07:30:10
33	12	57	2021-11-29 07:36:17
34	60	30	2021-11-25 02:46:34
35	75	7	2021-11-30 15:50:51
36	8	97	2021-12-01 18:31:00
37	96	20	2021-11-22 15:41:31
38	2	90	2021-12-05 15:17:45
39	85	31	2021-11-26 00:17:08
40	37	93	2021-11-27 17:33:16
41	37	25	2021-11-24 07:55:10
42	54	23	2021-11-27 13:02:18
43	6	20	2021-11-15 03:19:43
44	60	25	2021-12-02 22:06:25
45	16	24	2021-11-13 11:29:28
46	94	25	2021-12-05 04:20:00
47	48	91	2021-11-19 05:45:29
48	6	85	2021-11-22 13:15:50
49	51	60	2021-11-26 05:41:20
50	98	39	2021-11-22 13:12:29
51	98	7	2021-12-01 03:33:04
52	73	2	2021-11-19 16:06:59
53	68	70	2021-11-29 16:57:20
54	70	73	2021-12-05 12:48:01
55	52	6	2021-11-23 23:43:17
56	3	31	2021-11-12 01:05:45
57	65	81	2021-11-17 09:15:03
58	64	91	2021-12-11 17:51:25
59	85	33	2021-12-07 23:49:18
60	91	29	2021-11-27 14:28:49
61	52	36	2021-12-01 21:18:12
62	83	65	2021-12-02 07:31:00
63	75	99	2021-11-20 18:15:08
64	13	36	2021-12-11 11:03:25
65	68	78	2021-11-14 10:54:03
66	16	41	2021-11-19 00:55:12
67	32	57	2021-11-14 21:40:18
68	7	64	2021-12-05 04:06:03
69	75	12	2021-12-02 20:53:55
70	31	3	2021-12-01 05:31:32
71	20	63	2021-11-13 23:19:17
72	7	17	2021-11-26 00:12:23
73	2	63	2021-11-27 14:29:42
74	53	26	2021-11-15 14:46:24
75	44	66	2021-11-18 16:14:56
76	26	87	2021-11-27 01:04:38
77	38	33	2021-11-15 23:15:25
78	29	73	2021-12-08 12:09:44
79	6	78	2021-11-25 16:46:11
80	78	53	2021-11-20 08:53:39
81	33	13	2021-11-15 11:28:18
82	61	100	2021-12-09 12:14:44
83	34	38	2021-11-29 06:06:00
84	21	20	2021-11-15 07:12:39
85	39	23	2021-11-12 04:56:30
86	61	84	2021-11-15 04:02:32
87	66	20	2021-11-30 22:09:02
88	71	65	2021-11-27 21:52:44
89	26	31	2021-11-15 14:36:04
90	31	14	2021-11-23 00:24:53
91	86	39	2021-11-19 15:35:54
92	42	77	2021-12-02 13:19:22
93	57	52	2021-11-14 20:52:29
94	43	59	2021-12-03 23:46:00
95	80	65	2021-11-30 21:56:03
96	76	84	2021-11-26 03:44:10
97	32	5	2021-11-24 16:11:31
98	33	85	2021-12-08 00:42:53
99	80	90	2021-12-11 15:17:06
100	21	46	2021-12-03 17:11:24
101	41	30	2021-11-20 23:40:14
102	96	81	2021-12-08 15:17:57
103	15	8	2021-11-27 02:32:33
104	94	22	2021-11-21 05:22:17
105	89	17	2021-12-06 05:23:15
106	48	12	2021-12-07 04:36:37
107	28	10	2021-11-27 15:58:09
108	38	16	2021-12-04 18:50:21
109	41	47	2021-12-07 08:51:43
110	46	63	2021-11-26 23:26:53
111	89	74	2021-11-20 18:12:41
112	2	90	2021-11-24 11:04:47
113	60	10	2021-11-13 17:17:14
114	22	48	2021-11-29 19:53:00
115	50	88	2021-12-01 19:13:16
116	98	78	2021-11-18 14:26:11
117	90	45	2021-11-19 22:44:13
118	68	93	2021-11-29 23:33:41
119	85	14	2021-11-26 13:01:22
120	98	21	2021-12-03 19:47:08
121	47	76	2021-11-30 18:31:49
122	90	19	2021-11-15 22:13:40
123	4	96	2021-11-14 13:43:21
124	8	51	2021-12-01 15:21:44
125	55	91	2021-11-17 14:38:15
126	31	2	2021-11-16 03:23:46
127	25	1	2021-12-02 20:30:04
128	32	3	2021-12-07 21:22:41
129	27	88	2021-11-28 12:49:47
130	78	74	2021-12-01 19:47:10
131	30	42	2021-12-10 11:36:51
132	72	90	2021-11-23 16:20:00
133	12	6	2021-11-14 10:41:47
134	23	85	2021-12-01 01:57:29
135	62	77	2021-12-09 13:08:55
136	33	16	2021-11-23 02:05:24
137	70	69	2021-12-05 23:29:26
138	36	14	2021-11-22 23:12:10
139	1	63	2021-12-04 11:08:15
140	47	75	2021-12-02 04:33:55
141	48	57	2021-11-24 02:54:40
142	16	76	2021-11-30 00:07:08
143	19	97	2021-11-19 19:24:28
144	49	60	2021-12-02 01:52:33
145	89	68	2021-11-25 23:08:55
146	61	34	2021-11-30 14:15:23
147	43	91	2021-12-11 19:58:23
148	22	97	2021-12-10 15:38:26
149	21	59	2021-11-17 23:07:56
150	19	23	2021-12-05 08:51:21
151	79	79	2021-12-04 09:55:58
152	90	78	2021-12-05 01:07:12
153	55	82	2021-11-26 23:23:14
154	98	11	2021-12-06 09:49:16
155	92	25	2021-11-19 23:05:34
156	42	16	2021-12-04 14:14:39
157	17	74	2021-12-04 21:08:15
158	23	48	2021-11-22 06:20:21
159	76	60	2021-11-30 13:28:32
160	62	3	2021-11-13 01:08:16
161	10	28	2021-11-12 02:14:28
162	59	40	2021-11-22 22:39:03
163	61	74	2021-12-08 18:50:19
164	88	84	2021-12-07 05:38:07
165	83	11	2021-11-14 07:41:01
166	13	56	2021-11-28 08:48:00
167	45	10	2021-11-22 08:36:48
168	35	87	2021-12-11 05:57:52
169	20	62	2021-11-12 03:31:26
170	86	24	2021-11-13 15:14:18
171	89	14	2021-12-08 23:56:42
172	28	31	2021-12-07 22:35:31
173	67	77	2021-12-11 22:06:34
174	7	91	2021-11-21 04:25:59
175	41	91	2021-11-27 04:33:01
176	59	83	2021-12-01 01:24:29
177	51	75	2021-12-02 12:24:40
178	3	15	2021-11-18 09:24:46
179	75	70	2021-11-29 12:36:30
180	55	56	2021-11-25 17:36:31
181	32	53	2021-12-02 02:06:37
182	13	71	2021-12-01 13:39:40
183	4	91	2021-12-03 19:25:55
184	100	90	2021-12-01 21:22:46
185	15	40	2021-11-26 07:48:00
186	84	34	2021-11-16 00:15:57
187	86	39	2021-11-28 07:19:45
188	90	53	2021-11-26 18:20:28
189	83	18	2021-11-15 02:12:27
190	52	90	2021-11-26 13:22:52
191	30	17	2021-11-19 18:47:34
192	52	91	2021-11-21 17:38:03
193	53	39	2021-11-25 07:18:56
194	87	30	2021-11-23 10:59:55
195	24	80	2021-11-13 22:21:46
196	90	10	2021-11-21 01:48:34
197	26	40	2021-12-07 02:09:10
198	19	85	2021-11-12 02:06:00
199	11	31	2021-11-23 11:30:15
200	35	43	2021-11-12 12:27:03
\.


--
-- TOC entry 3215 (class 0 OID 57524)
-- Dependencies: 239
-- Data for Name: orders_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.orders_statuses (id, order_status) FROM stdin;
1	not created
2	created
3	payment successful
4	payment declined
5	in progress
6	delivered
7	received
8	return
9	cancel
\.


--
-- TOC entry 3179 (class 0 OID 57348)
-- Dependencies: 203
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.points (id, point_type_id, point_city, point_name, point_address, staff_id) FROM stdin;
1	1	Sochi	Imperdiet Dictum Incorporated	667-7252 Dui Av.	9
2	1	Moscow	Diam Proin LLP	Ap #255-516 Tellus. St.	7
3	2	Balashikha	Feugiat Tellus Inc.	885-7575 Cum Street	2
4	1	Yaroslavl	Lobortis Class Foundation	Ap #707-1110 Non, Rd.	5
5	1	Klin	Dictum Placerat Industries	P.O. Box 199, 9998 Cras Ave	2
6	2	Tula	Fringilla Mi Associates	Ap #576-7985 Posuere St.	9
7	2	Kaluga	Ullamcorper Magna Sed Industries	Ap #854-6798 Eu Road	3
8	1	Obninsk	Condimentum LLP	Ap #312-1994 Enim Rd.	7
9	2	Tver	Scelerisque Lorem Inc.	Ap #594-317 Inceptos St.	5
10	2	Moscow	Neque In Ornare Industries	Ap #388-6489 Pellentesque Av.	6
11	2	Saint Petersburg	Morbi Accumsan Corp.	4796 Eget, Rd.	9
12	1	Moscow	Suspendisse Commodo Incorporated	480-5696 Amet Street	6
13	2	Vladimir	Libero Associates	776-9651 Nascetur Ave	1
14	2	Rostov	Neque LLC	7678 Phasellus St.	10
15	2	Saint Petersburg	Pellentesque A Facilisis Inc.	P.O. Box 445, 8717 Cum Rd.	4
16	1	Dubna	Ac Metus Vitae Corp.	Ap #114-3842 Enim, Avenue	4
17	2	Ryazan	Ut Lacus Industries	Ap #569-3436 Magna Street	8
18	1	Korolev	Elit Pharetra Corporation	Ap #909-7144 Erat, Rd.	9
19	2	Electrostal	Eleifend Egestas Sed PC	1491 At, Street	6
20	1	Zvenigorod	Fusce Aliquam Foundation	931-516 Est, Road	7
21	1	Istra	Consectetuer Adipiscing Limited	461-9150 Mi, Street	8
22	1	Kolomna	Pede Malesuada Limited	767-5999 Erat Av.	5
23	1	Chekhov	Sed Leo Incorporated	Ap #910-4825 Lacus. Rd.	3
24	2	Shatura	Mauris Suspendisse LLC	5378 Ipsum Rd.	9
25	2	Noginsk	Donec Est Corporation	7803 Quisque St.	4
26	1	Gatchina	Tempus Scelerisque Ltd	7405 Proin St.	3
27	2	Volokolamska	Mollis Non Cursus LLP	Ap #715-7284 Quam Av.	6
28	2	Noginsk	Cursus Corporation	1808 Netus St.	7
29	1	Voskresensk	In Felis Foundation	120-7656 Elit. Av.	3
30	2	Pushkin	Erat Sed Corp.	5062 Leo. Ave	8
\.


--
-- TOC entry 3197 (class 0 OID 57435)
-- Dependencies: 221
-- Data for Name: points_products; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.points_products (id, point_id, product_id, is_active, product_amount) FROM stdin;
1	3	18	f	75
2	8	78	f	146
3	12	91	t	25
4	28	46	t	128
5	29	56	t	22
6	9	41	f	149
7	17	7	f	161
8	5	74	f	159
9	7	95	f	152
10	8	33	f	16
11	2	80	f	154
12	22	75	t	86
13	24	20	t	182
14	2	1	t	76
15	24	23	f	72
16	15	63	f	84
17	13	29	t	47
18	23	33	t	75
19	11	9	f	122
20	9	53	f	160
21	3	90	t	150
22	11	5	t	27
23	3	14	f	119
24	25	5	f	147
25	6	39	f	194
26	12	31	f	102
27	1	77	t	88
28	16	47	f	6
29	28	73	f	73
30	6	54	f	181
31	4	66	f	182
32	29	97	f	84
33	29	93	t	182
34	2	31	f	189
35	28	76	t	66
36	25	57	t	129
37	12	53	t	23
38	5	15	f	92
39	9	56	f	173
40	11	23	t	96
41	12	20	f	2
42	8	3	f	1
43	14	50	t	86
44	29	44	t	159
45	9	51	f	150
46	21	35	t	176
47	15	17	t	132
48	10	51	t	121
49	22	72	f	44
50	16	84	f	102
51	18	11	f	50
52	30	39	t	30
53	6	36	t	57
54	26	15	t	182
55	12	64	t	40
56	17	96	t	178
57	3	67	t	78
58	18	82	f	21
59	4	79	t	160
60	22	85	f	28
61	16	50	t	111
62	19	76	t	43
63	27	65	t	90
64	15	22	t	83
65	24	18	t	141
66	18	79	f	58
67	26	4	t	77
68	4	98	f	53
69	11	36	t	177
70	11	84	t	177
71	18	54	t	35
72	15	68	t	76
73	9	100	t	132
74	13	17	t	195
75	16	89	f	49
76	4	45	f	148
77	28	50	f	35
78	13	41	t	24
79	20	41	f	4
80	22	25	f	17
81	7	29	f	183
82	14	29	f	107
83	18	57	f	125
84	9	85	f	163
85	7	42	f	26
86	2	83	t	6
87	24	40	t	81
88	7	71	f	2
89	30	78	f	65
90	18	94	t	100
91	27	21	t	51
92	12	89	f	5
93	8	72	f	125
94	24	67	t	67
95	20	40	f	90
96	16	87	t	120
97	11	76	t	25
98	1	32	f	116
99	28	70	t	56
100	9	33	t	170
101	11	58	f	96
102	19	48	t	187
103	11	82	t	11
104	2	37	t	112
105	11	87	f	142
106	19	41	f	197
107	11	31	t	81
108	14	57	t	46
109	30	41	t	44
110	20	33	t	119
111	30	32	t	50
112	4	34	t	185
113	23	83	f	172
114	2	67	t	102
115	14	38	t	80
116	10	8	f	137
117	25	34	f	115
118	29	44	t	21
119	26	67	t	80
120	15	97	f	187
121	9	79	t	46
122	12	43	f	62
123	19	54	f	90
124	22	22	t	32
125	5	11	t	148
126	29	79	f	187
127	13	32	f	77
128	17	89	t	39
129	9	33	f	75
130	25	63	f	175
131	12	19	f	25
132	15	81	f	188
133	26	8	f	161
134	21	79	t	12
135	20	6	f	160
136	28	91	t	78
137	15	3	t	50
138	15	55	f	177
139	4	72	t	133
140	26	48	f	38
141	18	90	f	126
142	20	40	t	8
143	4	93	f	112
144	8	14	f	77
145	12	76	t	170
146	11	27	f	111
147	2	47	f	159
148	14	44	t	33
149	14	23	t	106
150	30	68	f	103
151	4	88	t	136
152	8	13	f	102
153	18	35	f	106
154	28	49	t	81
155	24	49	f	44
156	26	32	t	150
157	16	27	t	192
158	16	29	f	126
159	6	35	f	139
160	30	83	f	95
161	12	38	f	102
162	18	19	t	184
163	8	34	f	93
164	5	1	t	65
165	29	69	t	35
166	22	71	t	59
167	4	28	t	130
168	10	79	f	72
169	13	85	t	55
170	24	34	t	65
171	21	13	t	186
172	4	55	t	141
173	12	52	f	32
174	14	21	t	122
175	27	46	f	105
176	4	28	f	183
177	5	65	f	151
178	8	84	f	10
179	9	7	t	23
180	7	49	f	30
181	20	42	t	27
182	16	86	f	187
183	28	72	f	136
184	25	54	t	170
185	12	98	t	181
186	7	44	t	94
187	23	43	f	24
188	24	22	t	55
189	24	5	f	60
190	11	87	t	65
191	10	52	f	142
192	27	48	f	189
193	26	77	t	168
194	23	93	t	154
195	16	28	t	72
196	24	28	t	170
197	4	93	f	158
198	25	1	t	155
199	19	49	t	14
200	26	92	t	5
\.


--
-- TOC entry 3199 (class 0 OID 57443)
-- Dependencies: 223
-- Data for Name: points_types; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.points_types (id, point_type, is_active) FROM stdin;
1	retail	t
2	stock	t
\.


--
-- TOC entry 3183 (class 0 OID 57366)
-- Dependencies: 207
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products (id, product_category_id, product_kind_id, product_type_id, product_name, product_unit_id, product_price, discount_id, description) FROM stdin;
1	1	13	4	orci	4	119.4	17	Nunc sollicitudin commodo ipsum. Suspendisse non leo.
2	2	17	37	netus et	2	77.8	16	amet, risus. Donec nibh enim, gravida sit
3	1	9	12	erat neque	8	90.88	7	penatibus et magnis dis parturient montes, nascetur
4	2	12	28	luctus sit	4	195.5	19	Pellentesque ultricies dignissim lacus.
5	1	16	31	egestas	4	187.59	11	ac nulla. In tincidunt congue turpis.
6	2	2	31	Duis	9	11.51	11	facilisis. Suspendisse commodo tincidunt nibh. Phasellus
7	1	7	15	Donec egestas.	10	21.23	14	urna justo faucibus lectus, a sollicitudin orci sem eget massa.
8	1	2	19	a, facilisis	3	50.05	7	magna. Phasellus dolor
9	1	6	18	dapibus rutrum,	7	119.55	16	risus. Nulla eget metus eu erat
10	1	15	23	egestas blandit.	7	132.78	12	Donec elementum, lorem ut aliquam
11	1	16	24	ante lectus	8	35.11	15	nascetur ridiculus mus. Proin vel
12	2	14	36	fames ac	1	113.65	19	sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean
13	1	15	20	sem egestas	1	110.5	5	vehicula et, rutrum eu,
14	2	8	1	vulputate dui,	5	52.95	11	vel, faucibus id, libero. Donec consectetuer mauris
15	1	9	12	amet, consectetuer adipiscing	5	55.12	3	eget, dictum placerat, augue. Sed molestie. Sed
16	1	14	26	dolor elit, pellentesque	4	188.28	13	erat, eget tincidunt
17	1	2	33	ridiculus mus.	3	78.82	5	mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies
18	1	1	37	ac	8	190.5	20	urna. Vivamus molestie dapibus ligula. Aliquam
19	1	9	27	euismod est arcu	10	25.54	17	facilisis vitae, orci. Phasellus dapibus
20	1	6	20	eget laoreet posuere,	1	160.55	19	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla
21	1	9	6	luctus vulputate,	9	108.26	4	orci, in consequat enim diam vel arcu.
22	2	6	29	rutrum	3	45.93	4	ac metus vitae velit egestas lacinia. Sed congue, elit
23	1	7	4	tellus, imperdiet non,	7	9.4	11	mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla
24	1	16	8	sit amet, faucibus	10	44.34	15	lectus sit amet luctus
25	2	9	28	malesuada augue	6	77.46	15	pretium neque. Morbi quis urna.
26	2	12	1	ut aliquam iaculis,	4	9.98	1	Vivamus sit amet risus. Donec egestas. Aliquam
27	1	7	26	ipsum	6	16.64	17	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo
28	2	4	9	nec metus	9	121.59	14	sit amet massa. Quisque porttitor
29	2	11	26	leo,	4	137.5	14	ligula consectetuer rhoncus. Nullam velit dui, semper et,
30	1	15	9	pede sagittis augue,	5	141.95	19	consequat auctor, nunc nulla vulputate
31	1	5	23	id sapien.	3	198.47	6	ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere
32	2	1	25	ut mi.	2	89.09	19	non enim commodo hendrerit. Donec porttitor
33	2	13	35	ac mattis	2	29.25	7	Nullam suscipit, est ac facilisis facilisis,
34	2	3	19	et netus	9	32.37	19	ornare sagittis felis. Donec tempor, est ac mattis
35	2	20	28	sed, est.	7	125.07	8	mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis
36	1	9	39	Donec	8	75.7	13	tristique senectus et netus et malesuada fames
37	2	17	27	risus. Nunc	8	89.13	12	Mauris non dui nec
38	2	11	27	amet ante.	6	156.17	18	Integer mollis. Integer tincidunt aliquam
39	1	9	7	eleifend	3	48.21	20	ut nisi a odio semper cursus. Integer mollis. Integer
40	2	3	2	lacus vestibulum	9	137.43	3	dignissim magna a tortor. Nunc commodo auctor
41	1	11	21	sed dui.	6	198.32	8	mollis lectus pede et risus. Quisque
42	1	16	3	morbi tristique senectus	4	40.05	6	vel turpis. Aliquam adipiscing lobortis risus. In mi
43	1	2	36	gravida mauris ut	6	61.34	10	lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed
44	2	6	5	malesuada fringilla est.	2	197.19	11	pede, malesuada vel,
45	1	14	31	Maecenas mi	5	152.88	4	tellus, imperdiet non, vestibulum nec, euismod
46	2	2	11	nisl. Nulla eu	2	71.94	18	risus. Donec egestas. Aliquam
47	1	2	20	blandit congue.	8	132.05	9	Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod
48	1	18	9	velit justo	7	12.03	11	ante. Nunc mauris sapien, cursus
49	2	3	34	lectus	4	148.51	5	id magna et ipsum cursus vestibulum.
50	2	12	17	arcu. Sed et	8	72.3	13	Nullam velit dui, semper et, lacinia vitae, sodales
51	2	5	11	mauris ut	9	161.78	2	tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi.
52	1	4	17	litora torquent per	9	159.53	15	vehicula risus. Nulla eget metus eu erat semper
53	2	13	31	orci luctus	7	106.15	13	tincidunt, nunc ac mattis ornare, lectus ante dictum
54	1	16	10	mi lacinia	4	99.3	8	in lobortis tellus justo sit amet nulla. Donec non
55	2	17	15	ante dictum	10	35.49	4	ac sem ut dolor dapibus
56	1	7	25	parturient montes,	6	33.21	5	ac urna. Ut tincidunt vehicula
57	1	8	14	vel quam dignissim	3	125.54	20	Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,
58	2	14	20	malesuada	6	175.39	18	risus. Morbi metus. Vivamus euismod urna. Nullam
59	1	7	20	a mi fringilla	6	79.28	11	mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam.
60	1	2	4	Phasellus fermentum	5	108.2	12	lacus. Quisque purus sapien, gravida non, sollicitudin a,
61	1	7	4	nec	4	164.37	15	Nullam nisl. Maecenas malesuada fringilla
62	2	5	11	dictum ultricies ligula.	7	62.26	13	massa. Suspendisse eleifend. Cras sed leo.
63	2	4	37	nunc est,	7	44.18	10	Morbi neque tellus, imperdiet non,
64	2	5	17	id,	5	135.78	17	pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,
65	2	2	23	urna. Nunc	2	101.22	12	erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.
66	2	3	37	malesuada id,	3	95.25	17	risus. Morbi metus. Vivamus euismod
67	2	14	31	iaculis, lacus pede	2	141.12	13	Mauris ut quam vel
68	1	3	29	Suspendisse	4	85.99	2	elementum sem, vitae aliquam eros turpis non enim.
69	1	17	20	lorem ipsum	2	64.23	3	arcu vel quam dignissim pharetra. Nam ac nulla. In
70	1	9	3	at lacus.	9	10.12	3	bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna
71	1	2	25	tellus non magna.	6	113.17	9	rhoncus. Nullam velit dui, semper et, lacinia vitae,
72	2	19	8	Nunc laoreet lectus	3	172.04	3	est ac mattis semper, dui lectus rutrum urna, nec luctus
73	1	3	25	ligula. Donec	4	173.22	6	non, egestas a,
74	1	7	30	pharetra	8	132.21	8	orci lacus vestibulum lorem, sit
75	1	11	4	Sed nunc	3	145.08	20	ipsum primis in faucibus orci luctus et
76	2	16	5	tempor diam dictum	2	141.91	4	Mauris eu turpis. Nulla aliquet. Proin velit.
77	1	11	34	eget mollis	6	141.6	3	Nulla tempor augue ac ipsum. Phasellus vitae
78	1	14	16	varius orci,	5	65.04	15	Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi
79	2	18	32	consequat nec, mollis	7	21.43	11	mollis. Duis sit amet
80	2	5	22	egestas oy	2	131.82	15	imperdiet ornare. In faucibus. Morbi vehicula.
81	1	14	19	consectetuer	10	12.04	14	ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet
82	1	16	19	tempor	4	113.25	18	dictum eu, placerat eget, venenatis a, magna. Lorem
83	2	15	40	non, sollicitudin a,	10	89.62	1	Duis risus odio, auctor
84	1	14	29	auctor, nunc	2	34.21	5	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam
85	1	10	7	orci. Ut sagittis	9	154.81	11	Morbi non sapien molestie orci tincidunt adipiscing. Mauris
86	1	13	38	augue malesuada	8	134.77	17	ac tellus. Suspendisse sed dolor.
87	2	4	2	natoque penatibus	5	102.92	11	vitae aliquam eros
88	2	12	26	ornare lectus	7	170.13	14	dignissim tempor arcu. Vestibulum ut eros
89	2	6	37	et ipsum	6	42.2	6	Suspendisse tristique neque venenatis
90	1	1	5	facilisis	8	76.49	15	ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus
91	1	16	4	dictum magna. Ut	6	140.05	20	diam. Pellentesque habitant
92	1	5	7	Integer aliquam	3	45.91	2	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,
93	1	14	12	blandit enim consequat	8	143.9	6	elit sed consequat auctor, nunc nulla vulputate dui, nec
94	2	19	25	torquent per conubia	9	156.01	13	mi pede, nonummy ut, molestie in,
95	1	6	7	suscipit, est	6	9.1	3	condimentum eget, volutpat
96	2	8	33	metus facilisis	4	117.02	6	magna et ipsum cursus vestibulum.
97	2	10	20	ac oy	8	10.31	4	In nec orci. Donec nibh.
98	2	9	28	velit.	8	192.98	9	lectus, a sollicitudin orci sem eget
99	1	10	20	sed	8	17.84	17	cursus et, magna.
100	2	15	33	arcu. Sed eu	8	100	11	dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis
\.


--
-- TOC entry 3205 (class 0 OID 57473)
-- Dependencies: 229
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products_categories (id, product_category, is_active) FROM stdin;
2	households	t
1	foodstuffs	t
\.


--
-- TOC entry 3207 (class 0 OID 57483)
-- Dependencies: 231
-- Data for Name: products_kinds; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products_kinds (id, product_category_id, product_kind, is_active) FROM stdin;
1	1	dairy	t
3	1	pasta and cereals	t
6	1	bread and bakery	t
7	1	meat	t
8	1	fish	f
10	1	preserves	t
11	2	dishes	t
16	2	appliances	f
17	2	holiday	t
18	2	trifles	f
2	1	vegetables and fruits	t
4	1	snacks	f
5	1	beverage	t
9	1	caffe and tea	t
12	2	cleaning and laundary	t
13	2	hygiene	t
14	2	pharmacy	f
15	2	pet store	t
19	1	chocolate and sweets	t
20	1	prepared food	f
\.


--
-- TOC entry 3209 (class 0 OID 57494)
-- Dependencies: 233
-- Data for Name: products_types; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products_types (id, product_category_id, product_kind_id, product_type, is_active) FROM stdin;
1	1	11	eleifend	f
2	2	3	maecenas	t
3	2	6	sed,	f
4	2	15	non, hendrerit	t
5	1	10	euismod	t
6	2	3	et, rutrum	t
7	1	17	ornare placerat,	f
8	1	18	neque. Nullam	f
9	1	2	tincidunt congue	f
10	2	3	laoreet posuere,	f
11	1	3	in lorem.	t
12	2	11	tincidunt adipiscing.	t
13	1	2	ultrices	t
14	1	9	nibh. Aliquam	f
15	1	8	ornare,	t
16	1	17	justo	f
17	1	12	eget	f
18	2	4	nisl.	t
19	2	15	luctus. Curabitur	t
20	2	13	faucibus	f
21	2	11	dolor	f
22	2	20	est, vitae	f
23	2	16	parturient	f
24	1	2	varius	f
25	1	16	laoreet	t
26	2	2	eu	t
27	2	7	vehicula	f
28	1	3	urna.	t
29	2	16	massa non	t
30	1	3	lacus. Quisque	t
31	2	7	quisque	t
32	1	5	nec luctus	t
33	2	11	et magnis	t
34	2	16	risus, at	t
35	2	9	duis gravida.	t
36	2	4	neque sed	t
37	2	19	donec	f
38	1	6	praesent luctus.	f
39	1	10	fringilla	f
40	2	19	cras	f
\.


--
-- TOC entry 3211 (class 0 OID 57504)
-- Dependencies: 235
-- Data for Name: products_units; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products_units (id, product_unit) FROM stdin;
1	torquent per
2	ligula tortor,
3	curabitur vel
4	morbi
5	dui
6	at
7	pede ac
8	faucibus. Morbi
9	nunc, ullamcorper
10	auctor non,
\.


--
-- TOC entry 3187 (class 0 OID 57386)
-- Dependencies: 211
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.services (id, service_type_id, service_name, service_price, is_active) FROM stdin;
1	1	tincidunt. Donec	41	f
2	1	in, cursus	64	f
3	1	mollis	98	f
4	2	ut mi.	18	t
5	2	lacus. Ut nec	40	f
6	1	varius	9	t
7	2	Proin vel	60	t
8	1	nunc	68	t
9	1	pellentesque. Sed dictum.	83	t
10	1	molestie orci	56	f
11	2	orci.	80	f
12	1	egestas ligula. Nullam	89	f
13	1	pede et risus.	56	f
14	2	vitae nibh. Donec	3	f
15	1	est. Nunc	6	t
16	1	vitae aliquam	58	f
17	2	egestas. Aliquam	24	f
18	2	non	95	t
19	2	purus. Maecenas	50	t
20	1	vel turpis.	74	f
\.


--
-- TOC entry 3203 (class 0 OID 57463)
-- Dependencies: 227
-- Data for Name: services_types; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.services_types (id, service_type, is_active) FROM stdin;
1	delivery	f
2	storage	t
\.


--
-- TOC entry 3193 (class 0 OID 57412)
-- Dependencies: 217
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.staff (id, staff_name, staff_code, staff_email, staff_phone) FROM stdin;
1	Mara Pickett	U2F3P8	phasellus.elit@icloud.ca	(435) 987-5341
2	Phillip Nielsen	B3X8L6	tellus@aol.edu	1-747-831-2283
3	Dorian Craft	R8B1H7	integer.vulputate@hotmail.com	(766) 141-1636
4	Merrill Hays	T5B5H3	vitae.aliquet@protonmail.net	(645) 743-1353
5	Henry Meyer	G8S2X8	ipsum.primis.in@outlook.edu	(272) 480-0326
6	Maxine Blair	D8F2F5	id.erat@yahoo.org	(277) 445-3841
7	Ira Moreno	G5H7W7	molestie.sodales@google.net	1-949-931-6833
8	Fuller Cherry	Z2A4W9	purus.maecenas@google.net	1-251-745-6754
9	Yoshi Lloyd	C0E3B5	quis@icloud.couk	1-831-886-6923
10	Graiden Walters	B9F0L9	auctor.ullamcorper@google.com	(433) 893-0413
\.


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 204
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 224
-- Name: customers_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.customers_types_id_seq', 1, false);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 208
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.discounts_id_seq', 1, false);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 236
-- Name: discounts_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.discounts_units_id_seq', 1, false);


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 218
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 214
-- Name: orders_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.orders_products_id_seq', 1, false);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 238
-- Name: orders_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.orders_statuses_id_seq', 1, false);


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 202
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.points_id_seq', 1, false);


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 220
-- Name: points_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.points_products_id_seq', 1, false);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 222
-- Name: points_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.points_types_id_seq', 1, false);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 228
-- Name: products_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_categories_id_seq', 1, false);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_kinds_id_seq', 1, false);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 232
-- Name: products_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_types_id_seq', 1, false);


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 234
-- Name: products_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_units_id_seq', 1, false);


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 210
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 226
-- Name: services_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.services_types_id_seq', 1, false);


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 216
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.staff_id_seq', 1, false);


--
-- TOC entry 2965 (class 2606 OID 57363)
-- Name: customers customers_customert_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customert_email_key UNIQUE (customer_email);


--
-- TOC entry 2967 (class 2606 OID 57361)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 57460)
-- Name: customers_types customers_types_customer_type_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers_types
    ADD CONSTRAINT customers_types_customer_type_key UNIQUE (customer_type);


--
-- TOC entry 3001 (class 2606 OID 57458)
-- Name: customers_types customers_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers_types
    ADD CONSTRAINT customers_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 57383)
-- Name: discounts discounts_discount_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_discount_name_key UNIQUE (discount_name);


--
-- TOC entry 2975 (class 2606 OID 57381)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 57521)
-- Name: discounts_units discounts_units_discount_unit_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts_units
    ADD CONSTRAINT discounts_units_discount_unit_key UNIQUE (discount_unit);


--
-- TOC entry 3025 (class 2606 OID 57519)
-- Name: discounts_units discounts_units_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts_units
    ADD CONSTRAINT discounts_units_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 57432)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 57401)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2983 (class 2606 OID 57409)
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 57531)
-- Name: orders_statuses orders_statuses_order_status_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_statuses
    ADD CONSTRAINT orders_statuses_order_status_key UNIQUE (order_status);


--
-- TOC entry 3029 (class 2606 OID 57529)
-- Name: orders_statuses orders_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_statuses
    ADD CONSTRAINT orders_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 57353)
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 57440)
-- Name: points_products points_products_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 57448)
-- Name: points_types points_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_types
    ADD CONSTRAINT points_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 57450)
-- Name: points_types points_types_point_type_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_types
    ADD CONSTRAINT points_types_point_type_key UNIQUE (point_type);


--
-- TOC entry 3007 (class 2606 OID 57478)
-- Name: products_categories products_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 57480)
-- Name: products_categories products_categories_product_category_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_category_key UNIQUE (product_category);


--
-- TOC entry 3011 (class 2606 OID 57488)
-- Name: products_kinds products_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_pkey PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 57490)
-- Name: products_kinds products_kinds_product_kind_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_product_kind_key UNIQUE (product_kind);


--
-- TOC entry 2969 (class 2606 OID 57371)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 57373)
-- Name: products products_product_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_key UNIQUE (product_name);


--
-- TOC entry 3015 (class 2606 OID 57499)
-- Name: products_types products_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 57501)
-- Name: products_types products_types_product_type_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_type_key UNIQUE (product_type);


--
-- TOC entry 3019 (class 2606 OID 57509)
-- Name: products_units products_units_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_units
    ADD CONSTRAINT products_units_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 57511)
-- Name: products_units products_units_product_unit_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_units
    ADD CONSTRAINT products_units_product_unit_key UNIQUE (product_unit);


--
-- TOC entry 2977 (class 2606 OID 57391)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 57393)
-- Name: services services_service_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_name_key UNIQUE (service_name);


--
-- TOC entry 3003 (class 2606 OID 57468)
-- Name: services_types services_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services_types
    ADD CONSTRAINT services_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 57470)
-- Name: services_types services_types_service_type_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services_types
    ADD CONSTRAINT services_types_service_type_key UNIQUE (service_type);


--
-- TOC entry 2985 (class 2606 OID 57417)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 57419)
-- Name: staff staff_staff_code_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_staff_code_key UNIQUE (staff_code);


--
-- TOC entry 2989 (class 2606 OID 57421)
-- Name: staff staff_staff_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_staff_email_key UNIQUE (staff_email);


--
-- TOC entry 3031 (class 2606 OID 106501)
-- Name: customers customers_customer_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_type_id_fk FOREIGN KEY (customer_type_id) REFERENCES public.customers_types(id);


--
-- TOC entry 3037 (class 2606 OID 106526)
-- Name: discounts discounts_discount_unit_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_discount_unit_id_fk FOREIGN KEY (discount_unit_id) REFERENCES public.discounts_units(id);


--
-- TOC entry 3045 (class 2606 OID 106596)
-- Name: messages messages_customer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 3046 (class 2606 OID 106607)
-- Name: messages messages_point_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);


--
-- TOC entry 3039 (class 2606 OID 106556)
-- Name: orders orders_customer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 3042 (class 2606 OID 106571)
-- Name: orders orders_order_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_id_fk FOREIGN KEY (order_status_id) REFERENCES public.orders_statuses(id);


--
-- TOC entry 3040 (class 2606 OID 106561)
-- Name: orders orders_point_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);


--
-- TOC entry 3043 (class 2606 OID 106612)
-- Name: orders_products orders_products_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3044 (class 2606 OID 106617)
-- Name: orders_products orders_products_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3041 (class 2606 OID 106566)
-- Name: orders orders_service_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_service_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- TOC entry 3030 (class 2606 OID 106496)
-- Name: points points_point_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_point_type_id_fk FOREIGN KEY (point_type_id) REFERENCES public.points_types(id);


--
-- TOC entry 3047 (class 2606 OID 106586)
-- Name: points_products points_products_point_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);


--
-- TOC entry 3048 (class 2606 OID 106591)
-- Name: points_products points_products_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3036 (class 2606 OID 106551)
-- Name: products products_discount_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_discount_id_fk FOREIGN KEY (discount_id) REFERENCES public.discounts(id);


--
-- TOC entry 3049 (class 2606 OID 106506)
-- Name: products_kinds products_kinds_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);


--
-- TOC entry 3032 (class 2606 OID 106531)
-- Name: products products_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);


--
-- TOC entry 3033 (class 2606 OID 106536)
-- Name: products products_product_kind_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_kind_id_fk FOREIGN KEY (product_kind_id) REFERENCES public.products_kinds(id);


--
-- TOC entry 3034 (class 2606 OID 106541)
-- Name: products products_product_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fk FOREIGN KEY (product_type_id) REFERENCES public.products_types(id);


--
-- TOC entry 3035 (class 2606 OID 106546)
-- Name: products products_product_unit_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_unit_id_fk FOREIGN KEY (product_unit_id) REFERENCES public.products_units(id);


--
-- TOC entry 3050 (class 2606 OID 106511)
-- Name: products_types products_types_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);


--
-- TOC entry 3051 (class 2606 OID 106516)
-- Name: products_types products_types_product_kind_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_kind_id_fk FOREIGN KEY (product_kind_id) REFERENCES public.products_kinds(id);


--
-- TOC entry 3038 (class 2606 OID 106521)
-- Name: services services_service_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_type_id_fk FOREIGN KEY (service_type_id) REFERENCES public.services_types(id);


-- Completed on 2022-11-21 21:56:57

--
-- PostgreSQL database dump complete
--

