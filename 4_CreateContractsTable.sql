-- Table: public.contracts

-- DROP TABLE IF EXISTS public.contracts;

CREATE TABLE IF NOT EXISTS public.contracts
(
    contractid integer NOT NULL DEFAULT nextval('contracts_contractid_seq'::regclass),
    movieid integer,
    unionid integer,
    salary numeric(10,2) NOT NULL,
    CONSTRAINT contracts_pkey PRIMARY KEY (contractid),
    CONSTRAINT contracts_movieid_fkey FOREIGN KEY (movieid)
        REFERENCES public.movies (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT contracts_unionid_fkey FOREIGN KEY (unionid)
        REFERENCES public.people (unionid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contracts
    OWNER to postgres;