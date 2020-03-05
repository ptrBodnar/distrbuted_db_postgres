import psycopg2
from sqlalchemy import * 
from sqlalchemy.orm import sessionmaker
import pandas as pd

# тут я ініціюю з'єднання з моєїми базами за допомогою ключів, які зберігаються у мене
# локально на комп'ютер

acc = psycopg2.connect(open('acc_keys.txt', 'r').read())
acc.set_isolation_level(0)
cur_acc = acc.cursor()

hotel = psycopg2.connect(open('hotel_keys.txt', 'r').read())
hotel.set_isolation_level(0)
cur_hotel = hotel.cursor()


flight = psycopg2.connect(open('flight_keys.txt', 'r').read())
flight.set_isolation_level(0)
cur_flight = flight.cursor()

try: 
    print('1')
    cur_acc.execute("""
        BEGIN;
        update client_details
        set amount = amount - 100
        where account_id = '674';

        PREPARE TRANSACTION 'update_acc';
    """)


    print('2')

    cur_hotel.execute("""
        BEGIN;

        INSERT INTO client_details (booking_id, client_name, hotel_name, arrival, departure)
        values
            ('123','Peter', 'Kyiv', '01.12.2020', '12.03.2020');
        
        PREPARE TRANSACTION 'update_hotel';
	""")

    print('3')


    cur_flight.execute("""
    BEGIN;

    INSERT INTO client_details (booking_id, client_name, from_location, to_location, flight_date)
    values
        ('121','Peter', 'Lviv', 'Kyiv', '01.12.2020');

    PREPARE TRANSACTION 'update_flight';
    """)
    print('3')


except Exception as e:
	print(e)
	cur_acc.execute("ROLLBACK PREPARED 'update_acc'")
	cur_hotel.execute("ROLLBACK prepared 'update_hotel'")
	cur_flight.execute("ROLLBACK prepared 'update_flight'")

else:
	print('and here')
	cur_acc.execute("COMMIT PREPARED 'update_acc'")
	cur_hotel.execute("COMMIT PREPARED 'update_hotel'")
	cur_flight.execute("COMMIT PREPARED 'update_flight'")

