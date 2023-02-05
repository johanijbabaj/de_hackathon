create schema if not exists stg;

DROP TABLE if EXISTS  stg.events ;

CREATE TABLE stg.events (
	id serial PRIMARY KEY,
	value text NOT NULL
);


create schema if not exists sdn;

DROP TABLE if EXISTS  sdn.events ;

CREATE TABLE sdn.events (
	id serial PRIMARY KEY,
	event_timestamp timestamp without time zone NOT NULL,
	event_type text NOT NULL,
	page_url text NOT NULL,
	page_url_path text NOT NULL,
	referer_url text NOT NULL,
	referer_url_scheme text NOT NULL,
	referer_url_port text NOT NULL,
	referer_medium text NOT NULL,
	utm_medium text NOT NULL,
	utm_source text NOT NULL,
	utm_content text NOT NULL,
	utm_campaign text NOT NULL,
	click_id text NOT NULL,
	geo_latitude double precision NOT NULL,
	geo_longitude double precision NOT NULL,
	geo_country text NOT NULL,
	geo_timezone text NOT NULL,
	geo_region_name text NOT NULL,
	ip_address text NOT NULL,
	browser_name text NOT NULL,
	browser_user_agent text NOT NULL,
	browser_language text NOT NULL,
	os text NOT NULL,
	os_name text NOT NULL,
	os_timezone text NOT NULL,
	device_type text NOT NULL,
	device_is_mobile boolean NOT NULL,
	user_custom_id text NOT NULL,
	user_domain_id text NOT NULL
);




create schema if not exists dds;

DROP TABLE if EXISTS  dds.events ;

CREATE TABLE dds.events (
	id serial PRIMARY KEY,
	event_timestamp timestamp without time zone NOT NULL,
	event_type text NOT NULL,
	page_url text NOT NULL,
	page_url_path text NOT NULL,
	referer_url text NOT NULL,
	referer_url_scheme text NOT NULL,
	referer_url_port text NOT NULL,
	referer_medium text NOT NULL,
	utm_medium text NOT NULL,
	utm_source text NOT NULL,
	utm_content text NOT NULL,
	utm_campaign text NOT NULL,
	click_id text NOT NULL,
	geo_latitude double precision NOT NULL,
	geo_longitude double precision NOT NULL,
	geo_country text NOT NULL,
	geo_timezone text NOT NULL,
	geo_region_name text NOT NULL,
	ip_address text NOT NULL,
	browser_name text NOT NULL,
	browser_user_agent text NOT NULL,
	browser_language text NOT NULL,
	os text NOT NULL,
	os_name text NOT NULL,
	os_timezone text NOT NULL,
	device_type text NOT NULL,
	device_is_mobile boolean NOT NULL,
	user_custom_id text NOT NULL,
	user_domain_id text NOT NULL
);

