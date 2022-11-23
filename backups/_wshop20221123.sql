PGDMP     	    !            
    z            wshop "   12.12 (Ubuntu 12.12-1.pgdg20.04+1)    14.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    57345    wshop    DATABASE     Z   CREATE DATABASE wshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE wshop;
                postgres    false            �           0    0    DATABASE wshop    ACL     '   GRANT ALL ON DATABASE wshop TO shoper;
                   postgres    false    3236            �           1247    114707    max_remains    TYPE     d   CREATE TYPE public.max_remains AS (
	point integer,
	city character varying(50),
	remains bigint
);
    DROP TYPE public.max_remains;
       public          gb_user    false            �            1255    114708    point_max_products_remains()    FUNCTION     �   CREATE FUNCTION public.point_max_products_remains() RETURNS public.max_remains
    LANGUAGE sql
    AS $$
	SELECT 
	point, 
	city, 
	COUNT(product) AS remains
	FROM points_with_products_remains
	GROUP BY point, city
	ORDER BY remains DESC
	LIMIT 1;
$$;
 3   DROP FUNCTION public.point_max_products_remains();
       public          gb_user    false    745            �            1259    57356 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    customer_type_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_email character varying(50) NOT NULL,
    customer_phone character varying(30) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    gb_user    false            �            1259    57354    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          gb_user    false    205            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          gb_user    false    204            �            1259    57453    customers_types    TABLE     �   CREATE TABLE public.customers_types (
    id integer NOT NULL,
    customer_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
 #   DROP TABLE public.customers_types;
       public         heap    gb_user    false            �            1259    57451    customers_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.customers_types_id_seq;
       public          gb_user    false    225            �           0    0    customers_types_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.customers_types_id_seq OWNED BY public.customers_types.id;
          public          gb_user    false    224            �            1259    57376 	   discounts    TABLE     �   CREATE TABLE public.discounts (
    id integer NOT NULL,
    discount_name character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    discount_amount double precision NOT NULL,
    discount_unit_id integer NOT NULL
);
    DROP TABLE public.discounts;
       public         heap    gb_user    false            �            1259    57374    discounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.discounts_id_seq;
       public          gb_user    false    209            �           0    0    discounts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;
          public          gb_user    false    208            �            1259    57514    discounts_units    TABLE     s   CREATE TABLE public.discounts_units (
    id integer NOT NULL,
    discount_unit character varying(50) NOT NULL
);
 #   DROP TABLE public.discounts_units;
       public         heap    gb_user    false            �            1259    57512    discounts_units_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discounts_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.discounts_units_id_seq;
       public          gb_user    false    237            �           0    0    discounts_units_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.discounts_units_id_seq OWNED BY public.discounts_units.id;
          public          gb_user    false    236            �            1259    57424    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    point_id integer NOT NULL,
    text text NOT NULL,
    sent_at timestamp without time zone NOT NULL
);
    DROP TABLE public.messages;
       public         heap    gb_user    false            �            1259    57422    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          gb_user    false    219            �           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          gb_user    false    218            �            1259    57396    orders    TABLE     c  CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    point_id integer NOT NULL,
    service_id integer NOT NULL,
    amount_total double precision NOT NULL,
    created_at timestamp without time zone NOT NULL,
    order_status_id integer NOT NULL,
    order_status_changed_at timestamp without time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    gb_user    false            �            1259    57394    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          gb_user    false    213            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          gb_user    false    212            �            1259    57404    orders_products    TABLE     �   CREATE TABLE public.orders_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_added_at timestamp without time zone NOT NULL
);
 #   DROP TABLE public.orders_products;
       public         heap    gb_user    false            �            1259    57402    orders_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.orders_products_id_seq;
       public          gb_user    false    215            �           0    0    orders_products_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;
          public          gb_user    false    214            �            1259    57524    orders_statuses    TABLE     r   CREATE TABLE public.orders_statuses (
    id integer NOT NULL,
    order_status character varying(20) NOT NULL
);
 #   DROP TABLE public.orders_statuses;
       public         heap    gb_user    false            �            1259    57522    orders_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.orders_statuses_id_seq;
       public          gb_user    false    239            �           0    0    orders_statuses_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.orders_statuses_id_seq OWNED BY public.orders_statuses.id;
          public          gb_user    false    238            �            1259    57348    points    TABLE       CREATE TABLE public.points (
    id integer NOT NULL,
    point_type_id integer NOT NULL,
    point_city character varying(50) NOT NULL,
    point_name character varying(100) NOT NULL,
    point_address character varying(250) NOT NULL,
    staff_id integer NOT NULL
);
    DROP TABLE public.points;
       public         heap    gb_user    false            �            1259    57346    points_id_seq    SEQUENCE     �   CREATE SEQUENCE public.points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.points_id_seq;
       public          gb_user    false    203            �           0    0    points_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;
          public          gb_user    false    202            �            1259    57435    points_products    TABLE     �   CREATE TABLE public.points_products (
    id integer NOT NULL,
    point_id integer NOT NULL,
    product_id integer NOT NULL,
    is_active boolean NOT NULL,
    product_amount double precision NOT NULL
);
 #   DROP TABLE public.points_products;
       public         heap    gb_user    false            �            1259    57433    points_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.points_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.points_products_id_seq;
       public          gb_user    false    221            �           0    0    points_products_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.points_products_id_seq OWNED BY public.points_products.id;
          public          gb_user    false    220            �            1259    57443    points_types    TABLE     �   CREATE TABLE public.points_types (
    id integer NOT NULL,
    point_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
     DROP TABLE public.points_types;
       public         heap    gb_user    false            �            1259    57441    points_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.points_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.points_types_id_seq;
       public          gb_user    false    223            �           0    0    points_types_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.points_types_id_seq OWNED BY public.points_types.id;
          public          gb_user    false    222            �            1259    57366    products    TABLE       CREATE TABLE public.products (
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
    DROP TABLE public.products;
       public         heap    gb_user    false            �            1259    57473    products_categories    TABLE     �   CREATE TABLE public.products_categories (
    id integer NOT NULL,
    product_category character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
 '   DROP TABLE public.products_categories;
       public         heap    gb_user    false            �            1259    57483    products_kinds    TABLE     �   CREATE TABLE public.products_kinds (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_kind character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
 "   DROP TABLE public.products_kinds;
       public         heap    gb_user    false            �            1259    57494    products_types    TABLE     �   CREATE TABLE public.products_types (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    product_kind_id integer NOT NULL,
    product_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
 "   DROP TABLE public.products_types;
       public         heap    gb_user    false            �            1259    114688    points_with_active_products    VIEW     7  CREATE VIEW public.points_with_active_products AS
 SELECT points.id,
    points.point_city,
    points_types.point_type,
    points_products.product_id AS product,
    products_categories.product_category AS category,
    products_kinds.product_kind AS kind,
    products_types.product_type AS type,
    products.product_price AS price,
    points_products.product_amount AS quantity
   FROM ((((((public.points
     JOIN public.points_types ON ((points.point_type_id = points_types.id)))
     JOIN public.points_products ON ((points.id = points_products.product_id)))
     JOIN public.products ON ((points_products.product_id = products.id)))
     JOIN public.products_categories ON ((products_categories.id = products.product_category_id)))
     JOIN public.products_kinds ON ((products_kinds.id = products.product_kind_id)))
     JOIN public.products_types ON ((products_types.id = products.product_type_id)))
  WHERE (points_products.is_active = true)
  ORDER BY points.point_city, points.id, products.product_category_id, products.product_kind_id, products.product_type_id;
 .   DROP VIEW public.points_with_active_products;
       public          gb_user    false    233    203    203    203    207    207    207    207    207    221    221    221    223    223    229    229    231    231    233            �            1259    114693    points_with_products_remains    VIEW     �  CREATE VIEW public.points_with_products_remains AS
 SELECT points_products.point_id AS point,
    ( SELECT points.point_city
           FROM public.points
          WHERE (points.id = points_products.point_id)) AS city,
    points_products.product_id,
    ( SELECT products.product_name
           FROM public.products
          WHERE (products.id = points_products.product_id)) AS product,
    points_products.is_active AS product_state,
    points_products.product_amount
   FROM public.points_products
  WHERE ((points_products.is_active = true) AND (points_products.product_amount <= (10)::double precision))
  ORDER BY points_products.point_id;
 /   DROP VIEW public.points_with_products_remains;
       public          gb_user    false    203    207    207    221    221    221    203    221            �            1259    57471    products_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.products_categories_id_seq;
       public          gb_user    false    229            �           0    0    products_categories_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.products_categories_id_seq OWNED BY public.products_categories.id;
          public          gb_user    false    228            �            1259    57364    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          gb_user    false    207            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          gb_user    false    206            �            1259    57481    products_kinds_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_kinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_kinds_id_seq;
       public          gb_user    false    231            �           0    0    products_kinds_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_kinds_id_seq OWNED BY public.products_kinds.id;
          public          gb_user    false    230            �            1259    57492    products_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_types_id_seq;
       public          gb_user    false    233            �           0    0    products_types_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_types_id_seq OWNED BY public.products_types.id;
          public          gb_user    false    232            �            1259    57504    products_units    TABLE     q   CREATE TABLE public.products_units (
    id integer NOT NULL,
    product_unit character varying(50) NOT NULL
);
 "   DROP TABLE public.products_units;
       public         heap    gb_user    false            �            1259    57502    products_units_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_units_id_seq;
       public          gb_user    false    235            �           0    0    products_units_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_units_id_seq OWNED BY public.products_units.id;
          public          gb_user    false    234            �            1259    57386    services    TABLE     �   CREATE TABLE public.services (
    id integer NOT NULL,
    service_type_id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    service_price double precision NOT NULL,
    is_active boolean NOT NULL
);
    DROP TABLE public.services;
       public         heap    gb_user    false            �            1259    57384    services_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.services_id_seq;
       public          gb_user    false    211            �           0    0    services_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;
          public          gb_user    false    210            �            1259    57463    services_types    TABLE     �   CREATE TABLE public.services_types (
    id integer NOT NULL,
    service_type character varying(50) NOT NULL,
    is_active boolean NOT NULL
);
 "   DROP TABLE public.services_types;
       public         heap    gb_user    false            �            1259    57461    services_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.services_types_id_seq;
       public          gb_user    false    227            �           0    0    services_types_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.services_types_id_seq OWNED BY public.services_types.id;
          public          gb_user    false    226            �            1259    57412    staff    TABLE     �   CREATE TABLE public.staff (
    id integer NOT NULL,
    staff_name character varying(100) NOT NULL,
    staff_code character varying(10) NOT NULL,
    staff_email character varying(50) NOT NULL,
    staff_phone character varying(30) NOT NULL
);
    DROP TABLE public.staff;
       public         heap    gb_user    false            �            1259    57410    staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          gb_user    false    217            �           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          gb_user    false    216            �           2604    57359    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    204    205    205            �           2604    57456    customers_types id    DEFAULT     x   ALTER TABLE ONLY public.customers_types ALTER COLUMN id SET DEFAULT nextval('public.customers_types_id_seq'::regclass);
 A   ALTER TABLE public.customers_types ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    224    225    225            �           2604    57379    discounts id    DEFAULT     l   ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);
 ;   ALTER TABLE public.discounts ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    208    209    209            �           2604    57517    discounts_units id    DEFAULT     x   ALTER TABLE ONLY public.discounts_units ALTER COLUMN id SET DEFAULT nextval('public.discounts_units_id_seq'::regclass);
 A   ALTER TABLE public.discounts_units ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    237    236    237            �           2604    57427    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    219    218    219            �           2604    57399 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    213    212    213            �           2604    57407    orders_products id    DEFAULT     x   ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);
 A   ALTER TABLE public.orders_products ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    215    214    215            �           2604    57527    orders_statuses id    DEFAULT     x   ALTER TABLE ONLY public.orders_statuses ALTER COLUMN id SET DEFAULT nextval('public.orders_statuses_id_seq'::regclass);
 A   ALTER TABLE public.orders_statuses ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    239    238    239            �           2604    57351 	   points id    DEFAULT     f   ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);
 8   ALTER TABLE public.points ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    202    203    203            �           2604    57438    points_products id    DEFAULT     x   ALTER TABLE ONLY public.points_products ALTER COLUMN id SET DEFAULT nextval('public.points_products_id_seq'::regclass);
 A   ALTER TABLE public.points_products ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    220    221    221            �           2604    57446    points_types id    DEFAULT     r   ALTER TABLE ONLY public.points_types ALTER COLUMN id SET DEFAULT nextval('public.points_types_id_seq'::regclass);
 >   ALTER TABLE public.points_types ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    222    223    223            �           2604    57369    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    206    207    207            �           2604    57476    products_categories id    DEFAULT     �   ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);
 E   ALTER TABLE public.products_categories ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    229    228    229            �           2604    57486    products_kinds id    DEFAULT     v   ALTER TABLE ONLY public.products_kinds ALTER COLUMN id SET DEFAULT nextval('public.products_kinds_id_seq'::regclass);
 @   ALTER TABLE public.products_kinds ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    230    231    231            �           2604    57497    products_types id    DEFAULT     v   ALTER TABLE ONLY public.products_types ALTER COLUMN id SET DEFAULT nextval('public.products_types_id_seq'::regclass);
 @   ALTER TABLE public.products_types ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    233    232    233            �           2604    57507    products_units id    DEFAULT     v   ALTER TABLE ONLY public.products_units ALTER COLUMN id SET DEFAULT nextval('public.products_units_id_seq'::regclass);
 @   ALTER TABLE public.products_units ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    235    234    235            �           2604    57389    services id    DEFAULT     j   ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);
 :   ALTER TABLE public.services ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    211    210    211            �           2604    57466    services_types id    DEFAULT     v   ALTER TABLE ONLY public.services_types ALTER COLUMN id SET DEFAULT nextval('public.services_types_id_seq'::regclass);
 @   ALTER TABLE public.services_types ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    226    227    227            �           2604    57415    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    217    216    217            |          0    57356 	   customers 
   TABLE DATA           h   COPY public.customers (id, customer_type_id, customer_name, customer_email, customer_phone) FROM stdin;
    public          gb_user    false    205   ��       �          0    57453    customers_types 
   TABLE DATA           G   COPY public.customers_types (id, customer_type, is_active) FROM stdin;
    public          gb_user    false    225   ��       �          0    57376 	   discounts 
   TABLE DATA           d   COPY public.discounts (id, discount_name, is_active, discount_amount, discount_unit_id) FROM stdin;
    public          gb_user    false    209   ��       �          0    57514    discounts_units 
   TABLE DATA           <   COPY public.discounts_units (id, discount_unit) FROM stdin;
    public          gb_user    false    237    �       �          0    57424    messages 
   TABLE DATA           L   COPY public.messages (id, customer_id, point_id, text, sent_at) FROM stdin;
    public          gb_user    false    219   F�       �          0    57396    orders 
   TABLE DATA           �   COPY public.orders (id, customer_id, point_id, service_id, amount_total, created_at, order_status_id, order_status_changed_at) FROM stdin;
    public          gb_user    false    213   =�       �          0    57404    orders_products 
   TABLE DATA           U   COPY public.orders_products (id, order_id, product_id, product_added_at) FROM stdin;
    public          gb_user    false    215   J�       �          0    57524    orders_statuses 
   TABLE DATA           ;   COPY public.orders_statuses (id, order_status) FROM stdin;
    public          gb_user    false    239   �      z          0    57348    points 
   TABLE DATA           d   COPY public.points (id, point_type_id, point_city, point_name, point_address, staff_id) FROM stdin;
    public          gb_user    false    203   Y      �          0    57435    points_products 
   TABLE DATA           ^   COPY public.points_products (id, point_id, product_id, is_active, product_amount) FROM stdin;
    public          gb_user    false    221   q      �          0    57443    points_types 
   TABLE DATA           A   COPY public.points_types (id, point_type, is_active) FROM stdin;
    public          gb_user    false    223   �      ~          0    57366    products 
   TABLE DATA           �   COPY public.products (id, product_category_id, product_kind_id, product_type_id, product_name, product_unit_id, product_price, discount_id, description) FROM stdin;
    public          gb_user    false    207   �      �          0    57473    products_categories 
   TABLE DATA           N   COPY public.products_categories (id, product_category, is_active) FROM stdin;
    public          gb_user    false    229   �      �          0    57483    products_kinds 
   TABLE DATA           Z   COPY public.products_kinds (id, product_category_id, product_kind, is_active) FROM stdin;
    public          gb_user    false    231   �      �          0    57494    products_types 
   TABLE DATA           k   COPY public.products_types (id, product_category_id, product_kind_id, product_type, is_active) FROM stdin;
    public          gb_user    false    233   �      �          0    57504    products_units 
   TABLE DATA           :   COPY public.products_units (id, product_unit) FROM stdin;
    public          gb_user    false    235   �!      �          0    57386    services 
   TABLE DATA           _   COPY public.services (id, service_type_id, service_name, service_price, is_active) FROM stdin;
    public          gb_user    false    211   K"      �          0    57463    services_types 
   TABLE DATA           E   COPY public.services_types (id, service_type, is_active) FROM stdin;
    public          gb_user    false    227   |#      �          0    57412    staff 
   TABLE DATA           U   COPY public.staff (id, staff_name, staff_code, staff_email, staff_phone) FROM stdin;
    public          gb_user    false    217   �#      �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          gb_user    false    204            �           0    0    customers_types_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.customers_types_id_seq', 1, false);
          public          gb_user    false    224            �           0    0    discounts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.discounts_id_seq', 1, false);
          public          gb_user    false    208            �           0    0    discounts_units_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.discounts_units_id_seq', 1, false);
          public          gb_user    false    236            �           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 1, false);
          public          gb_user    false    218            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          gb_user    false    212            �           0    0    orders_products_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.orders_products_id_seq', 1, false);
          public          gb_user    false    214            �           0    0    orders_statuses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.orders_statuses_id_seq', 1, false);
          public          gb_user    false    238            �           0    0    points_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.points_id_seq', 1, false);
          public          gb_user    false    202            �           0    0    points_products_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.points_products_id_seq', 1, false);
          public          gb_user    false    220            �           0    0    points_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.points_types_id_seq', 1, false);
          public          gb_user    false    222            �           0    0    products_categories_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.products_categories_id_seq', 1, false);
          public          gb_user    false    228            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          gb_user    false    206            �           0    0    products_kinds_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_kinds_id_seq', 1, false);
          public          gb_user    false    230            �           0    0    products_types_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_types_id_seq', 1, false);
          public          gb_user    false    232            �           0    0    products_units_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_units_id_seq', 1, false);
          public          gb_user    false    234            �           0    0    services_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.services_id_seq', 1, false);
          public          gb_user    false    210            �           0    0    services_types_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.services_types_id_seq', 1, false);
          public          gb_user    false    226            �           0    0    staff_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.staff_id_seq', 1, false);
          public          gb_user    false    216            �           2606    57363 '   customers customers_customert_email_key 
   CONSTRAINT     l   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customert_email_key UNIQUE (customer_email);
 Q   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_customert_email_key;
       public            gb_user    false    205            �           2606    57361    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            gb_user    false    205            �           2606    57460 1   customers_types customers_types_customer_type_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.customers_types
    ADD CONSTRAINT customers_types_customer_type_key UNIQUE (customer_type);
 [   ALTER TABLE ONLY public.customers_types DROP CONSTRAINT customers_types_customer_type_key;
       public            gb_user    false    225            �           2606    57458 $   customers_types customers_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.customers_types
    ADD CONSTRAINT customers_types_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.customers_types DROP CONSTRAINT customers_types_pkey;
       public            gb_user    false    225            �           2606    57383 %   discounts discounts_discount_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_discount_name_key UNIQUE (discount_name);
 O   ALTER TABLE ONLY public.discounts DROP CONSTRAINT discounts_discount_name_key;
       public            gb_user    false    209            �           2606    57381    discounts discounts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.discounts DROP CONSTRAINT discounts_pkey;
       public            gb_user    false    209            �           2606    57521 1   discounts_units discounts_units_discount_unit_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.discounts_units
    ADD CONSTRAINT discounts_units_discount_unit_key UNIQUE (discount_unit);
 [   ALTER TABLE ONLY public.discounts_units DROP CONSTRAINT discounts_units_discount_unit_key;
       public            gb_user    false    237            �           2606    57519 $   discounts_units discounts_units_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.discounts_units
    ADD CONSTRAINT discounts_units_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.discounts_units DROP CONSTRAINT discounts_units_pkey;
       public            gb_user    false    237            �           2606    57432    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            gb_user    false    219            �           2606    57401    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            gb_user    false    213            �           2606    57409 $   orders_products orders_products_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_pkey;
       public            gb_user    false    215            �           2606    57531 0   orders_statuses orders_statuses_order_status_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.orders_statuses
    ADD CONSTRAINT orders_statuses_order_status_key UNIQUE (order_status);
 Z   ALTER TABLE ONLY public.orders_statuses DROP CONSTRAINT orders_statuses_order_status_key;
       public            gb_user    false    239            �           2606    57529 $   orders_statuses orders_statuses_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.orders_statuses
    ADD CONSTRAINT orders_statuses_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.orders_statuses DROP CONSTRAINT orders_statuses_pkey;
       public            gb_user    false    239            �           2606    57353    points points_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.points DROP CONSTRAINT points_pkey;
       public            gb_user    false    203            �           2606    57440 $   points_products points_products_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.points_products DROP CONSTRAINT points_products_pkey;
       public            gb_user    false    221            �           2606    57448    points_types points_types_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.points_types
    ADD CONSTRAINT points_types_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.points_types DROP CONSTRAINT points_types_pkey;
       public            gb_user    false    223            �           2606    57450 (   points_types points_types_point_type_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.points_types
    ADD CONSTRAINT points_types_point_type_key UNIQUE (point_type);
 R   ALTER TABLE ONLY public.points_types DROP CONSTRAINT points_types_point_type_key;
       public            gb_user    false    223            �           2606    57478 ,   products_categories products_categories_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_pkey;
       public            gb_user    false    229            �           2606    57480 <   products_categories products_categories_product_category_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_category_key UNIQUE (product_category);
 f   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_product_category_key;
       public            gb_user    false    229            �           2606    57488 "   products_kinds products_kinds_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_kinds DROP CONSTRAINT products_kinds_pkey;
       public            gb_user    false    231            �           2606    57490 .   products_kinds products_kinds_product_kind_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_product_kind_key UNIQUE (product_kind);
 X   ALTER TABLE ONLY public.products_kinds DROP CONSTRAINT products_kinds_product_kind_key;
       public            gb_user    false    231            �           2606    57371    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            gb_user    false    207            �           2606    57373 "   products products_product_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_key UNIQUE (product_name);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_name_key;
       public            gb_user    false    207            �           2606    57499 "   products_types products_types_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_types DROP CONSTRAINT products_types_pkey;
       public            gb_user    false    233            �           2606    57501 .   products_types products_types_product_type_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_type_key UNIQUE (product_type);
 X   ALTER TABLE ONLY public.products_types DROP CONSTRAINT products_types_product_type_key;
       public            gb_user    false    233            �           2606    57509 "   products_units products_units_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_units
    ADD CONSTRAINT products_units_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_units DROP CONSTRAINT products_units_pkey;
       public            gb_user    false    235            �           2606    57511 .   products_units products_units_product_unit_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.products_units
    ADD CONSTRAINT products_units_product_unit_key UNIQUE (product_unit);
 X   ALTER TABLE ONLY public.products_units DROP CONSTRAINT products_units_product_unit_key;
       public            gb_user    false    235            �           2606    57391    services services_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            gb_user    false    211            �           2606    57393 "   services services_service_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_name_key UNIQUE (service_name);
 L   ALTER TABLE ONLY public.services DROP CONSTRAINT services_service_name_key;
       public            gb_user    false    211            �           2606    57468 "   services_types services_types_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.services_types
    ADD CONSTRAINT services_types_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.services_types DROP CONSTRAINT services_types_pkey;
       public            gb_user    false    227            �           2606    57470 .   services_types services_types_service_type_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.services_types
    ADD CONSTRAINT services_types_service_type_key UNIQUE (service_type);
 X   ALTER TABLE ONLY public.services_types DROP CONSTRAINT services_types_service_type_key;
       public            gb_user    false    227            �           2606    57417    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            gb_user    false    217            �           2606    57419    staff staff_staff_code_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_staff_code_key UNIQUE (staff_code);
 D   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_staff_code_key;
       public            gb_user    false    217            �           2606    57421    staff staff_staff_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_staff_email_key UNIQUE (staff_email);
 E   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_staff_email_key;
       public            gb_user    false    217            �           2606    106501 '   customers customers_customer_type_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_type_id_fk FOREIGN KEY (customer_type_id) REFERENCES public.customers_types(id);
 Q   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_customer_type_id_fk;
       public          gb_user    false    205    3014    225            �           2606    106526 '   discounts discounts_discount_unit_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_discount_unit_id_fk FOREIGN KEY (discount_unit_id) REFERENCES public.discounts_units(id);
 Q   ALTER TABLE ONLY public.discounts DROP CONSTRAINT discounts_discount_unit_id_fk;
       public          gb_user    false    237    209    3038            �           2606    106596     messages messages_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_customer_id_fk;
       public          gb_user    false    219    205    2980            �           2606    106607    messages messages_point_id_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);
 G   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_point_id_fk;
       public          gb_user    false    203    219    2976            �           2606    106556    orders orders_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fk;
       public          gb_user    false    213    2980    205            �           2606    106571     orders orders_order_status_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_id_fk FOREIGN KEY (order_status_id) REFERENCES public.orders_statuses(id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_order_status_id_fk;
       public          gb_user    false    213    3042    239            �           2606    106561    orders orders_point_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_point_id_fk;
       public          gb_user    false    213    2976    203            �           2606    106612 +   orders_products orders_products_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);
 U   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_order_id_fk;
       public          gb_user    false    213    2994    215            �           2606    106617 -   orders_products orders_products_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 W   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_product_id_fk;
       public          gb_user    false    2982    207    215            �           2606    106566    orders orders_service_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_service_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id);
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_service_id_fk;
       public          gb_user    false    2990    211    213            �           2606    106496    points points_point_type_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_point_type_id_fk FOREIGN KEY (point_type_id) REFERENCES public.points_types(id);
 H   ALTER TABLE ONLY public.points DROP CONSTRAINT points_point_type_id_fk;
       public          gb_user    false    3008    203    223            �           2606    106586 +   points_products points_products_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_point_id_fk FOREIGN KEY (point_id) REFERENCES public.points(id);
 U   ALTER TABLE ONLY public.points_products DROP CONSTRAINT points_products_point_id_fk;
       public          gb_user    false    2976    203    221            �           2606    106591 -   points_products points_products_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.points_products
    ADD CONSTRAINT points_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 W   ALTER TABLE ONLY public.points_products DROP CONSTRAINT points_products_product_id_fk;
       public          gb_user    false    207    221    2982            �           2606    106551     products products_discount_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_discount_id_fk FOREIGN KEY (discount_id) REFERENCES public.discounts(id);
 J   ALTER TABLE ONLY public.products DROP CONSTRAINT products_discount_id_fk;
       public          gb_user    false    2988    209    207            �           2606    106506 4   products_kinds products_kinds_product_category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_kinds
    ADD CONSTRAINT products_kinds_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);
 ^   ALTER TABLE ONLY public.products_kinds DROP CONSTRAINT products_kinds_product_category_id_fk;
       public          gb_user    false    231    3020    229            �           2606    106531 (   products products_product_category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);
 R   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_category_id_fk;
       public          gb_user    false    207    3020    229            �           2606    106536 $   products products_product_kind_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_kind_id_fk FOREIGN KEY (product_kind_id) REFERENCES public.products_kinds(id);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_kind_id_fk;
       public          gb_user    false    231    3024    207            �           2606    106541 $   products products_product_type_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fk FOREIGN KEY (product_type_id) REFERENCES public.products_types(id);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_type_id_fk;
       public          gb_user    false    233    207    3028            �           2606    106546 $   products products_product_unit_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_unit_id_fk FOREIGN KEY (product_unit_id) REFERENCES public.products_units(id);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_unit_id_fk;
       public          gb_user    false    207    235    3032            �           2606    106511 4   products_types products_types_product_category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.products_categories(id);
 ^   ALTER TABLE ONLY public.products_types DROP CONSTRAINT products_types_product_category_id_fk;
       public          gb_user    false    229    233    3020            �           2606    106516 0   products_types products_types_product_kind_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_product_kind_id_fk FOREIGN KEY (product_kind_id) REFERENCES public.products_kinds(id);
 Z   ALTER TABLE ONLY public.products_types DROP CONSTRAINT products_types_product_kind_id_fk;
       public          gb_user    false    233    231    3024            �           2606    106521 $   services services_service_type_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_type_id_fk FOREIGN KEY (service_type_id) REFERENCES public.services_types(id);
 N   ALTER TABLE ONLY public.services DROP CONSTRAINT services_service_type_id_fk;
       public          gb_user    false    3016    211    227            |   �  x�mXMw�8<����u�#@ oq�|l2�x���;��""aL�����O5(˒2?��&��U�`I�\g�}fxL~������b��۵���+??&Z�7��,�4)Ox���mwٵL׎~H|X9��0��d�ن���'?��u��$,�L�q��XZ��/�������u61��s6}1��[�����=BE]�BTy%�LEo�>������|^��y,:�7�ݙ���kDr-r�T^r!R�������7�9�����ٳi�>�λВ��j�s.y�*��%j��m��4%��aB�V�Ǔ�Ƃ5�z�U�ʥ���Ʊ���Z���ێs��I.�F�k���M��.��&{gC�%&��~�:��Ui�FEd.k)ӆ�b���ɓ��-�Q�vv�!Զ3B��ySW9k�HY��߭Ϯ�(Ƙ�>n(�lW�S�I.�M����d��gv(`v���vL:�`�ߗ�b.�j�d�B�BG=��G��M���#�a,��?���8)��RT)���go���f=������d��J48� s���ٽ�{�4Y��<�i�<�N0m����a�L�D��vf��9;�6���m��L�0,��.=T k��JȹB7|�i~x0�MZ�T��Ex^h�����H����L�Cq>��G�L1���8�ݼ}`�Sr!4�ɤʵ�2e����3Nʾ�u�G�h�0�$�9%+�N�U�@�� ����t?;(*�&���@�r������}�,�y��چ��(�x�)TT�M�	4���ێ�c��U���]T��#A�#�W`+���P�q	���s�G��ܗ2��$��+D��O6t;��gtG7��WZ�T.+�S.p���0�ٍ:����͓B�y����N9!�ƀ�+C��v.:���/x�k�D/�����Ơ���l��d�-F7��,qF�Z���ב��&��[=�Ɂ�
מNn��y^q\M����c���X�l�	m�R����F5S���&��;M#�8�d�)<()M��t^
�ӊpsg��v�V�-�S-5� ��C�"��F���9C4X��л	Y�#��/,ȵ?��Z�Pr#�:�H����L�ep�͔L���6�#̪����tZr>��ߠFSy� {PcNx�A�4�WidJȹB+���47�9� e��$}���iEH��h�� J���C��0?+ㅮ$EB��P)Rkfh�8%��-Nt&BH7�nHLW"S�Н��d��'�N2�a��y��=1
Q�j�^j���L+��/v�����ѣH��:��uΑ�P�I+��Kb�	��b&�q�e���`���"�A�DI3c��]�Lg����K+9R�DD��sě����A�^�E�`�'R,u*6��y�1��(*��v�9��+�H�����δ����Y�5��S�<�צD��	�+](�Q�Gv��삽(v�l���5�נ*��LH���L���!׺,A�u����.CO'�����~!�EiP�Y�k$U�w X 6�}��3�ӊ_鼩*���ng����#��P]<�n��f:�UBwX���Um���ή!���Œ����!��j"j�Vɒ܀ 7��GA��R�E�*�'L�M�DP�<�nڐE�^r��|��%`i���c�%��d�>��������@���#�k��U�NeG���P���c�GXh{J�Q@i�b�	�쿓Yf'������N��F�-	 �g�_���#��
/��8��BÌx��i�S�h�l���臿@s��O�6��N
 s]6���ۍ�ɮ�N�,lx�_	;K��6�|7��!��:2C�w�+G��݁4ck�Mՙ9�k0�*a�`n$��Ug�c���e��cK�83��np.ԩ2b�\�s��}���+�?'W�4:U���ߛ'��ə�y������*�2U��nDa>`qT4�g���ȂH���L�5F�<��I�P�,2L����Kr~Tf8j%bq���]~��K�n��j,��[�w��D�Q�����<�0ҿ�a���"���[ �J�V�ӥ*z0hssM<���ah��48�����fi0�I�mxK��">��g���ٝx 猚�r�rm1Iƭ�ґ���_�g�`����|��'�c�Q�m#�vC�$l�����ݡ�U4�w�ET��ݚ��f��4
w~$ז�n>����]�	�`��Y4�agz0��������"��� $JB,tM����*�F����O�j���5f���>uh!Ҵ���z����hc �0�H���Fڭ&O�l?y��-��q�<�b��� �Pjb��Q�G[G1��*�z���X5tG���8_E�ݸ�����"^�A:;�:8��+Ӛ��;��ٷ�4!	mŌ�/*r�t���\)�m�F��_�Th�Ȝ#:����H@ܼ ?�u�D�B��Jf����o.�=o�rR�T��n;�ŗ��|qp�u0O�5�o*��A� L�j���d/� �'��h�:��6�`�ڗE�y�0G��?�8�3G���K��2�d���W�˹
����؏�����(�*Մ����MZ|&���C_ѦV�+I�.���"w0��;�����+�A^S�T�/��t�}߸�n,�ϲl(<]D���b�و&�hf�s�˷?Y��[!ʜa�JuD-Mpv7���>�I��{2`Z�����~�Z`hV!����%-�r�O쉂
�
1���{�L]��39��X'nx����Q�$P��@&��r��${Y!}8Z���^2`����G��2�/E>{Ca�\����u�6��w�/���e�'�bt}8Gı�6s�nl�����m-R[S+z�":���!�{G&�t�lQ�]��:T����EM���	�Ө���c�G,O2_����n1���N�:>�����}����Qn��Hh:�VJ��!���v��|������<͉bU���CEj�R��SP�X���SՊ�[��SR��$�|������Q��!3]�Cb� ����4M�z)ɗ      �   4   x�3�,J-I���L�2�,���I-N�I�9�ssrt�K�38K�b���� L`      �   $  x�=�Kn�0D��)x����|�}7� @��0��$C�r�R�mg�ʁ����*���� C7��k�R$܍���T{�f��2��� 
{p�>��G�a�ԷPأּHy����$/�a=�r�h�6k�4W]HM9��}���)��)E��PD�7�m�tk8R@˪*���w�Ee<���Ex�����<��v-칅v-�Al*���X�Ԍ���ë��-<� �k�W�V4s��ћF��+��$�Z�{O�? �5R;�k_`1��؎��n�m�M�K�m������e}      �   6   x�3�,N��2�,.-.H�K�,.N�2��/J��QH��+NM.I-)M-����� \��      �   �  x��Xˎܶ\S_��DQRK�	d���Ž���H��,���S��m�Ǎ���<�T[0Y�B��qJ���X�7͕���{�?l��q��_o|���y!��)��w��"+XY��ꁏzIw?�������g�ͫ��ןg����͜����tU�UMvg�d"g�q�g.�㨦~�V���l����{n���l��5�~�c�mV(f����yQt��D��L"ߊ}�㨑�Ezܙ�7��wzZ�囱޾��Y�	[��Wo쑶��w򞉆IIM��؆��j��Cx<��7�򜗙�m�y����Lk.d'ڮ�2$Y�L�ٺlNq�͍+�I�7�\
��=G�H��T4<�P02�Pq͊��0*k�Z��JUo��v�͂&p��t\q� k\�l�3GK��2+K&K���<�g��9Z��������ߴ�T��ZQ,6o�.�������b��ݪ �_(؉�;���+��l8*F��@/�	��)��g������o�@LR!͹�,�U��(	���O&Y�^�,���&�-[o{0��=���ť8�w� �P��/�)a0�8�s:-�!7X��$D
ˢ5��7��B�1"�q�N94�#)$y-y�w��ˬ��l�>��}�a���u#��q��^�/��|b�N�jvohV\)�W�J��P�����\֎�m�G��+�ɇb�߼���#�ޔ[(ت�.4�N����_��0sB�Њ�M
�����@�D�8�|&�Rv#2��́q܄��p�vpyE	�`@k2Z7B�����8�#�"��
��0x�r�"N_��Ea���=�%�0B6z�jޙ���t�pB*�
�z3��P~�<�[ʮ,2Q��XW���oEB�Y��oh�eZ�E�ߕM|�>m�� �����2�q��`N�ʊA�08��V�e��e��%��.!�YU��ɢ�"s�Z?]���v���D��%��dIm
L?��'�ī�$ŹE��F���9+,r�'W�1aIZ�O�3�%�ƣ�[�J1G�%���<� 
�d&jBP��{$�;w@ݐ]�f��|�%��5C�e�Tۀ���x0}��2�:9@��w@_sr82(�ӕ@�9����4)>���H�����	�Ӵ�;E=�d�E��Y%gf8���4��(膅��9��� ��zA�T#6��"�z˨[O�q[Q�I2o�z�A�O
��X����E��_A��:4ؓ�Qy�r;�����4�|G��>L	WsD�Y��}dzdV��m�E#��<��A�>(݃��a�v*��"^��>�d�>{Z�\��N�A��:+J�B�ٿ
��ʰ�m���"~AF Z��%T0����4��ʜ|DqgM���V����2x�@�%Z�0س����؏hKo�dC�W����,�kV32Y�|B�<���NWG�EC�S�wurЛ
�������Ć��`��aP�]�>�o@��`w�t` �K�u��n?�~�"��"�T�����h�eyM#�܄�YG��T�$2����X#��-s�8`��������J1�.CĒ�ۉ�pmqX�ʟ}kB�5�G@�����bw-In�&���w4]�
�\ރs�	�Xͯ�v:���a��4�������9���n��cR�<1SC�ѰJ@w�p�b�'*���E��j��p���e'� �[V�ض��Җ@���*mwnv�K�:*��؋f���g�S���q�"xTI��ϼ�a��83���yO���ᮛv��� :��Lq�o��)�lX���Mg��o���t��ӕ��l(���
>+�D=f��܎�o��
?�����б����J�u3��<
Fy�70op8PK��na�`�����T$�?��%zK8N�պc���2��s��"���<+�_R�y�O�͔����R�`qK�t<���^Hn��$��Ю��ql2�'
y�&겄��}�s?��!~^9.z<<����2�t���(���#�:��K�e !��      �   �  x�eXۑ�8�����%@��X.�8����\�|y�ţi����K�%��v����#�O�j��G�5~��g���S��5�2^�rϿw��?�?m]������c�����]~���M���v=fOu��|�����X��Ƀ���xIy@��k�O�Gk83�_k�n^bs��ޗ�G`'���X��
�GF�'�l��s��Y���+�#�c�z|�q��:��nm�;�S�߯r��T?�Xm��k���ҴzK��x���_���3׵P��m��3%s1XiO���ᰣ�^go��Ѳ��=�<X[e%�ɈD�S��\Qw�k�q�^�>�d�kO�x����RR�,{���տ��(�6xT���z ѩ�p���fʃn@�i���>��RʵF���m����2V)>��xk��)�8Y�\����X-�ꄝY
���Y�Ȍg| _ҢP��]g������73j����Ø�� _@
���Je��`=��/�� A��8ъh�~�X7���O	9G���#���ݭ�J�\��{��Հ�-'��<�k�� ���;������*2�G�h�\&�<�2cY|�H��w�ߢ�-x��{N�Ӷ��
�NYb!<����2�'tf��k�7Ay��� ��9��Fp��LH�2q�s;�$�����Z���26��3�N��Tu���#4`�/=�G
�;�3�����I=1�E|=�� 8��(*�F� +���Pb� �ݼX�`��V�W�hwC���>��FY�ў��sݖ��$Vd��zuz\��jM_�����O�l���b(�1`$̖�6s^bnrDtws	��+ةu�}e[�	}��u��LZM!�J ~K��ך��G���Q�]z�5򃁊"����� \1<��Nܰ�7~��G ��ؚ�r��e�V��`4�����`@(?:J���Y�	w�Kz�+ �I��L� �c$o�U�&�O_1a�^^I�,��ߓcb����P���n�U����8�Y��A�mAZ�q������U�-���!�Ҩ�
K�W��H�$2Yf!�g�2�u�Я`zT���r��J�v'���+mӗ�c�1�jh	%sj�'���D�;� F��I#���K5b.W�V Ă����[N4��~�l��6;��¿D[=�Ѻ26kB�P��qΦ��z�E"�j`�#_ x��z�ܞT��l�u�=,��Y�	�1�uݽg	�	;Asj��@��_"���53B�p+[����zt<ȋJ���c�2�����k7�.i�˺���!sR�\'n L���_����`���\)��c�`lNe.���#go9'CfN���Z(���F �$E@�B�i���d��h�]�BΖ��R;�O	�V[!�v�1l�����Z�Y2��8�"S9[Y�a����OT_���i�)�}
��Qs��<j\�x�EyDK�=���p,w\�$-P��U�^3F����5�a�2sLZ�R��Ēn7Tj�����4���$�ZA��H���hzk�A�H?�>)�聎�EaA��s�'F��,�\�M����wל�-�(W�L �K��f�1穠�+�^�w-�ldXNl�P'}�< oVϠ���@����0��^H���u�Q$+��,KP�!���N���}W�(!=�������g~�T^ W��}~[��>��1z�%J_.�L��
�G|�ۈG���[!sF ��㊎�@}\�D�`�#yo��\��\���a�a��ǽM�69dP��o�O���Z��,�5ڻq��e޲�ݎ��V02DbI�]�*�ܔn�%�~6�)�N[�q� fl�M�!��g��6ه��̐s#�}gĖ9�%��	\�Ң�מ�h�	�8rJ�\��S�
�*�`L�p[�6�y���qJ\�UwծP�d����2�㖇�-�A�.�=J$6R
�u"�ම��1U��I�\)��t^쵐�ysc+B����S!N7��<�ס�)z����2�}�k�}�G���똉�>�̵��ӭ�'�Y���s���T������=�}A9����ыz�O١�� ��]�6���=��4���4P��%t�G��|������{�k�+�J|v��b!VSR�A�-�Ν� PF|�)���wWG�A�A��cAK���+���-m
�u�ʝ#��U*��}u�Tܪ3�O��E�qd��#d&�ub��럔!��>��؀[9u���@v\J�^k�C��r ��w	��x��͸���������k__�k-v�|T������߻��a>"�      �   �  x�eX۱,)��(&���yӱl�q�$�=m�V��P�~H��ҩi�TK�?V���������k�=5�]��V[n�T���ol<�<���Jg�g���S�3z��4ƻo}���g�<�i��V>e?�<v�J{��B,8p=e�Z���U�y����P?7�Sj��FI����z:r�,YM�~��>�>eg��4�$�}����Z�3ll��d;�:��]���Xy�e:Ҩ���z���m��ֻf����i+�b�"
�fԧ�TT��Yo"]D�%�I=f�Y�޹���{�nq�>h��"�N��ۈ���э��+�_�j��d�]쌧��3o�r�<�:���AP��`g�չ�T��߀&3������q\����+���©
)W��'{O5���3���$��'�̆��ڀU�xp!~�<��w�aeq���_�{q>�c{�%5W���w񵍴FZ�>�Ha�P���@@mk��V��0��f!��8TW�dd��ǫ� ��H�^���<�X;�d�n���Y��  9Ы��φc[
��A��/wU�:�,:Z]G����),�e4��>�֧/�α��@�
�ۈg�P;�úgtx�Br�Qak�О���Tl�bh�D�
$�����hl2I`��V���"�/v��z	�l�ϐ�8�@)�4m�A�qm� P��N%����Ǧ�7B�Ɔ����'ی�q�	�$;�4��Kv��2*%��|�䏠>)rܱ�<`��&�����VR�hq +�t{t�9'��#B�����;-���.�$ܡ�<�0X��8�rdti!�Y��I�y�W��ĜX���r�R���پ�r�Pis��yX��Ԟ'��7q��7�ܶ�B]��v�U�Ĵ揭"��r���M�_�<��k��D<fy�����y��a
���I��d�`��x��d�=Y��=���paZV�֦���C\o�D,d?�1ࣻ�����n�p3Ht��Y�E�ǂ��U��W-�(����o�� B��MF�ĉ"x����Tz<�K�0N!���f����Ac���Mū2*�;��Ra��
�P���a��T00�eXp1�������M����n���n�qƻhM��b$��E���R9S���d�+��aB��Px,v�"�Em�ܸ�N�O�)�V'G��U�q��"�]ےC�tmV���K�S�h#�a�}��7���L^�+�d1pW\5Ƽ�/�����;��=�CG�`)F��n��l�StAs��Pb��.7�U�1$z��o����P`�䝺�(�Ƅ6���6��b>+!6X�1�ê�~��*ں7�xMO�k�0���P�h9o	��ү�{'�F8���F|- �N���	C�B��yE=���q�\�(X��su���t�`DHc������8j|�����<�	��&���q�k�抐j�����X�BS���xz�0�*(�{F�;���D68�</ECz�+��i��'��8f��`���/�.3��e{`�	�hx:�ȠH������2���/�A�#�XswG�*}Vu��%|W��*֥S3���[����z�y�����1�euJ��[�pc�l�*$oU��A��]t"6.{��*F��0��:c�J$V���^{4��H��T�*�}�����d�dz]F5�,P��4�q�L�M�����/
Cf��D��0�T��aU��{���_x6m�����W�[��Y)<�T��.4�g�p����p����>��3h��ѩ	ۭ.9�ͧ�]���{�hczA�G�����#�K`�
��Θ���T���i�G���|u�����Հ����g!_�xM�j����lE/M�f���򊃨�@Wx�1�Z��FOn_OXWX*4��x�0q�{gE�^�j��?|`r��ҭ��
ZeA�v�7Mס�W��l���kۯ��l�{��]q���+����=VY� p�����w!f���z�/n���+�W�!/�D���Lvx;6@��$ ���s,�s+���1���8[�ȣhQ�7$�=����Ì&����MeK$�>���'��TJ>�v�f��r�;�PJ�����j�Bҋ��}6䔣B��b��.����->���F�h.����Jed����s� ��x      �   h   x�=�I1��W�H��.�ӠH�3r$~?������b�H�̃��Q��}�F�S��?g��j��Y��՗�G��������S��8��ٔ��/v(s      z     x�m�[o�6���_A��� J�.�^�)�8Y7�h�Z�ڄ)��Kz���N�,�8Μs�s���E��Q�g�j�ab��`��X�a$M�fm)Jv[�大%�>7�?ɭ��X�f�^o���~*��o�h\ζ>'-�HI�H-�A��A�+�/_�s�u"kE+�g�z�IIkl����i������ʱ%>�؝	�(�2sj�m�9/ؓ�o��A�?h5������4�9�G6�ל}11��7����-�t(p�G	��j�+�%{D+�3J���Z�M���`�XH�{�b��a/�7,���`٣�ϒma��">Ӊ:k��
��ȑT�C_w��ݑ,�<�	�(���]�լ�$��}�,���*�= [���4q_go�p�ƥ���^�}�Xw?��v�~�꺬���m0E
R��HC9�g�R�����]�{|��кa��3[�9�۾a�=�sd=�W�m�;�v���dF�Ϻ+2���		�`��#p�Z�]ʒ�ځ5י��W�Ξ������X�l�7o�����M۱�A�3��)^P.�O�g3؝�VN] �@����Z ��ה7(�6�fI{ı{U^�ũh:�[W�)�8� �FԞ���ș|�l-��W�C�����w��fu�G��5��J+�Z�V������>ky����E�V�{ꥎ�?0�+~��%�u���>r*l��P{�?���q��V�^����+����Ŷq5ZZr,�G�2n���h��bT'��V���&�z.
\ݛ���e�̈́�o`tF�r���}&�&$ŉnA�
�8��m?`���EVw�8��'�*ZF¶��I�(n'��<�&*����.d�ɍ�=�}��f�!�)��+*�K8�z$��e��g��ʣ��N���Q_]��	�U8`$�M9�X�S�ǫ��Z�������.�c\��/��Y/߿�wEǞ��߆��1_�;Zp����A�x�?/��m�|�UE�x�6��x�S>1�󲈢)c.y����SJ�4I�      �     x�=�I�%9C��a�DͺK��q��m2?C�	!�r�>埒c�(픱�_�vb�v˔�Z�r�Hwc��e�X�̲��y���;m��J���]d�VN�шl-{�p�K#wU�ߴ)Ǎ��(K����]����#�>#��"o!�U
*nYz��9k��3�k;�C#�0o(�,.���\�;��H�Jw㕘d/{��\�e����'�Qֲբ7U|�k���ۿn;��F�*�׊�\��D8ܪfʳ�� ���U6�]&��f}�������!�)Gg�-�Mn�݂;�������*��sk���g:g|��I&*$��?(X���L�S}̩���|�����nf�T���G�)f�S�J��ƪ*�h��w�J3 ���������R���P)��g&Yp8.����$�V�*t�X�J�ڝ����_�;��q��42Sf�|b�R 8·�pV	�?�/�NC��Z<%��' "\��)E=r�Tq�F�;�ı���3+�K�)�8[��&�����.j����)��K:��m��9�H �<T 3K��X����g!G�.�aP��vJ�'� *��w^bA~u��� ���cN�֩!5Z�ܼ���u�|�f=^U9�����'K@G�4#�YU�����w�n�B$���T�ZŹ*=�zk#��B6��O��}�[WXN:���ʙ2g1q�M��-P��9jQ�Eb��ݲt�;�
U�u*�K�6tJ�����"[k=�-��Ұ��^�h�J��T�XM�)�ʑJ�\!)�o����>V6;���0�d�B�y@Ś��T�-
�@�pP�L��E���p��l��6�=��a]��G?�2��XS�-X����/�	�9����1�T���\9��"���u�
�'��^Rhw[�~w���:�R�>N4�.�FIz�b8֞�pm���C�\U x�q<(�K���:��]�{ZUC��������A��ǂ�G�w�s��ȭ��%�.�鐆����el0/B���#Fi��ٞ.f�Џ�u��&��k�J�H#�5�,�i��W��_ħ}������nk����9��!%��i�p_�s��}��Oya(E��@��vh��g����%�Ҭ��m#@����0�=[Ə��l�O���~l����t��<�i�뙥n�O �ۭ�p>�� �������X�z��*Zl���o�Ի�����6h�i���[�)��*�B�h{�<Ǫ���n,�c�w�+�����N3��	���������VL˚���⻷�i�"
�Y���Q�٬蚣y=�����EĿ͵�}      �       x�3�,J-I���,�2�,.�O��b���� f\�      ~   �  x��Yَ��|���� ��}<
�
2��/�n�,6��1����U$g�ڀ��G7++32"2��Ԥ�)̼��H�6Ư��e�nn��q��~&w���>�����s_��tֵw�<���c���_�k3�۾�~�_�uܘ�2ݣ�"�����y�on^>�~�{]���޹u�l��Z�f�_��M��{o�&qӘ���n^���ѽN���{v˶/C?�o�i���M�zC �-�k̸���u�2.���Ǟ��Qn����X>}n�nۖ�We������u+��q�pS��F�8v����a�������E�ϨӄG��+��eʯ�n�8��̻�ğd�b��nE��jkD��K�Y���&ML���Y�}�:��}�f���o���g."׽�4�����1����%d[�E���L���,Dw	���q^,�g*��ܻ����۲?"���%��1�s�U����G���&�n�e쐞-�s�,���_��%q� ��7׍��{��Ȳ0+L�r� \y�rF��zn;o�`p�.3R�֏6�&�P�P����4�+��ڽ�@��˼�7�����o:��� xH�b�S?��d���91�7� ��y�?1>$�]%YE�"����>>���-���e�%��[D'
�;5�����]���_|�6-CSj��Lw ��0����f��9$�pO4k	��h䢿w�?Y�%e^��vP��^ZS�����H�>N�r��Mk�i����C<u7�{t�{t×�L���I�~�_h���㏓l��$:�oY��]�o݃������Nz�)����f��q4����[n��.�I���7�6l]I���5}��i7��������yE��H��Hӵ�U>�aC���_��B�� �u�݇���w�e�i����{�gl��5�@��""&A�*/1�%tp�M��)������Z��F�2n)R�W%I�3l�3X�a:E�Rn$�$@�Da�Ţ���,�HD/5
u�;\�e���Efn�%;>����� !��@]��I�2ֳ(�`O+��)�i� D44�<B�逈��\�m@\�H��ep�=N�g�J�.5'����"䠍[b7@��.9������"���*���w���F�4@_)$��N��F�#��f��\���L*�Z��2t��\�d,b��Ӽ��F��=U-�����AD�<��"�{�i�6�?P���\���ikN4��7�w#pv���#"a��{§��Ҷ����]�lp{��­g�E��=�-���E����c�)m���^M�.؊O ����B��ԂE32m^J�	oҼ�qF��nn�dI����2JY�}����
��� �rɳ�=��.̫��asv� Z������fR��4�?�S�
� qO�s�,6����V}Y�1��A��
����u��^)����b��D�ә�<�2��J<��H��y�a]��:����b�\c�ž{Q���@e<��S�ʩH��:���aMp�����"�rf��袕�|5��PcN�,�G U�Op P����Sʂ2r_4H����I[���i��7��8���J�
��mP0�
.�v�7<�c�E��2ab�oxd�
�'F���y~����]�d�Bİ4_�]E<=y�20)W}�ϳE��
taR� �o�⥦�{ޢ�B��������H�����j� >o�^ǴR����*⭭&����'�q�#D�g�һH��C��2�	�

}���#|[��os�I�2%9�xF�D��.ä�xF�
�Ж`����"&@��÷�wVՖ�[y�*@J���2��!:���!3ᶜ�FR�/�4�f��S�cU�	"�Q%����x�ߙ���l�$'蛂EI�h����=�4�;Շ(t��n�7���M��y��h����o��@�S��,���7�d�R�A]��1���:��]Vj�`ӾXF���+b���o��Ņ�ڒ�Ѱg�P��RBu.@�3��� �Fu���e��,�w0ybG�8z���_Gn�ܘ��t�ca�ƶ2��V� �|e�����I����S��~���©����h�ܗ�l�@��w�v ]d�ԏ��*Ĭ����*��I�\-���U������� ر�˂3���h�r�;ml��L��R�uv�U��ՠ31��6�(����((�y�|iN�xf�6/BY;�(��7�&5H�8ˎm��<�۳;��@�%������V�rr}QC����#M����j��IM��t �B�-��HV��۟�Ғs<�d�h0�R3��"��-�z��ǽ�/�4����X��˻\�}���	i��m<���NԼ�n���u3����ǣ� @��d����_WE��Ya[�*�wr%��@ҜFc��L\�	��3�66���/� A�hRp�t
�#q�^+�`đ�N�u��,M�J��������B@!�.�0��{Ò��U�>���r�]�jpC/�&�E
�+k�V�\t,�.r�T�Z&|�B��V^��-�pH}0��q����&���k�G5\�6���P�_��ʼ{�>IX�g�FM'�|��_�<S��Xԇ���Zf���e��匆]s�]�����;��m�?�9�w�C�I�%!�;�R�H�%	$;�M�/�^xIƩ �+x�5��L\�����a���m�d���&�k�eY�?]����}	������������1t���Fȶ)�ʶ5��i�P�sD�0;tXQ���[H�H�$(��>ᜂ=WZč��+�H5���J]f�cYq7�����>�ۼ��#����wn�3+� �P�:g���u�WV�L�����Km�M�_TUa%��''�-(.cu�F0�u����ke|�b��?�+���~��~k@c[Y�!��&��68#��e���*\^7Ͳ��̏�ֿ�)�=Lۄ~dZ?��s���}�^��i�L��N*�+|V��2��~:�����-�E�m�{=;�W�Q�T$�=���Ǭ����5��"�?m�Hu��`|�����MP"������xQ�E'��=�*i�ͻe���)�x�}��ӆ�i���uR�SD�O��8!��?�b�
n�Z��8�N�W)����{a|�	�p%yђqݚyui�VICޡ���:nd������4I���:��h"�By����>���60�n�wl��/�ܝ�      �   (   x�3���/-N���I)�,�2�L��O).)MKqc���� �
�      �   �   x�-P[r� �Ƨ�	:�y�.��a��� qƷ� �[I+�@+�,|>TN�7��юF� �W�3�������駠r�st������d)�win�դ,��aۂG4dh��YS�-U�	k�.tub�.�T�$z�_���3�am��J�.�P�!4pN��
Z��h�ǥ��h�_�O�Ʊx�ͯτۊ��9Z�K�R�RS��L
��+�-ҋM��!��d���5�|�i�      �   �  x�ER��� <��,+؎��+����d+�~������n0����b�Q�(��w
��w�դvK��M*w�E%�zTg\�Y�#����"g4��礨pڏ�Ri(�:���"=u�`#闷����z��Uz������G�98�J���Q(	��G$��u�B��	^*�Gm k��o��������#;�f�����x~�:��ׯ�{�[���%�C��Qу�\���A�|�Y[v��\Ҡ�ho�KDmC�n��[I����8���@%d��l%�Q��1^6��)��8WC�1��,��9��,r��tQz�+�J��fX�S�צ�۔����O�jV(N~c�؜঒��<U�/�t�-�Ԝas�} ��&9��k+SNg`��@��~x��LK�U>�ƷH< ��L� �DK	�|IRY�G�Gl�}�;��k���g��& �      �   y   x��K�0�~����R���l�4�HiRܘ�"��i�f�V�c�4^��H9�-���0Q0��)cƉ��>�L�%\H���9���%��m��_�S�[β��{c<P��;�Z���*P      �   !  x�5P�N�0<�_�@Q�n��q%� $čKH�b)Mw����.�8�x<3,������-����煉�'�5�a<ɬ�ٺ���I�	:�W6`'(� 88_�����T+�Q�.����:�-m�A�VF�0b�F���(����wZpa_�j`�b�?+�n�3���V�
O_[�AW�����58��5��4+�ߟ-�T0�D5���{pq���~���u5�h.����Ϟqg���*�6d5�����XuZ�4�A�"̃
̂n5iw/�<E�a�n:�*Ma���b�ן�i�_��vk      �   &   x�3�LI��,K-��L�2�,.�/JLO�,����� ��w      �   �  x�]����0���S��l���(�&��T�m�l�^,�+��^��/��z��7���gp�^�g��0��������3Zg�քڴ�Ŏ�6��-�TI%Y��so�5�l��8B�_թ��k�,�.BFKQR�3��'��7z$;�xQMv,�����{�S:`ݻ0hcY�ؔE�%��hV�"pF���䨗��F9����ik�"�z�.��a� �B��K�i�%O$q�9��K���Ls���`ff���`��=���e�%B�4�y����fD�Xm<<�}��`:�^�zѽs���+WLH�ժ��O���8:8�cy)ap�`�ͮ��X_��Z|��h%*Z��
�y�`�EOv���?��R��Z֠��Q����_Ң�"�໛{CN�-�ҏ������do+t�J��UΓ,��צÑ\��gh�}z�@�68��Hzh�������Lp�%��4O~�$I� ��l     