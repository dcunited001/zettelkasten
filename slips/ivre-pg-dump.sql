--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

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
-- Data for Name: n_association_scan_category; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_association_scan_category (scan, category) FROM stdin;
\.


--
-- Data for Name: n_association_scan_hostname; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_association_scan_hostname (scan, hostname) FROM stdin;
\.


--
-- Data for Name: n_category; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_category (id, name) FROM stdin;
\.


--
-- Data for Name: n_hop; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_hop (id, trace, ipaddr, ttl, rtt, host, domains) FROM stdin;
\.


--
-- Data for Name: n_hostname; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_hostname (id, scan, domains, name, type) FROM stdin;
\.


--
-- Data for Name: n_port; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_port (id, scan, port, protocol, state, state_reason, state_reason_ip, state_reason_ttl, service_name, service_tunnel, service_product, service_version, service_conf, service_devicetype, service_extrainfo, service_hostname, service_ostype, service_fp) FROM stdin;
\.


--
-- Data for Name: n_scan; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_scan (id, addr, info, time_start, time_stop, state, state_reason, state_reason_ttl, schema_version, source) FROM stdin;
\.


--
-- Data for Name: n_script; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_script (port, name, output, data) FROM stdin;
\.


--
-- Data for Name: n_tag; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_tag (id, scan, value, type, info) FROM stdin;
\.


--
-- Data for Name: n_trace; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.n_trace (id, scan, port, protocol) FROM stdin;
\.


--
-- Data for Name: passive; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.passive (id, addr, sensor, count, firstseen, lastseen, port, recontype, source, targetval, value, info, moreinfo, schema_version) FROM stdin;
\.


--
-- Data for Name: v_association_scan_category; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_association_scan_category (scan, category) FROM stdin;
\.


--
-- Data for Name: v_association_scan_hostname; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_association_scan_hostname (scan, hostname) FROM stdin;
\.


--
-- Data for Name: v_category; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_category (id, name) FROM stdin;
\.


--
-- Data for Name: v_hop; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_hop (id, trace, ipaddr, ttl, rtt, host, domains) FROM stdin;
\.


--
-- Data for Name: v_hostname; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_hostname (id, scan, domains, name, type) FROM stdin;
\.


--
-- Data for Name: v_port; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_port (id, scan, port, protocol, state, state_reason, state_reason_ip, state_reason_ttl, service_name, service_tunnel, service_product, service_version, service_conf, service_devicetype, service_extrainfo, service_hostname, service_ostype, service_fp) FROM stdin;
\.


--
-- Data for Name: v_scan; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_scan (id, addr, info, time_start, time_stop, state, state_reason, state_reason_ttl, schema_version, source) FROM stdin;
\.


--
-- Data for Name: v_script; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_script (port, name, output, data) FROM stdin;
\.


--
-- Data for Name: v_tag; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_tag (id, scan, value, type, info) FROM stdin;
\.


--
-- Data for Name: v_trace; Type: TABLE DATA; Schema: public; Owner: ivre
--

COPY public.v_trace (id, scan, port, protocol) FROM stdin;
\.


--
-- Name: n_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_category_id_seq', 1, false);


--
-- Name: n_hop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_hop_id_seq', 1, false);


--
-- Name: n_hostname_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_hostname_id_seq', 1, false);


--
-- Name: n_port_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_port_id_seq', 1, false);


--
-- Name: n_scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_scan_id_seq', 1, false);


--
-- Name: n_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_tag_id_seq', 1, false);


--
-- Name: n_trace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.n_trace_id_seq', 1, false);


--
-- Name: passive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.passive_id_seq', 1, false);


--
-- Name: v_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_category_id_seq', 1, false);


--
-- Name: v_hop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_hop_id_seq', 1, false);


--
-- Name: v_hostname_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_hostname_id_seq', 1, false);


--
-- Name: v_port_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_port_id_seq', 1, false);


--
-- Name: v_scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_scan_id_seq', 1, false);


--
-- Name: v_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_tag_id_seq', 1, false);


--
-- Name: v_trace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivre
--

SELECT pg_catalog.setval('public.v_trace_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

