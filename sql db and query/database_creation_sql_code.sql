--Create Database
--Create and Import Tables

DROP TABLE IF EXISTS public.order_details;

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

DROP TABLE IF EXISTS public.pizza_types;

CREATE TABLE pizza_types (
  pizza_type_id   VARCHAR(50) PRIMARY KEY,
  name            VARCHAR(50),
  category        VARCHAR(50),
  ingredients     TEXT
);

-- I tried to import this from .csv, it was not working, so here is a lot of work!

INSERT INTO pizza_types (pizza_type_id, name, category, ingredients)
VALUES
  ('ckn_alfredo', 'The Chicken Alfredo Pizza', 'Chicken', 'Chicken, Red Onions, Red Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce'),
  ('ckn_pesto', 'The Chicken Pesto Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Spinach, Garlic, Pesto Sauce'),
  ('southw_ckn', 'The Southwest Chicken Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Red Onions, Jalapeno Peppers, Corn, Cilantro, Chipotle Sauce'),
  ('thai_ckn', 'The Thai Chicken Pizza', 'Chicken', 'Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce'),
  ('big_meat', 'The Big Meat Pizza', 'Classic', 'Bacon, Pepperoni, Italian Sausage, Chorizo Sausage'),
  ('classic_dlx', 'The Classic Deluxe Pizza', 'Classic', 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon'),
  ('hawaiian', 'The Hawaiian Pizza', 'Classic', 'Sliced Ham, Pineapple, Mozzarella Cheese'),
  ('ital_cpcllo', 'The Italian Capocollo Pizza', 'Classic', 'Capocollo, Red Peppers, Tomatoes, Goat Cheese, Garlic, Oregano'),
  ('napolitana', 'The Napolitana Pizza', 'Classic', 'Tomatoes, Anchovies, Green Olives, Red Onions, Garlic'),
  ('pep_msh_pep', 'The Pepperoni, Mushroom, and Peppers Pizza', 'Classic', 'Pepperoni, Mushrooms, Green Peppers'),
  ('pepperoni', 'The Pepperoni Pizza', 'Classic', 'Mozzarella Cheese, Pepperoni'),
  ('the_greek', 'The Greek Pizza', 'Classic', 'Kalamata Olives, Feta Cheese, Tomatoes, Garlic, Beef Chuck Roast, Red Onions'),
  ('brie_carre', 'The Brie Carre Pizza', 'Supreme', 'Brie Carre Cheese, Prosciutto, Caramelized Onions, Pears, Thyme, Garlic'),
  ('calabrese', 'The Calabrese Pizza', 'Supreme', '‘Nduja Salami, Pancetta, Tomatoes, Red Onions, Friggitello Peppers, Garlic'),
  ('ital_supr', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
  ('peppr_salami', 'The Pepper Salami Pizza', 'Supreme', 'Genoa Salami, Capocollo, Pepperoni, Tomatoes, Asiago Cheese, Garlic'),
  ('prsc_argla', 'The Prosciutto and Arugula Pizza', 'Supreme', 'Prosciutto di San Daniele, Arugula, Mozzarella Cheese'),
  ('sicilian', 'The Sicilian Pizza', 'Supreme', 'Coarse Sicilian Salami, Tomatoes, Green Olives, Luganega Sausage, Onions, Garlic'),
  ('soppressata', 'The Soppressata Pizza', 'Supreme', 'Soppressata Salami, Fontina Cheese, Mozzarella Cheese, Mushrooms, Garlic'),
  ('spicy_ital', 'The Spicy Italian Pizza', 'Supreme', 'Capocollo, Tomatoes, Goat Cheese, Artichokes, Peperoncini verdi, Garlic'),
  ('spinach_supr', 'The Spinach Supreme Pizza', 'Supreme', 'Spinach, Red Onions, Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago Cheese'),
  ('five_cheese', 'The Five Cheese Pizza', 'Veggie', 'Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic'),
  ('four_cheese', 'The Four Cheese Pizza', 'Veggie', 'Ricotta Cheese, Gorgonzola Piccante Cheese, Mozzarella Cheese, Parmigiano Reggiano Cheese, Garlic'),
  ('green_garden', 'The Green Garden Pizza', 'Veggie', 'Spinach, Mushrooms, Tomatoes, Green Olives, Feta Cheese'),
  ('ital_veggie', 'The Italian Vegetables Pizza', 'Veggie', 'Eggplant, Artichokes, Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce'),
  ('mediterraneo', 'The Mediterranean Pizza', 'Veggie', 'Spinach, Artichokes, Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Plum Tomatoes, Red Onions'),
  ('mexicana', 'The Mexicana Pizza', 'Veggie', 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic'),
  ('spin_pesto', 'The Spinach Pesto Pizza', 'Veggie', 'Spinach, Artichokes, Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce'),
  ('spinach_fet', 'The Spinach and Feta Pizza', 'Veggie', 'Spinach, Mushrooms, Red Onions, Feta Cheese, Garlic'),
  ('veggie_veg', 'The Vegetables + Vegetables Pizza', 'Veggie', 'Mushrooms, Tomatoes, Red Peppers, Green Peppers, Red Onions, Zucchini, Spinach, Garlic')
;

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
	
-- Join Tables
SELECT *
FROM orders
JOIN order_details
ON orders."order_id"=order_details."order_id"
JOIN pizzas
ON pizzas."pizza_id"=order_details."pizza_id"
JOIN pizza_types
ON pizza_types."pizza_type_id"=pizzas."pizza_type_id";

--Save Joined Table as all_pizza_sales.csv

--Create the joined table to run exploratory SQL queries
DROP TABLE IF EXISTS all_pizza_data;

CREATE TABLE all_pizza_data (
  order_id INT,
  date DATE,
  time TIME,
  order_details_id INT,
  order_id_2 INT,
  pizza_id VARCHAR(50),
  quantity INT,
  pizza_id_2 VARCHAR(50),
  pizza_type_id VARCHAR(50),
  size VARCHAR(3),
  price NUMERIC(8, 2),
  pizza_type_id_2 VARCHAR(50),
  name VARCHAR(50),
  category VARCHAR(50),
  ingredients TEXT
);

COPY all_pizza_data (order_id, "date", "time", order_details_id, order_id_2, pizza_id, quantity, pizza_id_2, pizza_type_id, size, price, pizza_type_id_2, name, category, ingredients)
FROM 'C:\Users\Matthew Phelps\Desktop\Data Projects\Maven Pizza Dashboard\datasets\pizza_sales\all_pizza_data.csv'
DELIMITER ',' CSV HEADER;