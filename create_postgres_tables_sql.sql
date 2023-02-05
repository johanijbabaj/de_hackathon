create schema if not exists stg;

DROP TABLE if EXISTS  stg.events ;

CREATE TABLE stg.events (
	id serial4 NOT NULL,
	"timestamp" timestamp NOT NULL,
	value text NOT NULL,
	CONSTRAINT events_pkey PRIMARY KEY (id)
);


create schema if not exists dds;

DROP TABLE if EXISTS  dds.events ;

CREATE TABLE dds.events (
	event_id text NOT null PRIMARY KEY,
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


insert into dds.events  (event_timestamp,
event_type,
page_url,
page_url_path,
referer_url,
referer_url_scheme,
referer_url_port,
referer_medium,
utm_medium,
utm_source,
utm_content,
utm_campaign,
click_id,
event_id,
geo_latitude,
geo_longitude,
geo_country,
geo_timezone,
geo_region_name,
ip_address,
browser_name,
browser_user_agent,
browser_language,
os,
os_name,
os_timezone,
device_type,
device_is_mobile,
user_custom_id,
user_domain_id)
(
select
TO_TIMESTAMP(((e.value::JSON)->>'event_timestamp'::varchar), 'YYYY-MM-DD HH24:MI:SSSS')::timestamp as event_timestamp,
((e.value::JSON)->>'event_type'::varchar) AS event_type,
((e.value::JSON)->>'page_url'::varchar) AS page_url,
((e.value::JSON)->>'page_url_path'::varchar) AS page_url_path,
((e.value::JSON)->>'referer_url'::varchar) AS referer_url,
((e.value::JSON)->>'referer_url_scheme'::varchar) AS referer_url_scheme,
((e.value::JSON)->>'referer_url_port'::varchar) AS referer_url_port,
((e.value::JSON)->>'referer_medium'::varchar) AS referer_medium,
((e.value::JSON)->>'utm_medium'::varchar) AS utm_medium,
((e.value::JSON)->>'utm_source'::varchar) AS utm_source,
((e.value::JSON)->>'utm_content'::varchar) AS utm_content,
((e.value::JSON)->>'utm_campaign'::varchar) AS utm_campaign,
((e.value::JSON)->>'click_id'::varchar) AS click_id,
((e.value::JSON)->>'event_id'::varchar) AS event_id,
((e.value::JSON)->>'geo_latitude'::varchar )::numeric AS geo_latitude,
((e.value::JSON)->>'geo_longitude'::varchar )::numeric AS geo_longitude,
((e.value::JSON)->>'geo_country'::varchar) AS geo_country,
((e.value::JSON)->>'geo_timezone'::varchar) AS geo_timezone ,
((e.value::JSON)->>'geo_region_name'::varchar) AS geo_region_name,
((e.value::JSON)->>'ip_address'::varchar) AS ip_address ,
((e.value::JSON)->>'browser_name'::varchar) AS browser_name,
((e.value::JSON)->>'browser_user_agent'::varchar) AS browser_user_agent,
((e.value::JSON)->>'browser_language'::varchar) AS browser_language,
((e.value::JSON)->>'os'::varchar) AS os,
((e.value::JSON)->>'os_name'::varchar) AS os_name,
((e.value::JSON)->>'os_timezone'::varchar) AS os_timezone,
((e.value::JSON)->>'device_type'::varchar) AS device_type,
((e.value::JSON)->>'device_is_mobile'::varchar )::boolean AS device_is_mobile,
((e.value::JSON)->>'user_custom_id'::varchar) AS user_custom_id,
((e.value::JSON)->>'user_domain_id'::varchar) AS user_domain_id
FROM stg.events e   )      
on conflict do nothing 


