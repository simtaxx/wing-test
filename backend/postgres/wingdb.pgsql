--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id character varying(512) NOT NULL,
    name character varying(50),
    weight numeric
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id character varying(512) NOT NULL,
    date character varying(512),
    items json,
    "isOrderProcessed" boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: parcels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcels (
    id integer NOT NULL,
    order_id character varying(255),
    items json,
    weight numeric,
    tracking_id character varying(255),
    palette_number integer,
    cost integer
);


ALTER TABLE public.parcels OWNER TO postgres;

--
-- Name: parcels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parcels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parcels_id_seq OWNER TO postgres;

--
-- Name: parcels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parcels_id_seq OWNED BY public.parcels.id;


--
-- Name: parcels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcels ALTER COLUMN id SET DEFAULT nextval('public.parcels_id_seq'::regclass);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, weight) FROM stdin;
5bb619e49593e5d3cbaa0b52	Flowers	1.5
5bb619e4ebdccb9218aa9dcb	Chair	8.4
5bb619e4911037797edae511	TV	20.8
5bb619e4504f248e1be543d3	Skateboard	5.9
5bb619e40fee29e3aaf09759	Donald Trump statue	18.4
5bb619e44251009d72e458b9	Molkkÿ game	17.9
5bb619e439d3e99e2e25848d	Helmet	22.7
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, date, items, "isOrderProcessed") FROM stdin;
5bb61dfd608be72f6dc188b1	Thu Sep 27 2018 16:25:15 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfda60406879c1de883	Tue Oct 02 2018 15:09:53 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1}]	f
5bb61dfd7a54c2a7fb1b008a	Sat Sep 15 2018 23:33:30 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfdd8b0a1f90066734d	Sat Sep 29 2018 18:20:59 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd785590852ac3dc5d	Mon Aug 06 2018 12:11:45 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1}]	f
5bb61dfd353280380a766d32	Tue Sep 04 2018 03:32:08 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd87895d95ebf1a065	Sat Sep 22 2018 17:53:29 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd9bfc575f5b95a4f9	Wed Aug 22 2018 17:20:19 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
5bb61dfd8b3a9057af5ca05b	Tue Aug 28 2018 10:04:59 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfd1cf4a3dcd5bebb36	Sun Sep 30 2018 13:05:18 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":2}]	f
5bb61dfd117a321d7bd5007f	Thu Aug 23 2018 18:05:53 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfd8d56e6ddf4cb06c8	Thu Sep 06 2018 14:20:43 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3}]	f
5bb61dfd9f066dcdc21126fb	Thu Sep 27 2018 13:52:44 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3}]	f
5bb61dfdc88b3200af75befb	Thu Aug 30 2018 21:40:09 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3}]	f
5bb61dfde99f5fc4596b2248	Thu Aug 16 2018 05:31:13 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfd3d8ce14ed6f76ce1	Mon Sep 03 2018 05:00:45 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":3}]	f
5bb61dfd7c4e349270d66525	Thu Sep 06 2018 05:56:34 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":1}]	f
5bb61dfd1c520e317a9b6377	Mon Sep 17 2018 04:16:20 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfd4c3d2b68f0ee3306	Thu Aug 30 2018 21:46:43 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":2}]	f
5bb61dfdaee4269ccaff5f2d	Tue Aug 28 2018 03:34:44 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfd4bcfa9098d88386a	Sat Sep 08 2018 18:43:03 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":3}]	f
5bb61dfd0cbe9751ea3b5c25	Tue Oct 02 2018 16:23:54 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfdc914531d3eb310c6	Sat Sep 15 2018 15:37:29 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":3}]	f
5bb61dfda0761a938c0a53e2	Sun Sep 02 2018 15:12:38 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3}]	f
5bb61dfd29107d89c6bb5404	Tue Oct 02 2018 19:12:26 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4}]	f
5bb61dfd65d5426c6f7e96e6	Sat Sep 29 2018 17:39:22 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":1}]	f
5bb61dfd50d9afefef3c00fb	Wed Sep 19 2018 15:53:09 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfdb5050d7fb7847201	Tue Aug 28 2018 14:43:45 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfd958dde6f77377c11	Sat Sep 01 2018 05:05:33 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":3}]	f
5bb61dfdb0d60749c11d0f74	Sun Aug 05 2018 15:44:12 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfd45de57c146626327	Mon Aug 13 2018 21:30:21 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":3}]	f
5bb61dfd5e3fec29772e83a4	Thu Aug 16 2018 06:18:42 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfdd5fee045a9b1fcba	Wed Oct 03 2018 00:37:28 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfdb50589527271d312	Sat Sep 22 2018 14:55:49 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1}]	f
5bb61dfd951fae1b928148b0	Wed Sep 05 2018 23:01:39 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":3}]	f
5bb61dfdf5f02f7a4fca9fdf	Tue Sep 25 2018 03:38:53 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2}]	f
5bb61dfd7a7fcf71419047d9	Thu Sep 13 2018 15:20:33 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":3}]	f
5bb61dfd4f69490e2a0dde02	Fri Aug 10 2018 16:33:41 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":4}]	f
5bb61dfdb2d11c31eb3cdb2c	Tue Sep 18 2018 08:16:37 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3}]	f
5bb61dfd871cb0a45592716c	Wed Sep 26 2018 02:37:34 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1}]	f
5bb61dfd66abb0ff34411453	Tue Aug 28 2018 06:35:51 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":4}]	f
5bb61dfdfcfd2d8ef52c4657	Thu Aug 16 2018 13:18:33 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4}]	f
5bb61dfdce0796e5a72cd45f	Wed Sep 05 2018 07:22:30 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4}]	f
5bb61dfde45aa38a3a9d5be6	Tue Aug 21 2018 00:21:47 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3}]	f
5bb61dfd7a317891143f34a3	Fri Sep 07 2018 17:29:33 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd5949626d7e1446bb	Tue Aug 07 2018 01:26:17 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":2}]	f
5bb61dfd4d64747dd8d7d6cf	Sat Aug 11 2018 02:01:25 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfd3741808151aa413b	Wed Aug 15 2018 13:57:04 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfdf343a51e8519467e	Tue Oct 02 2018 09:33:28 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3}]	f
5bb61dfd065632a4a35db675	Sat Sep 01 2018 18:51:11 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd8b100945ccda62e6	Thu Aug 09 2018 11:16:08 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":1}]	f
5bb61dfd563905ccb74f3561	Wed Aug 08 2018 02:49:11 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
5bb61dfd4060fd0a3c288813	Fri Sep 28 2018 20:08:31 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1}]	f
5bb61dfd059806b0319699f7	Sun Aug 26 2018 11:56:45 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfd9c441b19cc090169	Sun Aug 12 2018 09:33:05 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfdafd60889048c1725	Fri Sep 21 2018 08:39:53 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1}]	f
5bb61dfd64d86bedb0b74bee	Sun Aug 19 2018 17:05:56 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4}]	f
5bb61dfda2ae8cbbc088ac6f	Fri Sep 14 2018 12:02:44 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2}]	f
5bb61dfd07744d5420f11578	Sat Sep 01 2018 02:34:41 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":1}]	f
5bb61dfd37f3d80d39d2eeb1	Mon Sep 03 2018 10:29:37 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":1}]	f
5bb61dfd824ba0fdce8be731	Tue Aug 21 2018 07:52:24 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4}]	f
5bb61dfd7bbfc34028d0eaaf	Tue Sep 18 2018 04:49:10 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfde3efd55943f3f411	Sat Aug 04 2018 21:11:18 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":4}]	f
5bb61dfd08c1294d217e2c1c	Tue Aug 28 2018 17:41:17 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3}]	f
5bb61dfd1e4412b9a65f2e4b	Tue Sep 11 2018 01:04:10 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
5bb61dfd34535aa451c7426d	Fri Sep 21 2018 22:54:04 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfd7ba8e0178befa9ae	Fri Sep 14 2018 20:43:47 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfd9e7b7353be4184d2	Wed Sep 26 2018 20:41:58 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfdaaaf8863c9cb07e2	Fri Sep 14 2018 01:32:15 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":2}]	f
5bb61dfde6420081aa3f8fa0	Thu Sep 20 2018 00:56:51 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfd7d9320c7ccc53e1f	Tue Aug 14 2018 14:28:02 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":4}]	f
5bb61dfd0791d8a355e1d2d0	Tue Sep 11 2018 20:22:42 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":1}]	f
5bb61dfdbe34a8051c6a74bb	Sat Sep 29 2018 14:19:23 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2}]	f
5bb61dfdd5cb341205e758b4	Mon Aug 13 2018 19:22:02 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2}]	f
5bb61dfd79a85ef574665251	Wed Sep 12 2018 20:28:23 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfda907f0aa69903271	Wed Aug 15 2018 05:06:20 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":3}]	f
5bb61dfd048ea2e9f38a67aa	Sat Sep 29 2018 13:30:04 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":4}]	f
5bb61dfd6dc15646e572b664	Fri Sep 21 2018 10:21:59 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3}]	f
5bb61dfda46ae7ee3107cab7	Sat Aug 18 2018 12:37:25 GMT+0000 (UTC)	[{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":4}]	f
5bb61dfd74a462a0f7091462	Thu Aug 23 2018 09:07:26 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2}]	f
5bb61dfd280a1e8bfafa866e	Tue Aug 21 2018 16:34:55 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
5bb61dfda8578902208a9291	Tue Aug 21 2018 20:56:56 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4}]	f
5bb61dfdd1908c624b0f24ea	Sat Sep 29 2018 04:25:21 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":1}]	f
5bb61dfd62d16b505c525bbb	Wed Sep 05 2018 00:04:46 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3}]	f
5bb61dfdc72d051fb63589cb	Fri Sep 28 2018 13:52:28 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":4}]	f
5bb61dfdf8878ffeab69d077	Fri Sep 21 2018 01:52:54 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":4},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1}]	f
5bb61dfd35ad7371ae383e36	Mon Sep 17 2018 06:56:20 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":4}]	f
5bb61dfd2575864ab2e78cf2	Thu Aug 30 2018 05:17:20 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2}]	f
5bb61dfd550fbf4bfdfd3b9f	Sat Aug 18 2018 00:06:12 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2},{"item_id":"5bb619e4504f248e1be543d3","quantity":3},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfd55adac4cef0c7587	Tue Sep 04 2018 12:18:18 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4504f248e1be543d3","quantity":2}]	f
5bb61dfdb6780806abe2160b	Mon Sep 17 2018 14:34:02 GMT+0000 (UTC)	[{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
5bb61dfd4c859cd301829650	Sat Aug 11 2018 09:33:37 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfd6dc24173b2389726	Tue Aug 14 2018 17:11:17 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4}]	f
5bb61dfd341869915fa31540	Sun Sep 23 2018 01:33:05 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e44251009d72e458b9","quantity":4},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e40fee29e3aaf09759","quantity":4}]	f
5bb61dfd5e6124d47ed3e049	Sun Sep 23 2018 16:20:15 GMT+0000 (UTC)	[{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":4},{"item_id":"5bb619e4911037797edae511","quantity":1},{"item_id":"5bb619e44251009d72e458b9","quantity":1}]	f
5bb61dfdd2c575954d819651	Thu Aug 16 2018 17:53:05 GMT+0000 (UTC)	[{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1},{"item_id":"5bb619e40fee29e3aaf09759","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1}]	f
5bb61dfd749a93bdbbea4b6a	Sun Sep 16 2018 14:03:19 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":4},{"item_id":"5bb619e439d3e99e2e25848d","quantity":4},{"item_id":"5bb619e44251009d72e458b9","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":2}]	f
5bb61dfd9bb9170e3145ea06	Fri Aug 17 2018 22:27:08 GMT+0000 (UTC)	[{"item_id":"5bb619e439d3e99e2e25848d","quantity":1},{"item_id":"5bb619e4504f248e1be543d3","quantity":1},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":1}]	f
5bb61dfda0ba9350ed572939	Mon Sep 10 2018 19:41:33 GMT+0000 (UTC)	[{"item_id":"5bb619e44251009d72e458b9","quantity":2},{"item_id":"5bb619e439d3e99e2e25848d","quantity":3},{"item_id":"5bb619e49593e5d3cbaa0b52","quantity":3},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4911037797edae511","quantity":3}]	f
5bb61dfdcb54de8b66f8dfab	Mon Sep 10 2018 05:04:57 GMT+0000 (UTC)	[{"item_id":"5bb619e4504f248e1be543d3","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":2},{"item_id":"5bb619e4ebdccb9218aa9dcb","quantity":1},{"item_id":"5bb619e4911037797edae511","quantity":2}]	f
\.


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parcels (id, order_id, items, weight, tracking_id, palette_number, cost) FROM stdin;
\.


--
-- Name: parcels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parcels_id_seq', 2740, true);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: parcels parcels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (id);


--
-- Name: TABLE items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.items TO admin;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.orders TO admin;


--
-- Name: TABLE parcels; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.parcels TO admin;


--
-- Name: SEQUENCE parcels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.parcels_id_seq TO admin;


--
-- PostgreSQL database dump complete
--

