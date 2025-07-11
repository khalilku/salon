--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    "time" character varying(40) NOT NULL,
    customer_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.appointments OWNER TO freecodecamp;

--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.appointment_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_appointment_id_seq OWNER TO freecodecamp;

--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.appointment_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(15),
    name character varying(40) NOT NULL
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.services OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointment_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.appointments VALUES (118, '', 63, 1);
INSERT INTO public.appointments VALUES (195, '', 63, 1);
INSERT INTO public.appointments VALUES (123, '9:30am', 92, 3);
INSERT INTO public.appointments VALUES (124, '1:00am', 92, 3);
INSERT INTO public.appointments VALUES (125, '1pm', 93, 4);
INSERT INTO public.appointments VALUES (128, '', 63, 1);
INSERT INTO public.appointments VALUES (202, '', 63, 1);
INSERT INTO public.appointments VALUES (135, '', 63, 1);
INSERT INTO public.appointments VALUES (80, '', 63, 1);
INSERT INTO public.appointments VALUES (209, '', 63, 1);
INSERT INTO public.appointments VALUES (142, '', 63, 1);
INSERT INTO public.appointments VALUES (87, '10am', 68, 1);
INSERT INTO public.appointments VALUES (89, '5pm', 69, 2);
INSERT INTO public.appointments VALUES (214, '1pm', 124, 4);
INSERT INTO public.appointments VALUES (93, '', 63, 1);
INSERT INTO public.appointments VALUES (149, '', 63, 1);
INSERT INTO public.appointments VALUES (42, '11am', 31, 3);
INSERT INTO public.appointments VALUES (101, '3pm', 76, 5);
INSERT INTO public.appointments VALUES (104, '', 63, 1);
INSERT INTO public.appointments VALUES (156, '', 63, 1);
INSERT INTO public.appointments VALUES (49, '12pm', 37, 5);
INSERT INTO public.appointments VALUES (51, '2pm', 37, 2);
INSERT INTO public.appointments VALUES (111, '', 63, 1);
INSERT INTO public.appointments VALUES (163, '', 63, 1);
INSERT INTO public.appointments VALUES (168, '10:30', 124, 1);
INSERT INTO public.appointments VALUES (171, '', 63, 1);
INSERT INTO public.appointments VALUES (176, '10:30', 124, 1);
INSERT INTO public.appointments VALUES (179, '', 63, 1);
INSERT INTO public.appointments VALUES (184, '10:30am', 124, 1);
INSERT INTO public.appointments VALUES (185, '1pm', 124, 1);
INSERT INTO public.appointments VALUES (188, '', 63, 1);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (124, '555-555-5555', 'Fabio');
INSERT INTO public.customers VALUES (63, '', '');
INSERT INTO public.customers VALUES (68, '222-2222', 'Jaja');
INSERT INTO public.customers VALUES (69, '999-9999', 'Batang');
INSERT INTO public.customers VALUES (76, '888-888-8888', 'AjAj');
INSERT INTO public.customers VALUES (31, '333-3333', 'Khan');
INSERT INTO public.customers VALUES (37, '111-1111', 'Khwaja');
INSERT INTO public.customers VALUES (92, '444-444-4444', 'Fabiooo');
INSERT INTO public.customers VALUES (93, '111-111-1111', 'Koko');
INSERT INTO public.customers VALUES (156, '1', '555-5555');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'cut');
INSERT INTO public.services VALUES (2, 'color');
INSERT INTO public.services VALUES (3, 'perm');
INSERT INTO public.services VALUES (4, 'style');
INSERT INTO public.services VALUES (5, 'trim');


--
-- Name: appointment_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointment_appointment_id_seq', 219, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 159, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 1, false);


--
-- Name: appointments appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

