-- Table: public.roles

-- DROP TABLE IF EXISTS public.roles;

CREATE TABLE IF NOT EXISTS public.roles
(
    roleid integer NOT NULL DEFAULT nextval('roles_roleid_seq'::regclass),
    rolename character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (roleid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.roles
    OWNER to postgres;