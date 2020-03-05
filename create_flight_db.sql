CREATE TABLE client_details(
   booking_id VARCHAR (50) UNIQUE NOT NULL,
   client_name VARCHAR (50)  NOT NULL,
   from_location VARCHAR (50)  NOT NULL,
   to_location VARCHAR (50)  NOT NULL,
   flight_date VARCHAR (50)  NOT NULL
);

select * from client_details;


COMMIT PREPARED 'update_flight';

TRUNCATE client_details;


