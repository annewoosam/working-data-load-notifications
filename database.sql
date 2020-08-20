SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE notifications
 (
	notification_id INTEGER,
	checklistid VARCHAR,
	datesenttoreview DATE,
	reviewerfullname VARCHAR,
	revieweremail VARCHAR,
	datereviewcomplete DATE,
	recipientfullname VARCHAR,
	recipientemail VARCHAR,
	datetorecipient DATE
);

ALTER TABLE notifications OWNER TO "vagrant";

CREATE SEQUENCE notifications_notification_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MINVALUE
	NO MAXVALUE
	CACHE 1;

ALTER TABLE notifications_notification_id_seq OWNER TO "vagrant";

ALTER SEQUENCE notifications_notification_id_seq OWNED BY notifications.notification_id;

ALTER TABLE ONLY notifications ALTER COLUMN notification_id SET DEFAULT nextval('notifications_notification_id_seq'::regclass);

COPY notifications
 (notification_id, checklistid, datesenttoreview, reviewerfullname, revieweremail, datereviewcomplete, recipientfullname, recipientemail, datetorecipient) FROM stdin;
1	1	2020-08-08	Strategic Arts	strategicartscollaborative@gmail.com	2020-08-09	Anne Woo-Sam	annewoosamcode@gmail.com	2020-08-10
\.
-- COPY notifications
--  (notification_id, checklistid, datesenttoreview, reviewerfullname, revieweremail)
-- 2	2	2020-08-09	Strategic Arts	strategicartscollaborative@gmail.com
-- \.
-- COPY notifications
--  (notification_id, checklistid, datesenttoreview)
-- 3	3	2020-08-10						
-- \.
-- Cover scenarios sent to recipient, assigned to review but not complete, not even out of prep

SELECT pg_catalog.setval('notifications_notification_id_seq', 12, true);

ALTER TABLE ONLY notifications

	ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;

