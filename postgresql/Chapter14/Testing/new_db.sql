--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: car_portal_app; Type: SCHEMA; Schema: -; Owner: car_portal_app
--

CREATE SCHEMA car_portal_app;


ALTER SCHEMA car_portal_app OWNER TO car_portal_app;

--
-- Name: pgtap; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgtap WITH SCHEMA car_portal_app;


--
-- Name: EXTENSION pgtap; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgtap IS 'Unit testing for PostgreSQL';


--
-- Name: increment_counter(); Type: FUNCTION; Schema: car_portal_app; Owner: car_portal_app
--

CREATE FUNCTION car_portal_app.increment_counter() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO counter_table SELECT count(*), now() FROM counter_table;
END;
$$;


ALTER FUNCTION car_portal_app.increment_counter() OWNER TO car_portal_app;

--
-- Name: test_increment(); Type: PROCEDURE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE PROCEDURE car_portal_app.test_increment()
    LANGUAGE plpgsql
    AS $$
DECLARE
  c int; m int;
  msg_text text; exception_detail text; exception_hint text;
BEGIN
  RAISE NOTICE '1..3';
  -- Test 1. Call increment function
  BEGIN
    PERFORM increment_counter();
    RAISE NOTICE 'ok 1 - Call increment function';
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'not ok 1 - Call increment function';
    GET STACKED DIAGNOSTICS 
      msg_text = MESSAGE_TEXT,
      exception_detail = PG_EXCEPTION_DETAIL,
      exception_hint = PG_EXCEPTION_HINT;        
    RAISE NOTICE 'Exception: % % %', msg_text, exception_detail, exception_hint;
  END;
  -- Test 2. The results are correct for the first record
  BEGIN
    SELECT COUNT(*), MAX(counter) INTO c, m FROM counter_table;
    IF NOT (c = 1 AND m = 0) THEN
      RAISE EXCEPTION 'Test 2: wrong values in output data for the first record';
    END IF;
    RAISE NOTICE 'ok 2 - The results are correct for the first record';
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'not ok 2 - The results are correct for the first record';
    GET STACKED DIAGNOSTICS 
      msg_text = MESSAGE_TEXT,
      exception_detail = PG_EXCEPTION_DETAIL,
      exception_hint = PG_EXCEPTION_HINT;        
    RAISE NOTICE 'Exception: % % %', msg_text, exception_detail, exception_hint;
  END;
  -- Test 3. The results are correct for the second record
  BEGIN
    PERFORM increment_counter();
    SELECT COUNT(*), MAX(counter) INTO c, m FROM counter_table;
    IF NOT (c = 2 AND m = 1) THEN
      RAISE EXCEPTION 'Test 3: wrong values in output data for the second record';
    END IF;
    RAISE NOTICE 'ok 3 - The results are correct for the second record';
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'not ok 3 - The results are correct for the second record';
    GET STACKED DIAGNOSTICS 
      msg_text = MESSAGE_TEXT,
      exception_detail = PG_EXCEPTION_DETAIL,
      exception_hint = PG_EXCEPTION_HINT;        
    RAISE NOTICE 'Exception: % % %', msg_text, exception_detail, exception_hint;
  END;
  ROLLBACK;
END;
$$;


ALTER PROCEDURE car_portal_app.test_increment() OWNER TO car_portal_app;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.account (
    account_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    CONSTRAINT account_check CHECK (((first_name !~ '\s'::text) AND (last_name !~ '\s'::text))),
    CONSTRAINT account_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text)),
    CONSTRAINT account_password_check CHECK ((char_length(password) >= 8))
);


ALTER TABLE car_portal_app.account OWNER TO car_portal_app;

--
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.account ALTER COLUMN account_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account_history; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.account_history (
    account_history_id bigint NOT NULL,
    account_id integer NOT NULL,
    search_key text NOT NULL,
    search_date date NOT NULL
);


ALTER TABLE car_portal_app.account_history OWNER TO car_portal_app;

--
-- Name: account_history_account_history_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.account_history ALTER COLUMN account_history_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.account_history_account_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: advertisement; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.advertisement (
    advertisement_id integer NOT NULL,
    advertisement_date timestamp with time zone NOT NULL,
    car_id integer NOT NULL,
    seller_account_id integer NOT NULL
);


ALTER TABLE car_portal_app.advertisement OWNER TO car_portal_app;

--
-- Name: advertisement_advertisement_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.advertisement ALTER COLUMN advertisement_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.advertisement_advertisement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: advertisement_picture; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.advertisement_picture (
    advertisement_picture_id integer NOT NULL,
    advertisement_id integer,
    picture_location text
);


ALTER TABLE car_portal_app.advertisement_picture OWNER TO car_portal_app;

--
-- Name: advertisement_picture_advertisement_picture_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.advertisement_picture ALTER COLUMN advertisement_picture_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.advertisement_picture_advertisement_picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: advertisement_rating; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.advertisement_rating (
    advertisement_rating_id integer NOT NULL,
    advertisement_id integer NOT NULL,
    account_id integer NOT NULL,
    advertisement_rating_date date NOT NULL,
    rank integer NOT NULL,
    review text NOT NULL,
    CONSTRAINT advertisement_rating_rank_check CHECK ((rank = ANY (ARRAY[1, 2, 3, 4, 5]))),
    CONSTRAINT advertisement_rating_review_check CHECK ((char_length(review) <= 200))
);


ALTER TABLE car_portal_app.advertisement_rating OWNER TO car_portal_app;

--
-- Name: advertisement_rating_advertisement_rating_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.advertisement_rating ALTER COLUMN advertisement_rating_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.advertisement_rating_advertisement_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: car; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.car (
    car_id integer NOT NULL,
    number_of_owners integer NOT NULL,
    registration_number text NOT NULL,
    manufacture_year integer NOT NULL,
    number_of_doors integer DEFAULT 5 NOT NULL,
    car_model_id integer NOT NULL,
    mileage integer,
    insert_date timestamp with time zone DEFAULT now()
);


ALTER TABLE car_portal_app.car OWNER TO car_portal_app;

--
-- Name: car_car_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.car ALTER COLUMN car_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.car_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: car_model; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.car_model (
    car_model_id integer NOT NULL,
    make text,
    model text
);


ALTER TABLE car_portal_app.car_model OWNER TO car_portal_app;

--
-- Name: car_model_car_model_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.car_model ALTER COLUMN car_model_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.car_model_car_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counter_table; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.counter_table (
    counter integer,
    insert_time timestamp with time zone NOT NULL
);


ALTER TABLE car_portal_app.counter_table OWNER TO car_portal_app;

--
-- Name: favorite_advertisement; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.favorite_advertisement (
    account_id integer NOT NULL,
    advertisement_id integer NOT NULL
);


ALTER TABLE car_portal_app.favorite_advertisement OWNER TO car_portal_app;

--
-- Name: seller_account; Type: TABLE; Schema: car_portal_app; Owner: car_portal_app
--

CREATE TABLE car_portal_app.seller_account (
    seller_account_id integer NOT NULL,
    account_id integer NOT NULL,
    total_rank double precision,
    number_of_advertisement integer,
    street_name text NOT NULL,
    street_number text NOT NULL,
    zip_code text NOT NULL,
    city text NOT NULL
);


ALTER TABLE car_portal_app.seller_account OWNER TO car_portal_app;

--
-- Name: seller_account_seller_account_id_seq; Type: SEQUENCE; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE car_portal_app.seller_account ALTER COLUMN seller_account_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME car_portal_app.seller_account_seller_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account account_email_key; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- Name: account_history account_history_account_id_search_key_search_date_key; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.account_history
    ADD CONSTRAINT account_history_account_id_search_key_search_date_key UNIQUE (account_id, search_key, search_date);


--
-- Name: account_history account_history_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.account_history
    ADD CONSTRAINT account_history_pkey PRIMARY KEY (account_history_id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);


--
-- Name: advertisement_picture advertisement_picture_picture_location_key; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_picture
    ADD CONSTRAINT advertisement_picture_picture_location_key UNIQUE (picture_location);


--
-- Name: advertisement_picture advertisement_picture_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_picture
    ADD CONSTRAINT advertisement_picture_pkey PRIMARY KEY (advertisement_picture_id);


--
-- Name: advertisement advertisement_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement
    ADD CONSTRAINT advertisement_pkey PRIMARY KEY (advertisement_id);


--
-- Name: advertisement_rating advertisement_rating_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_rating
    ADD CONSTRAINT advertisement_rating_pkey PRIMARY KEY (advertisement_rating_id);


--
-- Name: car_model car_model_make_model_key; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.car_model
    ADD CONSTRAINT car_model_make_model_key UNIQUE (make, model);


--
-- Name: car_model car_model_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.car_model
    ADD CONSTRAINT car_model_pkey PRIMARY KEY (car_model_id);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_id);


--
-- Name: car car_registration_number_key; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.car
    ADD CONSTRAINT car_registration_number_key UNIQUE (registration_number);


--
-- Name: favorite_advertisement favorite_advertisement_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.favorite_advertisement
    ADD CONSTRAINT favorite_advertisement_pkey PRIMARY KEY (account_id, advertisement_id);


--
-- Name: seller_account seller_account_pkey; Type: CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.seller_account
    ADD CONSTRAINT seller_account_pkey PRIMARY KEY (seller_account_id);


--
-- Name: account_history account_history_account_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.account_history
    ADD CONSTRAINT account_history_account_id_fkey FOREIGN KEY (account_id) REFERENCES car_portal_app.account(account_id);


--
-- Name: advertisement advertisement_car_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement
    ADD CONSTRAINT advertisement_car_id_fkey FOREIGN KEY (car_id) REFERENCES car_portal_app.car(car_id);


--
-- Name: advertisement_picture advertisement_picture_advertisement_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_picture
    ADD CONSTRAINT advertisement_picture_advertisement_id_fkey FOREIGN KEY (advertisement_id) REFERENCES car_portal_app.advertisement(advertisement_id);


--
-- Name: advertisement_rating advertisement_rating_account_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_rating
    ADD CONSTRAINT advertisement_rating_account_id_fkey FOREIGN KEY (account_id) REFERENCES car_portal_app.account(account_id);


--
-- Name: advertisement_rating advertisement_rating_advertisement_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement_rating
    ADD CONSTRAINT advertisement_rating_advertisement_id_fkey FOREIGN KEY (advertisement_id) REFERENCES car_portal_app.advertisement(advertisement_id);


--
-- Name: advertisement advertisement_seller_account_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.advertisement
    ADD CONSTRAINT advertisement_seller_account_id_fkey FOREIGN KEY (seller_account_id) REFERENCES car_portal_app.seller_account(seller_account_id);


--
-- Name: car car_car_model_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.car
    ADD CONSTRAINT car_car_model_id_fkey FOREIGN KEY (car_model_id) REFERENCES car_portal_app.car_model(car_model_id);


--
-- Name: favorite_advertisement favorite_advertisement_account_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.favorite_advertisement
    ADD CONSTRAINT favorite_advertisement_account_id_fkey FOREIGN KEY (account_id) REFERENCES car_portal_app.account(account_id);


--
-- Name: favorite_advertisement favorite_advertisement_advertisement_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.favorite_advertisement
    ADD CONSTRAINT favorite_advertisement_advertisement_id_fkey FOREIGN KEY (advertisement_id) REFERENCES car_portal_app.advertisement(advertisement_id);


--
-- Name: seller_account seller_account_account_id_fkey; Type: FK CONSTRAINT; Schema: car_portal_app; Owner: car_portal_app
--

ALTER TABLE ONLY car_portal_app.seller_account
    ADD CONSTRAINT seller_account_account_id_fkey FOREIGN KEY (account_id) REFERENCES car_portal_app.account(account_id);


--
-- PostgreSQL database dump complete
--

