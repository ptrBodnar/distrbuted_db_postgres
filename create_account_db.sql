-- тут я створював базу даних
/*create database account;
create database fly_booking;
create database hotel_booking;*/

-- тут я створював таблицю і ставив обмеження
CREATE TABLE client_details(
   account_id VARCHAR (50) UNIQUE NOT NULL,
   username VARCHAR (50) NOT NULL,
   amount integer CHECK (amount >= 0)
);

-- тут я перевіряв наявність заблокованої транзакції
SELECT * FROM pg_prepared_xacts WHERE database='account';

-- таким чином я закривав транзакцію, що зависла на Wait
COMMIT PREPARED 'update_acc'
