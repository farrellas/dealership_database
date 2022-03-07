CREATE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _age INTEGER,  _address VARCHAR, _email VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, age, address, email)
	VALUES(_customer_id, _first_name, _last_name, _age, _address, _email);
END;
$MAIN$ 
LANGUAGE plpgsql;

SELECT add_customer(1, 'Gary', 'Busey', 66, '123 Hollywood Blvd, Hollywood, CA', 'Gbusey69@gmail.com');
SELECT add_customer(2, 'Dave', 'Johnson', 19, '6 Main St, Los Alamos, NM', 'DJcool@gmail.com');
SELECT add_customer(3, 'Sean', 'Evans', 35, '987 Street Rd, Chicago, IL', 'Hotonez@gmail.com' );
SELECT add_customer(4, 'Alison', 'Smith', 58, '555 Google Blvd, Palo Alto, CA', 'Gmoneybaby@gmail.com');

CREATE FUNCTION add_car(_car_id INTEGER, _car_make VARCHAR, _car_model VARCHAR, _car_year INTEGER, _license_plate VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car(car_id, car_make, car_model, car_year, license_plate)
	VALUES(_car_id, _car_make, _car_model, _car_year, _license_plate);
END;
$MAIN$ 
LANGUAGE plpgsql;

SELECT add_car(1, 'Acura', 'Integra Type-R', 1999, 'INTR4L');
SELECT add_car(2, 'Subaru', 'WRX STI', 2005, 'REXXIN');
SELECT add_car(3, 'Ferrari', '488 GTB', 2017, 'BLNKCK');
SELECT add_car(4, 'BLNKCK', 'Sierra', 2011, 'BLKTRK');
SELECT add_car(5, 'Geo', 'Metro', 1996, 'VROOMR');
SELECT add_car(6, 'Tesla', 'S', 2021, 'NOGASS');

CREATE FUNCTION add_service_ticket(_service_id INTEGER, _customer_id INTEGER, _car_id INTEGER, _service_type VARCHAR, _service_description VARCHAR, _service_amount NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_ticket(service_id, customer_id, car_id, service_type, service_description, service_amount)
	VALUES(_service_id, _customer_id, _car_id, _service_type, _service_description, _service_amount);
END;
$MAIN$ 
LANGUAGE plpgsql;

SELECT add_service_ticket(1, 2, 6, 'Parts & Labor', 'Replace Blinker Fluid', 189.99);
SELECT add_service_ticket(2, 1, 4, 'Parts Only', 'Brakes', 249.99);
SELECT add_service_ticket(3, 4, 5, 'Parts & Labor', 'Replace tires & perform alignment', 800.00);
SELECT add_service_ticket(4, 3, 3, 'Parts & Labor', 'Oil Change', 399.99);

INSERT INTO salesperson (
    first_name,
    last_name
)VALUES(
    'Ron',
    'Burgundy'
),(
    'Todd',
    'Packer'
),(
    'Son',
    'Goku'
),(
    'Master',
    'Splinter'
);

INSERT INTO invoice (
    customer_id,
    sales_id,
    car_id,
    invoice_amount,
    invoice_date
)VALUES(
    1,
    4,
    1,
    29999.99,
    TO_DATE('2022-06-15', 'YYYY-MM-DD')
),(
    1,
    4,
    2,
    39999.99,
    TO_DATE('2022-06-17', 'YYYY-MM-DD')
),(
    3,
    1,
    3,
    150000.00,
    TO_DATE('2022-06-23', 'YYYY-MM-DD')
),(
    4,
    4,
    5,
    40000.00,
    TO_DATE('2022-06-30', 'YYYY-MM-DD')
);

INSERT INTO mechanic (
    first_name,
    last_name
)VALUES(
    'Jebadiah',
    'Stultzfus'
),(
    'Rick',
    'Pickle'
);

INSERT INTO service_ticket_mechanic (
    service_id,
    mechanic_id
)VALUES(
    1,
    2
),(
    1,
    1
),(
    2,
    2
),(
    3,
    2
),(
    3,
    1
),(
    4,
    1
),(
    2,
    1
);

INSERT INTO part (
    part_name,
    part_cost
)VALUES(
    'Blow-off Valve',
    99.99
),(
    'Off Roading Tires',
    600.00
),(
    'Blinker Fluid',
    150.00
),(
    'Brakes',
    249.99
),(
    'Ferrari Synthetic Oil',
    349.99
);

INSERT INTO service_part (
    part_id,
    service_id
)VALUES(
    2,
    3
),(
    3,
    1
),(
    4,
    2
),(
    5,
    4
);

INSERT INTO service_history (
    car_id,
    service_ticket
)VALUES(
    6,
    1
),(
    4,
    2
),(
    5,
    3
),(
    3,
    4
);














