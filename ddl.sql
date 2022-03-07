CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INTEGER,
  address VARCHAR(150),
  email VARCHAR(50)
);

CREATE TABLE salesperson (
  sales_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  sales_id INTEGER NOT NULL,
  car_id INTEGER,
  invoice_amount NUMERIC(8,2),
  invoice_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (sales_id) REFERENCES salesperson(sales_id)
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  car_make VARCHAR(50),
  car_model VARCHAR(50),
  car_year INTEGER,
  license_plate VARCHAR(6)
);

CREATE TABLE service_ticket (
  service_id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  car_id INTEGER NOT NULL,
  service_type VARCHAR(50),
  service_description VARCHAR(500),
  service_amount NUMERIC(6,2),
  FOREIGN KEY (car_id) REFERENCES car(car_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE service_ticket_mechanic (
  service_mechanic_id SERIAL PRIMARY KEY,
  service_id INTEGER NOT NULL,
  mechanic_id INTEGER NOT NULL,
  FOREIGN KEY (service_id) REFERENCES service_ticket(service_id),
  FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE part (
  part_id SERIAL PRIMARY KEY,
  part_name VARCHAR(50),
  part_cost NUMERIC(6,2)
);

CREATE TABLE service_part (
  service_part_id SERIAL PRIMARY KEY,
  part_id INTEGER NOT NULL,
  service_id INTEGER NOT NULL,
  FOREIGN KEY (part_id) REFERENCES part(part_id),
  FOREIGN KEY (service_id) REFERENCES service_ticket(service_id)
);

CREATE TABLE service_history (
  history_id SERIAL PRIMARY KEY,
  car_id INTEGER NOT NULL,
  service_ticket INTEGER NOT NULL,
  FOREIGN KEY (car_id) REFERENCES car(car_id),
  FOREIGN KEY (service_ticket) REFERENCES service_ticket(service_id)
);



