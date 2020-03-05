CREATE TABLE client_details(
   booking_id VARCHAR (50) UNIQUE NOT NULL,
   client_name VARCHAR (50)  NOT NULL,
   hotel_name VARCHAR (50)  NOT null,
   arrival VARCHAR (50)  NOT NULL,
   departure VARCHAR (50)  NOT NULL
);

COMMIT PREPARED 'update_hotel';

select * from	 client_details;

TRUNCATE client_details;
