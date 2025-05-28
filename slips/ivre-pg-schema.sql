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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: n_association_scan_category; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_association_scan_category (
    scan integer NOT NULL,
    category integer NOT NULL
);


ALTER TABLE public.n_association_scan_category OWNER TO ivre;

--
-- Name: n_association_scan_hostname; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_association_scan_hostname (
    scan integer NOT NULL,
    hostname integer NOT NULL
);


ALTER TABLE public.n_association_scan_hostname OWNER TO ivre;

--
-- Name: n_category; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_category (
    id integer NOT NULL,
    name character varying(32)
);


ALTER TABLE public.n_category OWNER TO ivre;

--
-- Name: n_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_category_id_seq OWNER TO ivre;

--
-- Name: n_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_category_id_seq OWNED BY public.n_category.id;


--
-- Name: n_hop; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_hop (
    id integer NOT NULL,
    trace integer NOT NULL,
    ipaddr inet,
    ttl integer,
    rtt double precision,
    host character varying(255),
    domains character varying(255)[]
);


ALTER TABLE public.n_hop OWNER TO ivre;

--
-- Name: n_hop_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_hop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_hop_id_seq OWNER TO ivre;

--
-- Name: n_hop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_hop_id_seq OWNED BY public.n_hop.id;


--
-- Name: n_hostname; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_hostname (
    id integer NOT NULL,
    scan integer,
    domains character varying(255)[],
    name character varying(255),
    type character varying(16)
);


ALTER TABLE public.n_hostname OWNER TO ivre;

--
-- Name: n_hostname_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_hostname_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_hostname_id_seq OWNER TO ivre;

--
-- Name: n_hostname_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_hostname_id_seq OWNED BY public.n_hostname.id;


--
-- Name: n_port; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_port (
    id integer NOT NULL,
    scan integer,
    port integer,
    protocol character varying(16),
    state character varying(32),
    state_reason character varying(32),
    state_reason_ip inet,
    state_reason_ttl integer,
    service_name character varying(64),
    service_tunnel character varying(16),
    service_product character varying(256),
    service_version character varying(256),
    service_conf integer,
    service_devicetype character varying(64),
    service_extrainfo text,
    service_hostname character varying(256),
    service_ostype character varying(64),
    service_fp text
);


ALTER TABLE public.n_port OWNER TO ivre;

--
-- Name: n_port_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_port_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_port_id_seq OWNER TO ivre;

--
-- Name: n_port_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_port_id_seq OWNED BY public.n_port.id;


--
-- Name: n_scan; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_scan (
    id integer NOT NULL,
    addr inet NOT NULL,
    info jsonb,
    time_start timestamp without time zone,
    time_stop timestamp without time zone,
    state character varying(32),
    state_reason character varying(32),
    state_reason_ttl integer,
    schema_version integer,
    source character varying(32) NOT NULL
);


ALTER TABLE public.n_scan OWNER TO ivre;

--
-- Name: n_scan_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_scan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_scan_id_seq OWNER TO ivre;

--
-- Name: n_scan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_scan_id_seq OWNED BY public.n_scan.id;


--
-- Name: n_script; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_script (
    port integer NOT NULL,
    name character varying(64) NOT NULL,
    output text,
    data jsonb
);


ALTER TABLE public.n_script OWNER TO ivre;

--
-- Name: n_tag; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_tag (
    id integer NOT NULL,
    scan integer,
    value character varying(256),
    type character varying(16),
    info character varying(256)
);


ALTER TABLE public.n_tag OWNER TO ivre;

--
-- Name: n_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_tag_id_seq OWNER TO ivre;

--
-- Name: n_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_tag_id_seq OWNED BY public.n_tag.id;


--
-- Name: n_trace; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.n_trace (
    id integer NOT NULL,
    scan integer NOT NULL,
    port integer,
    protocol character varying(16)
);


ALTER TABLE public.n_trace OWNER TO ivre;

--
-- Name: n_trace_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.n_trace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n_trace_id_seq OWNER TO ivre;

--
-- Name: n_trace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.n_trace_id_seq OWNED BY public.n_trace.id;


--
-- Name: passive; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.passive (
    id integer NOT NULL,
    addr inet,
    sensor character varying(64),
    count integer,
    firstseen timestamp without time zone,
    lastseen timestamp without time zone,
    port integer,
    recontype character varying(64),
    source character varying(64),
    targetval text,
    value text,
    info jsonb,
    moreinfo jsonb,
    schema_version integer
);


ALTER TABLE public.passive OWNER TO ivre;

--
-- Name: passive_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.passive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passive_id_seq OWNER TO ivre;

--
-- Name: passive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.passive_id_seq OWNED BY public.passive.id;


--
-- Name: v_association_scan_category; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_association_scan_category (
    scan integer NOT NULL,
    category integer NOT NULL
);


ALTER TABLE public.v_association_scan_category OWNER TO ivre;

--
-- Name: v_association_scan_hostname; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_association_scan_hostname (
    scan integer NOT NULL,
    hostname integer NOT NULL
);


ALTER TABLE public.v_association_scan_hostname OWNER TO ivre;

--
-- Name: v_category; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_category (
    id integer NOT NULL,
    name character varying(32)
);


ALTER TABLE public.v_category OWNER TO ivre;

--
-- Name: v_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_category_id_seq OWNER TO ivre;

--
-- Name: v_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_category_id_seq OWNED BY public.v_category.id;


--
-- Name: v_hop; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_hop (
    id integer NOT NULL,
    trace integer NOT NULL,
    ipaddr inet,
    ttl integer,
    rtt double precision,
    host character varying(255),
    domains character varying(255)[]
);


ALTER TABLE public.v_hop OWNER TO ivre;

--
-- Name: v_hop_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_hop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_hop_id_seq OWNER TO ivre;

--
-- Name: v_hop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_hop_id_seq OWNED BY public.v_hop.id;


--
-- Name: v_hostname; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_hostname (
    id integer NOT NULL,
    scan integer,
    domains character varying(255)[],
    name character varying(255),
    type character varying(16)
);


ALTER TABLE public.v_hostname OWNER TO ivre;

--
-- Name: v_hostname_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_hostname_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_hostname_id_seq OWNER TO ivre;

--
-- Name: v_hostname_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_hostname_id_seq OWNED BY public.v_hostname.id;


--
-- Name: v_port; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_port (
    id integer NOT NULL,
    scan integer,
    port integer,
    protocol character varying(16),
    state character varying(32),
    state_reason character varying(32),
    state_reason_ip inet,
    state_reason_ttl integer,
    service_name character varying(64),
    service_tunnel character varying(16),
    service_product character varying(256),
    service_version character varying(256),
    service_conf integer,
    service_devicetype character varying(64),
    service_extrainfo text,
    service_hostname character varying(256),
    service_ostype character varying(64),
    service_fp text
);


ALTER TABLE public.v_port OWNER TO ivre;

--
-- Name: v_port_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_port_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_port_id_seq OWNER TO ivre;

--
-- Name: v_port_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_port_id_seq OWNED BY public.v_port.id;


--
-- Name: v_scan; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_scan (
    id integer NOT NULL,
    addr inet NOT NULL,
    info jsonb,
    time_start timestamp without time zone,
    time_stop timestamp without time zone,
    state character varying(32),
    state_reason character varying(32),
    state_reason_ttl integer,
    schema_version integer,
    source character varying(32)[]
);


ALTER TABLE public.v_scan OWNER TO ivre;

--
-- Name: v_scan_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_scan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_scan_id_seq OWNER TO ivre;

--
-- Name: v_scan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_scan_id_seq OWNED BY public.v_scan.id;


--
-- Name: v_script; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_script (
    port integer NOT NULL,
    name character varying(64) NOT NULL,
    output text,
    data jsonb
);


ALTER TABLE public.v_script OWNER TO ivre;

--
-- Name: v_tag; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_tag (
    id integer NOT NULL,
    scan integer,
    value character varying(256),
    type character varying(16),
    info character varying(256)
);


ALTER TABLE public.v_tag OWNER TO ivre;

--
-- Name: v_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_tag_id_seq OWNER TO ivre;

--
-- Name: v_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_tag_id_seq OWNED BY public.v_tag.id;


--
-- Name: v_trace; Type: TABLE; Schema: public; Owner: ivre
--

CREATE TABLE public.v_trace (
    id integer NOT NULL,
    scan integer NOT NULL,
    port integer,
    protocol character varying(16)
);


ALTER TABLE public.v_trace OWNER TO ivre;

--
-- Name: v_trace_id_seq; Type: SEQUENCE; Schema: public; Owner: ivre
--

CREATE SEQUENCE public.v_trace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.v_trace_id_seq OWNER TO ivre;

--
-- Name: v_trace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivre
--

ALTER SEQUENCE public.v_trace_id_seq OWNED BY public.v_trace.id;


--
-- Name: n_category id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_category ALTER COLUMN id SET DEFAULT nextval('public.n_category_id_seq'::regclass);


--
-- Name: n_hop id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hop ALTER COLUMN id SET DEFAULT nextval('public.n_hop_id_seq'::regclass);


--
-- Name: n_hostname id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hostname ALTER COLUMN id SET DEFAULT nextval('public.n_hostname_id_seq'::regclass);


--
-- Name: n_port id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_port ALTER COLUMN id SET DEFAULT nextval('public.n_port_id_seq'::regclass);


--
-- Name: n_scan id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_scan ALTER COLUMN id SET DEFAULT nextval('public.n_scan_id_seq'::regclass);


--
-- Name: n_tag id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_tag ALTER COLUMN id SET DEFAULT nextval('public.n_tag_id_seq'::regclass);


--
-- Name: n_trace id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_trace ALTER COLUMN id SET DEFAULT nextval('public.n_trace_id_seq'::regclass);


--
-- Name: passive id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.passive ALTER COLUMN id SET DEFAULT nextval('public.passive_id_seq'::regclass);


--
-- Name: v_category id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_category ALTER COLUMN id SET DEFAULT nextval('public.v_category_id_seq'::regclass);


--
-- Name: v_hop id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hop ALTER COLUMN id SET DEFAULT nextval('public.v_hop_id_seq'::regclass);


--
-- Name: v_hostname id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hostname ALTER COLUMN id SET DEFAULT nextval('public.v_hostname_id_seq'::regclass);


--
-- Name: v_port id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_port ALTER COLUMN id SET DEFAULT nextval('public.v_port_id_seq'::regclass);


--
-- Name: v_scan id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_scan ALTER COLUMN id SET DEFAULT nextval('public.v_scan_id_seq'::regclass);


--
-- Name: v_tag id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_tag ALTER COLUMN id SET DEFAULT nextval('public.v_tag_id_seq'::regclass);


--
-- Name: v_trace id; Type: DEFAULT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_trace ALTER COLUMN id SET DEFAULT nextval('public.v_trace_id_seq'::regclass);


--
-- Name: n_association_scan_category n_association_scan_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_category
    ADD CONSTRAINT n_association_scan_category_pkey PRIMARY KEY (scan, category);


--
-- Name: n_association_scan_hostname n_association_scan_hostname_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_hostname
    ADD CONSTRAINT n_association_scan_hostname_pkey PRIMARY KEY (scan, hostname);


--
-- Name: n_category n_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_category
    ADD CONSTRAINT n_category_pkey PRIMARY KEY (id);


--
-- Name: n_hop n_hop_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hop
    ADD CONSTRAINT n_hop_pkey PRIMARY KEY (id);


--
-- Name: n_hostname n_hostname_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hostname
    ADD CONSTRAINT n_hostname_pkey PRIMARY KEY (id);


--
-- Name: n_port n_port_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_port
    ADD CONSTRAINT n_port_pkey PRIMARY KEY (id);


--
-- Name: n_scan n_scan_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_scan
    ADD CONSTRAINT n_scan_pkey PRIMARY KEY (id);


--
-- Name: n_script n_script_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_script
    ADD CONSTRAINT n_script_pkey PRIMARY KEY (port, name);


--
-- Name: n_tag n_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_tag
    ADD CONSTRAINT n_tag_pkey PRIMARY KEY (id);


--
-- Name: n_trace n_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_trace
    ADD CONSTRAINT n_trace_pkey PRIMARY KEY (id);


--
-- Name: passive passive_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.passive
    ADD CONSTRAINT passive_pkey PRIMARY KEY (id);


--
-- Name: v_association_scan_category v_association_scan_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_category
    ADD CONSTRAINT v_association_scan_category_pkey PRIMARY KEY (scan, category);


--
-- Name: v_association_scan_hostname v_association_scan_hostname_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_hostname
    ADD CONSTRAINT v_association_scan_hostname_pkey PRIMARY KEY (scan, hostname);


--
-- Name: v_category v_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_category
    ADD CONSTRAINT v_category_pkey PRIMARY KEY (id);


--
-- Name: v_hop v_hop_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hop
    ADD CONSTRAINT v_hop_pkey PRIMARY KEY (id);


--
-- Name: v_hostname v_hostname_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hostname
    ADD CONSTRAINT v_hostname_pkey PRIMARY KEY (id);


--
-- Name: v_port v_port_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_port
    ADD CONSTRAINT v_port_pkey PRIMARY KEY (id);


--
-- Name: v_scan v_scan_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_scan
    ADD CONSTRAINT v_scan_pkey PRIMARY KEY (id);


--
-- Name: v_script v_script_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_script
    ADD CONSTRAINT v_script_pkey PRIMARY KEY (port, name);


--
-- Name: v_tag v_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_tag
    ADD CONSTRAINT v_tag_pkey PRIMARY KEY (id);


--
-- Name: v_trace v_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_trace
    ADD CONSTRAINT v_trace_pkey PRIMARY KEY (id);


--
-- Name: ix_n_category_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_n_category_name ON public.n_category USING btree (name);


--
-- Name: ix_n_hop_domains; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hop_domains ON public.n_hop USING btree (domains);


--
-- Name: ix_n_hop_host; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hop_host ON public.n_hop USING btree (host);


--
-- Name: ix_n_hop_ipaddr_ttl; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hop_ipaddr_ttl ON public.n_hop USING btree (ipaddr, ttl);


--
-- Name: ix_n_hostname_domains; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hostname_domains ON public.n_hostname USING btree (domains);


--
-- Name: ix_n_hostname_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hostname_name ON public.n_hostname USING btree (name);


--
-- Name: ix_n_hostname_scan_name_type; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_n_hostname_scan_name_type ON public.n_hostname USING btree (scan, name, type);


--
-- Name: ix_n_hostname_type; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_hostname_type ON public.n_hostname USING btree (type);


--
-- Name: ix_n_port_scan_port; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_n_port_scan_port ON public.n_port USING btree (scan, port, protocol);


--
-- Name: ix_n_scan_host; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_scan_host ON public.n_scan USING btree (addr);


--
-- Name: ix_n_scan_info; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_scan_info ON public.n_scan USING gin (info);


--
-- Name: ix_n_scan_time; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_scan_time ON public.n_scan USING btree (time_start, time_stop);


--
-- Name: ix_n_script_data; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_script_data ON public.n_script USING gin (data);


--
-- Name: ix_n_script_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_n_script_name ON public.n_script USING btree (name);


--
-- Name: ix_n_script_port_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_n_script_port_name ON public.n_script USING btree (port, name);


--
-- Name: ix_n_tag_scan_value_info; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_n_tag_scan_value_info ON public.n_tag USING btree (scan, value, info);


--
-- Name: ix_passive_record; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_passive_record ON public.passive USING btree (addr, sensor, recontype, port, source, value, targetval, info) WHERE (addr IS NOT NULL);


--
-- Name: ix_passive_record_noaddr; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_passive_record_noaddr ON public.passive USING btree (sensor, recontype, port, source, value, targetval, info) WHERE (addr IS NULL);


--
-- Name: ix_v_category_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_category_name ON public.v_category USING btree (name);


--
-- Name: ix_v_hop_domains; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hop_domains ON public.v_hop USING btree (domains);


--
-- Name: ix_v_hop_host; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hop_host ON public.v_hop USING btree (host);


--
-- Name: ix_v_hop_ipaddr_ttl; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hop_ipaddr_ttl ON public.v_hop USING btree (ipaddr, ttl);


--
-- Name: ix_v_hostname_domains; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hostname_domains ON public.v_hostname USING btree (domains);


--
-- Name: ix_v_hostname_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hostname_name ON public.v_hostname USING btree (name);


--
-- Name: ix_v_hostname_scan_name_type; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_hostname_scan_name_type ON public.v_hostname USING btree (scan, name, type);


--
-- Name: ix_v_hostname_type; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_hostname_type ON public.v_hostname USING btree (type);


--
-- Name: ix_v_port_scan_port; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_port_scan_port ON public.v_port USING btree (scan, port, protocol);


--
-- Name: ix_v_scan_host; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_scan_host ON public.v_scan USING btree (addr);


--
-- Name: ix_v_scan_info; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_scan_info ON public.v_scan USING gin (info);


--
-- Name: ix_v_scan_time; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_scan_time ON public.v_scan USING btree (time_start, time_stop);


--
-- Name: ix_v_script_data; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_script_data ON public.v_script USING gin (data);


--
-- Name: ix_v_script_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE INDEX ix_v_script_name ON public.v_script USING btree (name);


--
-- Name: ix_v_script_port_name; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_script_port_name ON public.v_script USING btree (port, name);


--
-- Name: ix_v_tag_scan_value_info; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_tag_scan_value_info ON public.v_tag USING btree (scan, value, info);


--
-- Name: ix_v_trace_scan_port_proto; Type: INDEX; Schema: public; Owner: ivre
--

CREATE UNIQUE INDEX ix_v_trace_scan_port_proto ON public.v_trace USING btree (scan, port, protocol);


--
-- Name: n_association_scan_category n_association_scan_category_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_category
    ADD CONSTRAINT n_association_scan_category_category_fkey FOREIGN KEY (category) REFERENCES public.n_category(id) ON DELETE CASCADE;


--
-- Name: n_association_scan_category n_association_scan_category_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_category
    ADD CONSTRAINT n_association_scan_category_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: n_association_scan_hostname n_association_scan_hostname_hostname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_hostname
    ADD CONSTRAINT n_association_scan_hostname_hostname_fkey FOREIGN KEY (hostname) REFERENCES public.n_hostname(id) ON DELETE CASCADE;


--
-- Name: n_association_scan_hostname n_association_scan_hostname_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_association_scan_hostname
    ADD CONSTRAINT n_association_scan_hostname_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: n_hop n_hop_trace_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hop
    ADD CONSTRAINT n_hop_trace_fkey FOREIGN KEY (trace) REFERENCES public.n_trace(id) ON DELETE CASCADE;


--
-- Name: n_hostname n_hostname_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_hostname
    ADD CONSTRAINT n_hostname_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: n_port n_port_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_port
    ADD CONSTRAINT n_port_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: n_script n_script_port_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_script
    ADD CONSTRAINT n_script_port_fkey FOREIGN KEY (port) REFERENCES public.n_port(id) ON DELETE CASCADE;


--
-- Name: n_tag n_tag_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_tag
    ADD CONSTRAINT n_tag_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: n_trace n_trace_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.n_trace
    ADD CONSTRAINT n_trace_scan_fkey FOREIGN KEY (scan) REFERENCES public.n_scan(id) ON DELETE CASCADE;


--
-- Name: v_association_scan_category v_association_scan_category_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_category
    ADD CONSTRAINT v_association_scan_category_category_fkey FOREIGN KEY (category) REFERENCES public.v_category(id) ON DELETE CASCADE;


--
-- Name: v_association_scan_category v_association_scan_category_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_category
    ADD CONSTRAINT v_association_scan_category_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- Name: v_association_scan_hostname v_association_scan_hostname_hostname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_hostname
    ADD CONSTRAINT v_association_scan_hostname_hostname_fkey FOREIGN KEY (hostname) REFERENCES public.v_hostname(id) ON DELETE CASCADE;


--
-- Name: v_association_scan_hostname v_association_scan_hostname_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_association_scan_hostname
    ADD CONSTRAINT v_association_scan_hostname_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- Name: v_hop v_hop_trace_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hop
    ADD CONSTRAINT v_hop_trace_fkey FOREIGN KEY (trace) REFERENCES public.v_trace(id) ON DELETE CASCADE;


--
-- Name: v_hostname v_hostname_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_hostname
    ADD CONSTRAINT v_hostname_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- Name: v_port v_port_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_port
    ADD CONSTRAINT v_port_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- Name: v_script v_script_port_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_script
    ADD CONSTRAINT v_script_port_fkey FOREIGN KEY (port) REFERENCES public.v_port(id) ON DELETE CASCADE;


--
-- Name: v_tag v_tag_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_tag
    ADD CONSTRAINT v_tag_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- Name: v_trace v_trace_scan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivre
--

ALTER TABLE ONLY public.v_trace
    ADD CONSTRAINT v_trace_scan_fkey FOREIGN KEY (scan) REFERENCES public.v_scan(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

