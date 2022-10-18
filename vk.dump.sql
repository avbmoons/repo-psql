--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-10-18 21:23:16

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
-- TOC entry 211 (class 1259 OID 24620)
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- TOC entry 210 (class 1259 OID 24618)
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 210
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- TOC entry 212 (class 1259 OID 24628)
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- TOC entry 207 (class 1259 OID 24602)
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- TOC entry 206 (class 1259 OID 24600)
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 206
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- TOC entry 209 (class 1259 OID 24610)
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- TOC entry 208 (class 1259 OID 24608)
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 208
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- TOC entry 205 (class 1259 OID 24591)
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- TOC entry 204 (class 1259 OID 24589)
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
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 204
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 214 (class 1259 OID 24635)
-- Name: photos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photos OWNER TO gb_user;

--
-- TOC entry 213 (class 1259 OID 24633)
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO gb_user;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 213
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- TOC entry 218 (class 1259 OID 24661)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subscription_type_id integer NOT NULL,
    what_signed_id integer NOT NULL,
    signed_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO gb_user;

--
-- TOC entry 217 (class 1259 OID 24659)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO gb_user;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 217
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 220 (class 1259 OID 24669)
-- Name: subscriptions_type; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions_type (
    id integer NOT NULL,
    type character varying(50)
);


ALTER TABLE public.subscriptions_type OWNER TO gb_user;

--
-- TOC entry 219 (class 1259 OID 24667)
-- Name: subscriptions_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_type_id_seq OWNER TO gb_user;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 219
-- Name: subscriptions_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_type_id_seq OWNED BY public.subscriptions_type.id;


--
-- TOC entry 203 (class 1259 OID 24579)
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- TOC entry 202 (class 1259 OID 24577)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 216 (class 1259 OID 24648)
-- Name: videos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.videos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.videos OWNER TO gb_user;

--
-- TOC entry 215 (class 1259 OID 24646)
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO gb_user;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 215
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- TOC entry 2893 (class 2604 OID 24623)
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 24605)
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 24613)
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 24594)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 24638)
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 24664)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 24672)
-- Name: subscriptions_type id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_type ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_type_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 24582)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 24651)
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- TOC entry 3067 (class 0 OID 24620)
-- Dependencies: 211
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
11	hendrerit consectetuer, cursus et,	95	2021-10-28 01:17:07
12	imperdiet ullamcorper. Duis at lacus.	77	2022-04-23 14:25:49
13	tortor. Integer aliquam	17	2022-09-14 05:27:54
14	ac turpis egestas.	47	2022-07-17 07:49:50
15	parturient montes,	83	2022-04-19 12:20:31
16	ante, iaculis nec, eleifend non,	12	2022-03-19 23:35:28
17	morbi tristique senectus	15	2021-10-05 09:20:28
18	parturient	96	2022-03-02 08:56:27
19	elit.	30	2021-10-03 13:17:55
20	sed, facilisis vitae,	85	2021-10-04 06:18:32
21	Etiam gravida molestie arcu.	17	2022-04-20 18:46:36
22	Aliquam adipiscing lobortis	16	2021-10-17 21:51:21
23	eget	54	2022-01-26 10:09:36
24	egestas. Sed pharetra,	54	2022-08-13 12:02:50
25	cursus	65	2022-02-10 21:49:15
26	Etiam imperdiet dictum magna.	60	2022-05-21 10:25:40
27	enim. Curabitur massa.	67	2022-06-17 12:39:08
28	dolor. Fusce feugiat. Lorem ipsum	94	2022-05-19 09:06:23
29	et	38	2021-12-03 01:27:00
30	neque sed dictum	99	2022-08-30 11:57:44
\.


--
-- TOC entry 3068 (class 0 OID 24628)
-- Dependencies: 212
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
93	90	2022-06-13 11:45:39
20	76	2022-06-25 04:22:00
29	82	2022-05-29 14:26:21
21	4	2022-04-13 22:27:48
\.


--
-- TOC entry 3063 (class 0 OID 24602)
-- Dependencies: 207
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	40	81	1	2022-05-25 05:40:42	2022-01-27 12:22:06
2	57	12	5	2021-11-12 00:34:58	2022-04-09 10:29:32
3	24	52	1	2022-01-07 05:56:03	2022-03-27 23:32:55
4	99	94	4	2021-10-29 07:08:56	2021-10-20 09:41:04
5	30	91	5	2022-07-21 23:47:48	2022-04-18 18:16:43
6	19	95	1	2022-04-18 11:21:48	2022-03-17 12:52:37
7	33	20	2	2022-03-16 20:50:07	2022-08-11 20:59:45
8	77	8	2	2022-08-24 08:13:57	2022-04-03 17:35:52
9	69	54	5	2021-10-30 01:39:04	2022-01-13 00:55:26
10	44	29	1	2022-04-27 09:13:49	2021-11-08 12:54:02
11	65	97	2	2021-12-20 07:02:22	2021-11-06 18:15:16
12	1	11	2	2022-05-18 19:52:39	2022-02-23 18:38:08
13	10	39	3	2022-01-23 23:35:42	2022-08-02 18:21:59
14	6	60	3	2022-06-12 21:06:12	2022-07-19 06:03:36
15	35	49	4	2021-11-18 02:49:30	2022-04-12 07:47:56
16	84	24	4	2021-10-09 15:16:17	2022-04-10 18:12:53
17	58	62	1	2022-08-12 15:26:27	2021-11-17 18:12:51
18	37	69	1	2022-09-07 08:44:56	2022-01-24 22:28:26
19	90	57	4	2022-02-09 16:01:43	2021-11-21 15:45:32
20	95	37	2	2022-03-20 21:10:40	2022-06-13 17:30:21
21	9	12	4	2021-11-16 03:12:18	2022-06-05 23:50:12
22	70	29	3	2022-07-24 09:00:20	2022-08-12 03:21:01
23	71	89	5	2021-11-08 16:54:04	2022-04-24 00:50:48
24	55	92	3	2021-11-17 02:26:48	2022-07-03 18:44:35
25	10	17	2	2021-11-26 11:06:34	2021-12-15 13:16:56
26	95	31	2	2022-09-06 06:05:17	2021-11-30 20:48:15
27	44	59	2	2021-10-21 04:34:29	2022-09-02 01:17:49
28	41	50	2	2022-05-19 01:24:50	2022-01-17 20:18:40
29	50	78	3	2022-01-08 15:19:47	2022-01-06 03:42:05
30	88	65	5	2021-11-26 20:33:13	2022-05-07 06:16:36
31	70	98	5	2022-04-28 09:03:27	2022-05-13 15:18:50
32	4	55	5	2021-10-09 05:04:18	2022-07-31 01:45:27
33	25	45	5	2022-09-23 10:56:50	2022-07-24 01:06:17
34	15	53	1	2022-07-29 07:09:30	2021-11-24 08:48:05
35	30	67	4	2022-07-14 09:45:04	2022-01-03 11:09:53
36	19	76	1	2021-11-25 19:08:20	2022-04-10 04:46:38
37	95	66	1	2022-01-10 02:24:18	2022-07-08 12:33:13
38	42	84	4	2022-03-12 23:37:30	2021-10-14 23:10:00
39	77	20	4	2022-03-29 14:10:26	2022-08-19 13:17:12
40	38	64	2	2022-02-17 12:14:14	2022-02-22 00:40:08
41	23	76	2	2021-12-28 11:23:36	2022-03-08 15:48:37
42	100	75	2	2021-12-05 03:20:45	2021-10-20 19:48:53
43	9	58	4	2022-03-26 12:51:12	2022-07-13 07:22:35
44	59	20	5	2021-12-26 00:48:43	2022-07-17 09:12:04
45	61	40	5	2022-08-24 22:05:53	2022-07-17 20:08:37
46	93	58	3	2022-02-03 23:36:19	2022-01-19 18:07:16
47	13	43	2	2022-09-29 17:02:19	2022-04-11 00:53:10
48	93	81	3	2022-03-17 02:01:09	2021-10-16 21:43:36
49	48	22	3	2022-06-21 16:42:32	2022-04-27 20:39:00
50	88	19	1	2022-01-16 14:19:22	2022-04-12 10:29:14
51	8	65	3	2022-09-06 10:06:28	2022-09-03 19:53:23
52	99	6	5	2022-06-20 19:15:53	2022-02-02 03:28:28
53	13	70	5	2022-09-10 15:12:12	2022-07-10 12:28:39
54	93	27	5	2022-07-13 01:34:28	2022-06-23 10:38:52
55	66	81	4	2022-02-15 17:24:25	2022-02-25 05:10:44
56	72	88	2	2022-06-23 04:08:21	2021-10-02 17:20:06
57	53	23	4	2022-05-25 01:14:51	2021-10-29 11:56:47
58	22	19	4	2021-11-04 00:55:01	2022-05-27 03:14:33
59	94	76	3	2022-01-27 12:05:11	2022-02-27 13:55:04
60	24	92	2	2022-09-21 02:56:53	2022-05-20 10:42:08
61	93	67	1	2022-04-12 13:36:51	2022-08-20 03:59:36
62	85	73	2	2022-04-24 17:42:32	2022-08-16 00:20:51
63	41	30	1	2022-02-10 23:50:50	2022-04-10 18:08:04
64	99	83	3	2022-08-16 20:57:27	2022-08-04 14:12:50
65	64	83	1	2021-12-22 21:55:36	2022-01-03 08:40:42
66	60	81	2	2022-07-16 05:56:17	2021-12-18 10:55:17
67	56	40	1	2021-10-14 23:03:40	2022-08-12 12:23:30
68	29	98	3	2022-05-25 17:56:45	2022-01-22 22:38:43
69	69	74	3	2022-03-23 10:21:20	2021-12-17 10:32:54
70	12	69	2	2021-12-19 04:41:48	2022-04-24 19:25:12
71	35	10	4	2022-05-02 00:54:17	2022-06-03 07:20:01
72	75	51	2	2021-10-20 10:02:25	2022-02-24 06:49:09
73	61	23	5	2022-09-03 01:33:02	2022-05-02 06:07:57
74	100	1	4	2022-07-01 17:04:27	2022-04-16 09:29:07
75	92	94	5	2022-08-16 09:19:11	2021-10-04 01:43:08
76	86	96	4	2022-01-17 18:17:05	2022-03-10 20:45:30
77	43	9	2	2022-02-11 00:24:18	2022-06-21 14:18:25
78	59	12	2	2022-04-27 21:55:14	2021-12-28 02:34:22
79	23	2	1	2022-06-14 02:43:00	2022-06-03 18:44:54
80	51	77	3	2022-02-01 08:57:34	2022-01-05 05:03:15
81	7	81	4	2021-12-22 03:37:12	2022-04-25 03:04:58
82	65	69	4	2021-10-09 12:09:24	2021-11-14 22:07:39
83	17	25	2	2022-08-23 02:15:02	2022-01-17 14:12:22
84	33	92	4	2021-12-16 11:26:12	2021-11-25 09:01:40
85	73	84	4	2022-01-02 21:11:37	2022-03-12 18:59:24
86	28	18	2	2021-11-02 13:56:19	2022-01-22 03:35:52
87	32	63	2	2021-12-13 00:31:56	2022-08-16 00:01:49
88	66	60	4	2022-05-13 18:24:05	2022-04-13 19:57:22
89	81	34	5	2022-06-27 23:19:50	2022-03-13 07:03:17
90	91	36	5	2022-02-22 08:39:46	2022-01-17 03:56:32
91	94	70	2	2021-10-09 00:50:27	2022-02-06 23:22:39
92	52	90	1	2022-04-23 00:25:57	2022-07-17 21:34:55
93	71	69	2	2022-07-09 11:51:54	2022-06-05 11:25:07
94	30	35	2	2022-06-29 01:58:24	2022-09-25 20:36:40
95	30	97	3	2022-07-18 15:11:30	2022-07-20 01:09:12
96	3	37	5	2022-08-05 18:38:59	2022-05-01 09:20:49
97	79	34	3	2022-06-07 05:06:02	2021-12-25 10:47:43
98	81	7	1	2021-10-10 00:43:09	2022-08-25 10:33:10
99	99	14	4	2021-12-07 09:24:59	2022-01-12 14:09:28
100	71	22	2	2022-05-11 16:59:16	2022-06-13 00:08:03
\.


--
-- TOC entry 3065 (class 0 OID 24610)
-- Dependencies: 209
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	no request
2	request
3	request canceled
4	confirmed
5	confirmation canceled
\.


--
-- TOC entry 3061 (class 0 OID 24591)
-- Dependencies: 205
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	80	2	vitae aliquam eros turpis non enim. Mauris quis turpis	t	t	2021-10-01 17:04:00
2	92	87	sit amet, faucibus ut, nulla. Cras	f	f	2021-10-01 17:04:00
3	27	72	ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci	t	t	2021-10-01 17:04:00
4	60	44	ac mattis	f	t	2021-10-01 17:04:00
5	63	5	nonummy ipsum	t	t	2021-10-01 17:04:00
6	10	74	fringilla purus mauris a nunc. In at pede.	f	t	2021-10-01 17:04:00
7	5	22	arcu. Sed eu nibh	f	f	2021-10-01 17:04:00
8	81	91	tellus	f	f	2021-10-01 17:04:00
9	97	56	Sed molestie. Sed id risus quis diam luctus	f	t	2021-10-01 17:04:00
10	98	96	Maecenas mi felis, adipiscing fringilla,	f	f	2021-10-01 17:04:00
11	49	0	vehicula.	t	t	2021-10-01 17:04:00
12	58	64	lobortis quis,	f	f	2021-10-01 17:04:00
13	25	63	aliquet diam.	t	t	2021-10-01 17:04:00
14	71	2	odio. Etiam ligula tortor, dictum eu, placerat	t	t	2021-10-01 17:04:00
15	89	17	elit. Nulla facilisi. Sed neque. Sed eget	t	t	2021-10-01 17:04:00
16	68	13	mollis non, cursus non, egestas a, dui. Cras pellentesque.	f	f	2021-10-01 17:04:00
17	79	89	nascetur ridiculus mus. Proin vel nisl. Quisque fringilla	f	f	2021-10-01 17:04:00
18	51	90	a,	f	f	2021-10-01 17:04:00
19	73	82	congue. In scelerisque scelerisque dui. Suspendisse ac	f	t	2021-10-01 17:04:00
20	76	59	Vivamus sit amet	f	t	2021-10-01 17:04:00
21	88	81	aliquet vel, vulputate eu, odio.	t	f	2021-10-01 17:04:00
22	88	80	dui. Fusce diam nunc, ullamcorper	f	f	2021-10-01 17:04:00
23	32	99	eros non enim	f	f	2021-10-01 17:04:00
24	8	43	elementum sem, vitae	f	t	2021-10-01 17:04:00
25	26	83	dolor sit amet,	t	f	2021-10-01 17:04:00
26	70	68	magna a	f	f	2021-10-01 17:04:00
27	75	35	quis lectus. Nullam suscipit, est	f	f	2021-10-01 17:04:00
28	5	47	pretium et, rutrum non, hendrerit id, ante.	f	f	2021-10-01 17:04:00
29	78	13	sed dui. Fusce aliquam, enim nec tempus scelerisque,	f	t	2021-10-01 17:04:00
30	22	83	eget, volutpat ornare, facilisis eget,	f	t	2021-10-01 17:04:00
31	42	98	tristique ac, eleifend vitae, erat. Vivamus	f	f	2021-10-01 17:04:00
32	87	55	est tempor bibendum. Donec felis orci, adipiscing non, luctus	t	f	2021-10-01 17:04:00
33	60	74	Pellentesque ultricies dignissim lacus. Aliquam	t	t	2021-10-01 17:04:00
34	93	75	sem mollis dui, in sodales elit erat vitae	t	f	2021-10-01 17:04:00
35	65	62	mi felis, adipiscing fringilla,	t	t	2021-10-01 17:04:00
36	64	74	ut, nulla. Cras eu	f	f	2021-10-01 17:04:00
37	21	21	elit. Etiam	t	t	2021-10-01 17:04:00
38	57	32	velit in aliquet lobortis,	t	t	2021-10-01 17:04:00
39	32	74	libero mauris,	f	t	2021-10-01 17:04:00
40	90	11	orci luctus et ultrices posuere cubilia Curae	t	t	2021-10-01 17:04:00
41	13	55	arcu	t	f	2021-10-01 17:04:00
42	41	97	arcu ac orci. Ut semper	f	t	2021-10-01 17:04:00
43	68	19	ac facilisis facilisis, magna tellus	t	t	2021-10-01 17:04:00
44	31	47	mollis vitae, posuere	t	t	2021-10-01 17:04:00
45	3	18	Curae Phasellus ornare. Fusce mollis. Duis	f	f	2021-10-01 17:04:00
46	64	74	sit amet diam eu dolor egestas rhoncus. Proin nisl	t	t	2021-10-01 17:04:00
47	4	17	quam. Pellentesque habitant morbi tristique senectus et netus et	f	t	2021-10-01 17:04:00
48	56	87	nascetur ridiculus mus.	t	f	2021-10-01 17:04:00
49	14	41	lorem ac risus. Morbi metus. Vivamus	t	f	2021-10-01 17:04:00
50	98	22	nibh vulputate mauris sagittis	f	f	2021-10-01 17:04:00
51	70	91	Aliquam ornare, libero at auctor ullamcorper, nisl	f	f	2021-10-01 17:04:00
52	35	99	pretium neque. Morbi quis	f	f	2021-10-01 17:04:00
53	56	65	lobortis tellus justo sit	f	f	2021-10-01 17:04:00
54	77	86	massa. Mauris vestibulum, neque sed dictum eleifend, nunc	t	f	2021-10-01 17:04:00
55	69	83	sit	t	f	2021-10-01 17:04:00
56	95	15	Mauris eu turpis.	t	t	2021-10-01 17:04:00
57	10	4	Integer urna.	f	f	2021-10-01 17:04:00
58	21	11	posuere at, velit. Cras lorem	f	t	2021-10-01 17:04:00
59	100	4	egestas a, dui. Cras pellentesque. Sed dictum. Proin	t	t	2021-10-01 17:04:00
60	74	10	conubia nostra, per inceptos hymenaeos. Mauris	f	f	2021-10-01 17:04:00
61	24	1	Integer vitae nibh. Donec est	t	f	2021-10-01 17:04:00
62	64	38	est arcu ac orci. Ut semper	t	t	2021-10-01 17:04:00
63	34	24	Nunc ullamcorper, velit in	t	f	2021-10-01 17:04:00
64	40	70	Ut semper pretium neque. Morbi quis urna. Nunc quis arcu	f	f	2021-10-01 17:04:00
65	70	75	vitae risus.	t	f	2021-10-01 17:04:00
66	78	52	nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.	t	t	2021-10-01 17:04:00
67	2	82	luctus,	t	t	2021-10-01 17:04:00
68	11	11	mollis. Duis sit amet	f	f	2021-10-01 17:04:00
69	100	20	vitae velit egestas lacinia. Sed congue, elit sed	t	f	2021-10-01 17:04:00
70	47	92	Sed et libero. Proin	t	t	2021-10-01 17:04:00
71	5	89	neque. Nullam nisl.	f	t	2021-10-01 17:04:00
72	75	46	ornare, lectus ante dictum mi,	f	f	2021-10-01 17:04:00
73	9	46	faucibus id, libero.	f	f	2021-10-01 17:04:00
74	55	98	gravida sit amet,	f	f	2021-10-01 17:04:00
75	76	4	arcu ac orci. Ut	f	t	2021-10-01 17:04:00
76	100	95	eros. Nam consequat dolor	f	f	2021-10-01 17:04:00
77	22	3	sit amet, consectetuer adipiscing elit. Aliquam auctor,	f	f	2021-10-01 17:04:00
78	66	12	Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,	t	t	2021-10-01 17:04:00
79	1	38	non magna. Nam ligula	f	t	2021-10-01 17:04:00
80	70	17	nulla. Cras eu tellus eu	t	f	2021-10-01 17:04:00
81	88	82	erat neque	t	f	2021-10-01 17:04:00
82	0	11	Proin sed turpis nec mauris blandit mattis. Cras	f	f	2021-10-01 17:04:00
83	3	72	sodales elit erat vitae risus. Duis a	t	t	2021-10-01 17:04:00
84	21	91	fringilla ornare placerat, orci	f	t	2021-10-01 17:04:00
85	76	65	a purus. Duis	t	t	2021-10-01 17:04:00
86	19	80	amet, consectetuer adipiscing elit. Curabitur	t	t	2021-10-01 17:04:00
87	68	28	dignissim lacus. Aliquam rutrum lorem	f	t	2021-10-01 17:04:00
88	61	26	Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae,	t	t	2021-10-01 17:04:00
89	96	41	vel quam dignissim pharetra. Nam ac	f	t	2021-10-01 17:04:00
90	39	98	Donec fringilla. Donec feugiat metus sit amet	f	t	2021-10-01 17:04:00
91	78	29	Duis volutpat nunc sit amet metus. Aliquam erat	f	t	2021-10-01 17:04:00
92	28	26	est. Nunc ullamcorper, velit in aliquet	t	f	2021-10-01 17:04:00
93	13	40	fames ac turpis egestas. Aliquam fringilla	t	f	2021-10-01 17:04:00
94	17	68	Etiam	f	t	2021-10-01 17:04:00
95	89	27	condimentum. Donec at arcu. Vestibulum ante ipsum primis	f	t	2021-10-01 17:04:00
96	51	13	id, blandit at, nisi. Cum sociis natoque	f	t	2021-10-01 17:04:00
97	83	69	Nulla interdum.	f	t	2021-10-01 17:04:00
98	99	10	eget laoreet posuere, enim nisl	f	f	2021-10-01 17:04:00
99	18	23	nec tempus mauris erat eget ipsum.	t	f	2021-10-01 17:04:00
100	68	63	Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	t	t	2021-10-01 17:04:00
\.


--
-- TOC entry 3070 (class 0 OID 24635)
-- Dependencies: 214
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photos (id, url, owner_id, description, uploaded_at, size) FROM stdin;
50	https://walmarts.com/sub	27	ut odio vel est tempor	2021-11-19 21:00:25	7
51	http://nytimes.com/sub/cars	2	quam, elementum at, egestas a, scelerisque sed, sapien. Nunc	2021-12-25 10:28:37	5
52	https://wikipedia.org/settings	68	Pellentesque ultricies dignissim lacus. Aliquam rutrum	2021-10-05 02:23:44	18
53	http://guardian.co.uk/settings	49	rutrum urna, nec luctus felis purus ac tellus. Suspendisse	2022-07-15 15:47:39	17
54	https://facebook.com/sub/cars	31	egestas. Aliquam nec enim. Nunc ut erat. Sed nunc	2022-02-13 12:23:50	5
55	https://zoom.us/group/9	68	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis	2022-01-21 17:55:41	8
56	https://twitter.com/en-us	31	feugiat tellus lorem eu metus. In	2021-11-20 19:40:14	18
57	http://whatsapp.com/sub/cars	60	orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero	2022-03-09 05:08:26	2
58	https://twitter.com/user/110	93	odio, auctor vitae, aliquet nec, imperdiet nec,	2021-11-07 06:19:00	9
59	https://cnn.com/group/9	75	mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie	2022-08-22 22:42:39	13
60	https://naver.com/sub/cars	85	quis turpis	2022-04-14 01:40:38	6
77	https://yahoos.com/settings	43	Phasellus elit pede, malesuada vel,	2021-12-27 23:19:50	11
78	http://yahoo.com/one	16	tincidunt, neque vitae semper egestas, urna justo	2022-06-06 18:17:30	7
79	https://instagram.com/sub/cars	34	Donec non justo. Proin non	2021-11-22 12:15:07	4
80	https://netflix.com/one	33	non dui nec urna suscipit nonummy. Fusce	2022-03-28 10:47:37	7
81	http://nytimes.com/one	88	et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor	2022-08-29 00:55:42	12
82	http://bbc.co.uk/group/9	4	semper egestas, urna	2022-09-29 16:32:12	3
83	https://walmart.com/one	96	a, dui. Cras pellentesque. Sed	2022-05-16 14:14:03	6
84	http://nytimes.com/sub	58	ipsum. Donec sollicitudin adipiscing ligula. Aenean	2022-09-14 05:32:25	9
85	https://instagram.com/one	23	fermentum vel, mauris. Integer sem elit,	2021-10-08 11:52:09	18
86	http://baidu.com/en-ca	48	libero. Morbi accumsan laoreet ipsum. Curabitur	2021-11-29 03:02:14	4
87	http://reddit.com/one	75	lobortis risus. In mi pede,	2021-11-03 13:38:59	6
88	https://wikipedia.org/group/9	51	luctus. Curabitur egestas nunc	2022-06-25 04:01:49	4
89	https://whatsapp.com/group/9	97	adipiscing lacus. Ut nec	2022-02-18 23:32:17	15
90	http://cnn.com/sub/cars	30	velit. Pellentesque ultricies dignissim lacus.	2022-09-14 13:55:42	18
91	https://instagrams.com/one	27	Morbi non sapien molestie orci tincidunt adipiscing. Mauris	2022-07-10 05:39:29	10
92	http://pinterest.com/fr	98	ante. Nunc mauris sapien, cursus in, hendrerit	2021-11-21 15:37:26	6
93	https://bbc.co.uk/fr	28	senectus et netus et	2022-07-09 15:19:48	19
94	http://cnn.com/en-ca	95	bibendum sed, est. Nunc laoreet lectus	2022-04-18 10:20:54	14
95	https://baidu.com/group/9	73	ornare, lectus ante dictum mi,	2022-07-29 02:41:57	9
96	http://wikipedia.org/en-us	64	leo elementum sem, vitae aliquam eros turpis non	2022-07-28 05:36:58	11
97	https://whatsapp.com/sub	93	dignissim pharetra. Nam ac nulla. In tincidunt	2022-09-06 19:37:05	11
98	http://netflix.com/en-ca	11	Quisque libero lacus,	2021-12-30 07:52:20	11
99	http://google.com/settings	16	vulputate mauris sagittis placerat. Cras dictum ultricies	2022-09-06 18:04:30	17
100	https://bbc.co.uk/site	17	pede. Praesent eu dui. Cum sociis natoque penatibus	2022-06-08 16:59:55	16
\.


--
-- TOC entry 3074 (class 0 OID 24661)
-- Dependencies: 218
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions (id, user_id, subscription_type_id, what_signed_id, signed_at) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 24669)
-- Dependencies: 220
-- Data for Name: subscriptions_type; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions_type (id, type) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 24579)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Darrel	Dixon	fusce@hotmail.edu	(387) 812-1672	2	2021-10-01 17:04:00
2	Geoffrey	Foley	enim.nec@yahoo.ca	1-484-461-3743	75	2021-10-01 17:04:00
3	Illiana	Whitney	aliquam@outlook.ca	1-237-347-9189	34	2021-10-01 17:04:00
4	Tate	Hickman	aliquam.eu.accumsan@hotmail.ca	(477) 458-5721	44	2021-10-01 17:04:00
5	Susan	Bradshaw	eleifend.vitae.erat@yahoo.edu	1-251-457-3329	58	2021-10-01 17:04:00
6	Stella	Franco	nascetur.ridiculus.mus@aol.edu	1-457-551-7334	75	2021-10-01 17:04:00
7	Jordan	Mcmillan	eget.metus@google.ca	1-286-586-3855	35	2021-10-01 17:04:00
8	Baker	Avery	justo.nec@aol.com	(732) 282-1919	59	2021-10-01 17:04:00
9	Brooke	Schwartz	porttitor.eros@outlook.org	1-374-236-8234	99	2021-10-01 17:04:00
10	Allistair	Rivers	enim.consequat@yahoo.couk	1-365-757-2874	18	2021-10-01 17:04:00
11	Barclay	Gallagher	egestas.urna@google.net	(207) 473-1253	20	2021-10-01 17:04:00
12	Maxwell	Green	luctus.ut@outlook.edu	1-369-425-6117	66	2021-10-01 17:04:00
13	Shafira	Joyce	tristique.pellentesque.tellus@yahoo.org	(558) 585-7744	45	2021-10-01 17:04:00
14	Heidi	Sullivan	lorem.luctus@protonmail.net	1-477-382-6730	54	2021-10-01 17:04:00
15	Jorden	Lawson	nunc.in.at@outlook.net	(883) 631-4488	52	2021-10-01 17:04:00
16	Cain	Jordan	semper.pretium.neque@protonmail.com	1-741-865-7238	2	2021-10-01 17:04:00
17	Ferris	Hutchinson	amet.consectetuer@aol.com	(367) 980-7424	77	2021-10-01 17:04:00
18	Adrian	Scott	non.lorem@yahoo.ca	1-738-443-1165	42	2021-10-01 17:04:00
19	Elijah	Shepherd	tincidunt.congue@aol.couk	(193) 317-7685	23	2021-10-01 17:04:00
20	Carissa	Patel	ac.metus@hotmail.ca	1-524-437-7554	18	2021-10-01 17:04:00
21	Kevyn	Keller	purus@hotmail.edu	1-161-774-5486	74	2021-10-01 17:04:00
22	Kevyn	Sykes	montes.nascetur@hotmail.com	(765) 357-4627	48	2021-10-01 17:04:00
23	Thane	Wolfe	luctus.ipsum.leo@google.edu	(423) 613-1516	21	2021-10-01 17:04:00
24	Celeste	Rogers	non.vestibulum@protonmail.net	(834) 463-2255	36	2021-10-01 17:04:00
25	Oprah	Riddle	semper.cursus@hotmail.couk	1-902-276-4931	8	2021-10-01 17:04:00
26	Wayne	Patel	lacus.aliquam@outlook.couk	(330) 583-4146	43	2021-10-01 17:04:00
27	Reece	Frost	dolor.quisque.tincidunt@yahoo.couk	(984) 370-3663	73	2021-10-01 17:04:00
28	Hedwig	Bird	mauris.suspendisse@protonmail.net	1-603-771-3898	86	2021-10-01 17:04:00
29	Christine	Randolph	nulla@aol.couk	1-481-786-0181	76	2021-10-01 17:04:00
30	Xena	Santana	nisi.nibh.lacinia@outlook.com	(519) 187-4423	23	2021-10-01 17:04:00
31	Selma	Bass	nec.quam@hotmail.edu	(221) 372-4512	48	2021-10-01 17:04:00
32	Ainsley	Shepard	porttitor.eros.nec@aol.org	(543) 637-5140	70	2021-10-01 17:04:00
33	Iola	Barron	risus.varius@google.couk	(679) 672-2163	74	2021-10-01 17:04:00
34	Clementine	Franks	nulla.integer@outlook.com	1-385-286-6189	10	2021-10-01 17:04:00
35	Imogene	Ayala	odio.tristique@outlook.couk	(665) 776-6886	60	2021-10-01 17:04:00
36	Tucker	Stout	orci@yahoo.edu	(322) 797-4771	20	2021-10-01 17:04:00
37	Valentine	Hogan	in.consectetuer@yahoo.org	(521) 723-8940	36	2021-10-01 17:04:00
38	Sacha	Juarez	ipsum@protonmail.com	1-552-766-0429	65	2021-10-01 17:04:00
39	McKenzie	Hawkins	ante.maecenas@aol.net	1-754-246-1177	51	2021-10-01 17:04:00
40	Kylee	Meadows	dolor.fusce@icloud.com	(122) 385-1371	95	2021-10-01 17:04:00
41	Mira	Bernard	luctus@hotmail.edu	(569) 873-7264	90	2021-10-01 17:04:00
42	Darrel	Howell	ligula@icloud.org	(319) 867-1951	26	2021-10-01 17:04:00
43	Cynthia	Scott	ac.sem@aol.couk	(110) 637-5079	10	2021-10-01 17:04:00
44	Wynne	Garcia	ut.odio@outlook.com	(670) 905-6794	82	2021-10-01 17:04:00
45	Ross	Pennington	bibendum@hotmail.edu	(357) 705-0674	45	2021-10-01 17:04:00
46	George	Rosales	ipsum.donec.sollicitudin@google.ca	1-343-557-9683	58	2021-10-01 17:04:00
47	Levi	Blake	nullam@icloud.net	1-855-428-7373	98	2021-10-01 17:04:00
48	Mercedes	Norman	vel@icloud.edu	1-888-363-4525	89	2021-10-01 17:04:00
49	Martin	Woodward	pellentesque.habitant.morbi@yahoo.org	1-463-354-3979	33	2021-10-01 17:04:00
50	Amal	Slater	neque.sed@hotmail.com	(807) 461-0515	70	2021-10-01 17:04:00
51	Kylee	Lewis	euismod@yahoo.net	(428) 537-4727	93	2021-10-01 17:04:00
52	Gwendolyn	Best	felis.adipiscing.fringilla@google.ca	(148) 171-3758	68	2021-10-01 17:04:00
53	Madeson	Duran	elit.nulla.facilisi@aol.edu	1-662-329-8428	80	2021-10-01 17:04:00
54	Amos	Wade	faucibus.ut.nulla@outlook.ca	1-560-432-2778	98	2021-10-01 17:04:00
55	Adena	Porter	amet.risus@yahoo.couk	1-701-448-5351	79	2021-10-01 17:04:00
56	Jaquelyn	Donovan	lorem@protonmail.ca	1-477-816-8583	14	2021-10-01 17:04:00
57	Uriah	Haley	ipsum.donec@aol.ca	(815) 315-3362	23	2021-10-01 17:04:00
58	Vernon	Livingston	eu.placerat.eget@protonmail.net	(847) 452-2758	99	2021-10-01 17:04:00
59	Chloe	Frye	pede.nonummy.ut@google.couk	(288) 312-5350	35	2021-10-01 17:04:00
60	Paloma	Mcknight	elit.sed@aol.com	(632) 947-1243	63	2021-10-01 17:04:00
61	John	Thomas	facilisis.suspendisse.commodo@outlook.net	1-625-565-4856	77	2021-10-01 17:04:00
62	Lester	Lynch	eleifend.nunc@icloud.com	(325) 433-9999	46	2021-10-01 17:04:00
63	Samson	Peters	rutrum.fusce@outlook.ca	(528) 243-1155	85	2021-10-01 17:04:00
64	Jolene	Gonzalez	mauris.quis.turpis@google.org	1-617-231-8051	6	2021-10-01 17:04:00
65	Thane	Curry	litora.torquent@aol.edu	(555) 561-8086	98	2021-10-01 17:04:00
66	Davis	Strong	in.faucibus.orci@hotmail.org	(374) 827-4648	99	2021-10-01 17:04:00
67	Bertha	Ratliff	hendrerit@aol.couk	1-471-727-7619	45	2021-10-01 17:04:00
68	Lana	Maxwell	eu.arcu@google.couk	1-428-477-2414	52	2021-10-01 17:04:00
69	Marshall	Wilder	mollis.non@protonmail.com	1-787-332-1097	33	2021-10-01 17:04:00
70	Megan	Barr	est.tempor.bibendum@google.net	(638) 104-3258	54	2021-10-01 17:04:00
71	Hedley	Monroe	auctor.odio@outlook.net	(658) 384-6014	55	2021-10-01 17:04:00
72	Mason	Stevenson	cras@google.couk	(575) 985-2764	96	2021-10-01 17:04:00
73	Kevin	Mullins	bibendum@aol.ca	1-398-148-5688	44	2021-10-01 17:04:00
74	Aretha	Rich	quis.pede.praesent@hotmail.ca	(838) 407-0819	72	2021-10-01 17:04:00
75	Carson	Hatfield	nullam@google.couk	1-205-368-7271	6	2021-10-01 17:04:00
76	Veda	Hunter	sollicitudin.orci.sem@yahoo.ca	(931) 463-5323	46	2021-10-01 17:04:00
77	Nayda	Wallace	fermentum@hotmail.edu	1-241-835-2652	60	2021-10-01 17:04:00
78	Mara	Short	pharetra.nibh.aliquam@hotmail.org	1-427-755-3553	84	2021-10-01 17:04:00
79	Julian	Sloan	a.dui@aol.ca	1-648-842-9514	33	2021-10-01 17:04:00
80	Colin	Harmon	curabitur.dictum.phasellus@google.ca	(712) 187-8670	22	2021-10-01 17:04:00
81	Savannah	Cabrera	laoreet@yahoo.edu	(481) 867-4188	27	2021-10-01 17:04:00
82	Adena	Mcknight	vel.lectus@aol.com	(726) 671-1182	98	2021-10-01 17:04:00
83	Bo	Padilla	lacus.nulla@yahoo.edu	1-123-309-0994	99	2021-10-01 17:04:00
84	Abra	Mcintyre	nullam.feugiat.placerat@hotmail.ca	1-626-488-2576	75	2021-10-01 17:04:00
85	Isabelle	Stanton	aliquam@aol.couk	(525) 875-7662	6	2021-10-01 17:04:00
86	Caesar	Holloway	lectus.pede@google.org	(979) 607-5523	62	2021-10-01 17:04:00
87	Lucas	Turner	pede.blandit@icloud.org	1-569-428-4357	21	2021-10-01 17:04:00
88	Cora	Valencia	phasellus.dapibus@hotmail.edu	1-131-636-6688	66	2021-10-01 17:04:00
89	Graiden	Lowery	quis@google.net	(694) 544-8386	36	2021-10-01 17:04:00
90	Desirae	Dudley	ultrices.duis@icloud.edu	(432) 344-7060	37	2021-10-01 17:04:00
91	Justine	Mooney	arcu.eu@google.couk	1-259-239-6176	23	2021-10-01 17:04:00
92	August	Chavez	mus@hotmail.couk	(591) 744-2961	86	2021-10-01 17:04:00
93	Hamilton	Greene	turpis.vitae@outlook.ca	1-237-161-8248	97	2021-10-01 17:04:00
94	Rajah	Fitzgerald	in@protonmail.net	(674) 579-4364	65	2021-10-01 17:04:00
95	Ingrid	Frank	lacus.vestibulum.lorem@protonmail.couk	(575) 411-0678	100	2021-10-01 17:04:00
96	Nasim	Osborn	amet.ultricies@aol.org	1-411-674-7640	64	2021-10-01 17:04:00
97	Uriah	Bates	in.tempus@protonmail.org	1-571-875-1867	90	2021-10-01 17:04:00
98	Steel	Wise	convallis.dolor.quisque@protonmail.org	1-280-625-7863	1	2021-10-01 17:04:00
99	Inga	Stafford	dignissim.lacus@protonmail.com	(449) 412-6419	99	2021-10-01 17:04:00
100	Cooper	Fletcher	turpis.aliquam@aol.com	1-750-468-0418	81	2021-10-01 17:04:00
\.


--
-- TOC entry 3072 (class 0 OID 24648)
-- Dependencies: 216
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.videos (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	http://guardian.co.uk/en-ca	73	risus. Nunc ac sem ut dolor dapibus	2022-04-20 21:16:27	8
2	https://instagram.com/sub/cars	56	vitae risus. Duis a mi fringilla mi	2022-07-05 23:17:02	16
3	http://reddit.com/site	71	in faucibus orci luctus et ultrices	2022-07-07 17:25:12	12
4	http://netflix.com/sub/cars	7	Vivamus non lorem vitae odio sagittis semper.	2022-09-02 11:53:44	19
5	http://zoom.us/en-us	52	nec, diam. Duis mi enim, condimentum eget,	2022-06-21 18:26:39	6
6	https://youtube.com/one	43	lacinia. Sed congue, elit sed consequat auctor, nunc nulla	2022-03-21 23:50:42	11
7	http://guardian.co.uk/site	13	tellus justo sit amet nulla. Donec non justo. Proin non	2022-04-11 02:08:33	18
8	http://bbc.co.uk/en-us	73	commodo tincidunt nibh. Phasellus nulla.	2022-08-29 07:02:04	2
9	https://yahoo.com/en-us	4	sem molestie sodales. Mauris blandit enim	2022-04-04 10:11:03	20
10	https://facebook.com/en-ca	61	ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas	2022-07-10 06:57:37	14
11	http://ebay.com/en-us	85	dui nec urna	2022-04-22 15:53:41	14
12	https://bbc.co.uk/settings	2	ac, eleifend vitae,	2022-04-24 15:55:21	16
13	https://google.com/user/110	37	aliquet molestie tellus. Aenean egestas hendrerit neque.	2022-06-09 07:02:02	18
14	https://cnn.com/en-ca	6	sed, hendrerit a, arcu. Sed et libero.	2022-01-21 23:50:34	20
15	https://google.com/sub/cars	29	Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum	2021-10-18 14:21:11	11
16	http://facebook.com/sub/cars	40	tincidunt congue	2022-05-18 00:52:47	6
17	http://wikipedia.org/settings	55	laoreet posuere, enim nisl	2022-09-03 19:04:30	13
18	https://netflix.com/fr	93	tincidunt, neque vitae semper egestas, urna justo faucibus	2022-04-12 01:25:02	6
19	https://naver.com/sub/cars	90	erat, in consectetuer ipsum nunc id enim. Curabitur	2022-09-10 02:19:30	11
20	https://baidu.com/one	53	Nam nulla magna, malesuada vel, convallis	2022-03-19 19:06:51	6
40	http://navers.com/en-us	30	libero. Proin sed turpis	2022-05-21 22:21:28	17
41	https://walmart.com/one	10	mattis velit	2022-09-04 19:22:09	2
42	https://reddit.com/user/110	83	eu dolor egestas rhoncus. Proin nisl	2022-06-28 21:16:14	5
43	http://facebook.com/sub	94	eu, odio. Phasellus at augue id ante dictum	2022-01-14 15:16:10	18
44	http://google.com/sub	24	Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare	2022-06-24 11:51:37	20
45	https://instagram.com/user/110	7	eu tempor erat neque non quam.	2022-03-24 04:27:50	20
46	http://pinterest.com/site	77	molestie. Sed id risus	2022-09-23 17:48:26	10
47	https://guardian.co.uk/fr	72	ipsum non arcu.	2022-03-12 05:00:32	17
48	http://baidu.com/sub	59	ipsum sodales purus,	2022-03-11 18:36:53	7
49	https://wikipedia.org/site	97	sem molestie	2022-08-09 03:36:08	16
50	https://ebay.com/group/9	15	lorem ut aliquam iaculis, lacus pede sagittis augue, eu	2021-10-21 23:29:05	11
\.


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 210
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 1, false);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 206
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 1, false);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 208
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 1, false);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 204
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 213
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photos_id_seq', 1, false);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 217
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 219
-- Name: subscriptions_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_type_id_seq', 1, false);


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 215
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.videos_id_seq', 1, false);


--
-- TOC entry 2913 (class 2606 OID 24627)
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- TOC entry 2915 (class 2606 OID 24625)
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 24632)
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- TOC entry 2907 (class 2606 OID 24607)
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 24617)
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- TOC entry 2911 (class 2606 OID 24615)
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 24599)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 24643)
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 24645)
-- Name: photos photos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_url_key UNIQUE (url);


--
-- TOC entry 2927 (class 2606 OID 24666)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 24674)
-- Name: subscriptions_type subscriptions_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_type
    ADD CONSTRAINT subscriptions_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 24676)
-- Name: subscriptions_type subscriptions_type_type_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_type
    ADD CONSTRAINT subscriptions_type_type_key UNIQUE (type);


--
-- TOC entry 2899 (class 2606 OID 24586)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2901 (class 2606 OID 24588)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 2903 (class 2606 OID 24584)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 24656)
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 24658)
-- Name: videos videos_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_url_key UNIQUE (url);


-- Completed on 2022-10-18 21:23:19

--
-- PostgreSQL database dump complete
--

