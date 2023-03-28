## Data Import 

Create Tables in SQL
```bash
-- Table: public.order_details

-- DROP TABLE IF EXISTS public.order_details;

CREATE TABLE IF NOT EXISTS public.order_details
(
    order_details_id integer NOT NULL,
    order_id integer,
    pizza_id character varying COLLATE pg_catalog."default",
    quantity integer,
    CONSTRAINT order_details_pkey PRIMARY KEY (order_details_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_details
    OWNER to postgres;

-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL,
    date date,
    "time" time without time zone,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;

-- Table: public.pizza_types

-- DROP TABLE IF EXISTS public.pizza_types;

CREATE TABLE IF NOT EXISTS public.pizza_types
(
    pizza_type_id character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default",
    category character varying COLLATE pg_catalog."default",
    ingredients character varying COLLATE pg_catalog."default",
    CONSTRAINT pizza_types_pkey PRIMARY KEY (pizza_type_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pizza_types
    OWNER to postgres;

-- Table: public.pizzas

-- DROP TABLE IF EXISTS public.pizzas;

CREATE TABLE IF NOT EXISTS public.pizzas
(
    pizza_id character varying COLLATE pg_catalog."default" NOT NULL,
    pizza_type_id character varying COLLATE pg_catalog."default",
    size character varying COLLATE pg_catalog."default",
    price numeric,
    CONSTRAINT pizzas_pkey PRIMARY KEY (pizza_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pizzas
    OWNER to postgres;
```
## Join Tables

Joined orders, order_details, pizzas, and pizza_type tables.

```bash
SELECT *
FROM orders
JOIN order_details
ON orders."order_id"=order_details."order_id"
JOIN pizzas
ON pizzas."pizza_id"=order_details."pizza_id"
JOIN pizza_types
ON pizza_types."pizza_type_id"=pizzas."pizza_type_id";
```

Then save file as "all_pizza_data.csv" file 