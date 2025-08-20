--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-08-20 23:25:11

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16403)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character(11) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16402)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 226 (class 1259 OID 16476)
-- Name: inventory_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_transactions (
    trans_id integer NOT NULL,
    product_id integer,
    trans_type character varying(50) NOT NULL,
    quantity_change integer NOT NULL,
    trans_date date NOT NULL
);


ALTER TABLE public.inventory_transactions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16475)
-- Name: inventory_transactions_trans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_transactions_trans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_transactions_trans_id_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 225
-- Name: inventory_transactions_trans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_transactions_trans_id_seq OWNED BY public.inventory_transactions.trans_id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    price integer NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 224 (class 1259 OID 16459)
-- Name: sale_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_items (
    sale_item_id integer NOT NULL,
    sale_id integer,
    product_id integer,
    quantity integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.sale_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16458)
-- Name: sale_items_sale_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_items_sale_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_items_sale_item_id_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 223
-- Name: sale_items_sale_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_items_sale_item_id_seq OWNED BY public.sale_items.sale_item_id;


--
-- TOC entry 222 (class 1259 OID 16447)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    customer_id integer,
    sale_date date NOT NULL,
    total_amount integer NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16446)
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_sale_id_seq OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 221
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- TOC entry 228 (class 1259 OID 16488)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    price integer NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16487)
-- Name: test_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.test_product_id_seq OWNER TO postgres;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 227
-- Name: test_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_product_id_seq OWNED BY public.test.product_id;


--
-- TOC entry 4667 (class 2604 OID 16406)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 16479)
-- Name: inventory_transactions trans_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_transactions ALTER COLUMN trans_id SET DEFAULT nextval('public.inventory_transactions_trans_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 16393)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 16462)
-- Name: sale_items sale_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items ALTER COLUMN sale_item_id SET DEFAULT nextval('public.sale_items_sale_item_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 16450)
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 16491)
-- Name: test product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN product_id SET DEFAULT nextval('public.test_product_id_seq'::regclass);


--
-- TOC entry 4836 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, phone) FROM stdin;
3	John Doe	03012345678
4	Jane Smith	03123456789
5	Sarah Khan	03234567890
6	Ali Ahmed	03345678901
7	Ateeb Akmal	03064700020
8	Zobia Akbar	03358526195
10	Ahmad Khan	03557169466
11	Huzaima Imtiaz	03367398121
1	Sufwan Amir	03125380569
2	Sharia Noor	03369441162
\.


--
-- TOC entry 4842 (class 0 OID 16476)
-- Dependencies: 226
-- Data for Name: inventory_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_transactions (trans_id, product_id, trans_type, quantity_change, trans_date) FROM stdin;
1	1	sale	-5	2025-04-06
2	2	sale	-10	2025-04-06
3	3	sale	-8	2025-04-07
4	4	sale	-3	2025-04-07
6	1	sale	-6	2025-04-08
5	5	restock	4	2025-04-08
\.


--
-- TOC entry 4834 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, price, stock_quantity) FROM stdin;
1	Milk (1 liter)	300	50
2	Bread(1 loaf)	150	40
3	Basmati Rice (5 kg)	950	30
4	Wheat Flour (10 kg)	1200	25
5	Cooking Oil (1 liter)	650	60
6	Sugar (1 kg)	170	70
7	Tea (500g)	490	40
8	Eggs (dozen)	330	35
9	Salt (1 kg)	40	80
10	Red Chilli Powder (200g)	140	50
11	Dishwashing Liquid (500ml)	220	20
12	Toilet Paper (Pack of 4)	190	30
13	Laundry Detergent (1kg)	340	25
14	Shampoo (200ml)	300	30
15	Toothpaste (150g)	180	40
16	Hand Wash (250ml)	150	35
17	Tissue Box (Large)	160	30
18	Garbage Bags (Pack of 10)	110	20
19	Surface Cleaner (1 liter)	280	15
20	Mosquito Spray (400ml)	390	20
\.


--
-- TOC entry 4840 (class 0 OID 16459)
-- Dependencies: 224
-- Data for Name: sale_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_items (sale_item_id, sale_id, product_id, quantity, price) FROM stdin;
1	1	1	5	150
2	1	2	10	50
3	2	3	8	120
4	3	4	3	250
5	4	5	4	180
6	5	1	6	150
7	1	1	2	200
8	1	3	1	150
9	2	2	3	300
10	2	5	1	250
11	3	4	2	120
12	4	1	1	200
13	4	2	1	300
14	4	6	2	180
15	5	7	1	160
16	6	8	4	90
17	7	3	2	150
18	8	5	3	250
19	9	6	1	180
20	10	2	2	300
21	11	1	1	200
22	11	9	2	100
23	12	10	5	50
24	13	4	3	120
25	14	2	1	300
26	15	3	2	150
27	16	5	1	250
28	17	1	2	200
\.


--
-- TOC entry 4838 (class 0 OID 16447)
-- Dependencies: 222
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_id, customer_id, sale_date, total_amount) FROM stdin;
1	1	2025-04-06	2000
2	2	2025-04-06	1000
3	3	2025-04-07	1500
4	4	2025-04-07	2500
5	5	2025-04-08	3000
6	1	2025-04-01	1200
7	2	2025-04-02	2100
8	3	2025-04-03	950
9	1	2025-04-04	1800
10	4	2025-04-05	1600
11	2	2025-04-06	2200
12	3	2025-04-07	1750
13	4	2025-04-08	980
14	5	2025-04-09	1320
15	1	2025-04-10	2450
16	2	2025-04-11	1870
17	5	2025-04-12	1600
18	4	2025-04-13	1100
19	3	2025-04-14	940
20	2	2025-04-15	2050
21	5	2025-04-06	1250
\.


--
-- TOC entry 4844 (class 0 OID 16488)
-- Dependencies: 228
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (product_id, product_name, price, stock_quantity) FROM stdin;
\.


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 11, true);


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 225
-- Name: inventory_transactions_trans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_transactions_trans_id_seq', 6, true);


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 20, true);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 223
-- Name: sale_items_sale_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_items_sale_item_id_seq', 28, true);


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 221
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 21, true);


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 227
-- Name: test_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_product_id_seq', 1, false);


--
-- TOC entry 4675 (class 2606 OID 16408)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4681 (class 2606 OID 16481)
-- Name: inventory_transactions inventory_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_pkey PRIMARY KEY (trans_id);


--
-- TOC entry 4673 (class 2606 OID 16395)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4679 (class 2606 OID 16464)
-- Name: sale_items sale_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (sale_item_id);


--
-- TOC entry 4677 (class 2606 OID 16452)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 4683 (class 2606 OID 16493)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4687 (class 2606 OID 16482)
-- Name: inventory_transactions inventory_transactions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4685 (class 2606 OID 16470)
-- Name: sale_items sale_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4686 (class 2606 OID 16465)
-- Name: sale_items sale_items_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sales(sale_id) ON DELETE CASCADE;


--
-- TOC entry 4684 (class 2606 OID 16453)
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE CASCADE;


-- Completed on 2025-08-20 23:25:12

--
-- PostgreSQL database dump complete
--

