CREATE TABLE client_details(
   account_id VARCHAR (50) UNIQUE NOT NULL,
   username VARCHAR (50) NOT NULL,
   amount integer CHECK (amount >= 0)
);

INSERT INTO client_details (account_id, username, amount)
values
	('674','Peter', 555),
	('675','Ihor', 600),
    ('676','Serhii', 1000);
  
   
select * from client_details;

ALTER SYSTEM SET max_prepared_transactions=6;
show max_prepared_transactions;

show max_connections;

SELECT COUNT(*) from pg_stat_activity;

COMMIT PREPARED 'update_acc';

ROLLBACK prepared 'update_hotel';

select *
from pg_stat_activity
where datname = 'fly_booking';


update client_details
set amount = amount + 400
where account_id = '674';