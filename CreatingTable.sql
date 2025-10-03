CREATE TABLE booking (
    "Date" TEXT,
    "Time" TEXT,
    "Booking ID" TEXT,
    "Booking Status" TEXT,
    "Customer ID" TEXT,
    "Vehicle Type" TEXT,
    "Pickup Location" TEXT,
    "Drop Location" TEXT,
    "Avg VTAT" TEXT,
    "Avg CTAT" TEXT,
    "Cancelled Rides by Customer" TEXT,
    "Reason for cancelling by Customer" TEXT,
    "Cancelled Rides by Driver" TEXT,
    "Driver Cancellation Reason" TEXT,
    "Incomplete Rides" TEXT,
    "Incomplete Rides Reason" TEXT,
    "Booking Value" TEXT,
    "Ride Distance" TEXT,
    "Driver Ratings" TEXT,
    "Customer Rating" TEXT,
    "Payment Method" TEXT
);


SELECT *
FROM booking
LIMIT 5;

--Renaming the Columns
ALTER TABLE booking 
RENAME COLUMN "Date" to booking_date;

ALTER TABLE booking
RENAME COLUMN "Time" to booking_time;

ALTER TABLE booking
RENAME COLUMN "Booking ID"  to booking_id;

ALTER TABLE booking
RENAME COLUMN "Booking Status" to booking_status;

ALTER TABLE booking
RENAME COLUMN "Customer ID" to customer_id;

ALTER TABLE booking
RENAME COLUMN "Vehicle Type" to vehicle_type;

ALTER TABLE booking
RENAME COLUMN "Pickup Location" to pickup_location;

ALTER TABLE booking
RENAME COLUMN "Drop Location" to drop_location;

ALTER TABLE booking
RENAME COLUMN "Avg VTAT" to avg_vtat;

ALTER TABLE booking
RENAME COLUMN "Avg CTAT" to avg_ctat;

ALTER TABLE booking
RENAME COLUMN "Cancelled Rides by Customer" TO cancelled_by_customer;

ALTER TABLE booking
RENAME COLUMN "Reason for cancelling by Customer" TO cancel_reason_customer;

ALTER TABLE booking
RENAME COLUMN "Cancelled Rides by Driver" TO cancelled_by_driver;

ALTER TABLE booking
RENAME COLUMN "Driver Cancellation Reason" TO cancel_reason_driver;

ALTER TABLE booking
RENAME COLUMN "Incomplete Rides" TO incomplete_ride;

ALTER TABLE booking
RENAME COLUMN "Incomplete Rides Reason" TO incomplete_reason;

ALTER TABLE booking
RENAME COLUMN "Booking Value" TO booking_value;

ALTER TABLE booking
RENAME COLUMN "Ride Distance" TO ride_distance;

ALTER TABLE booking
RENAME COLUMN "Driver Ratings" TO driver_rating;

ALTER TABLE booking
RENAME COLUMN "Customer Rating" TO customer_rating;

ALTER TABLE booking
RENAME COLUMN "Payment Method" TO payment_method;

--Changing Type of the Columns
ALTER TABLE booking
ALTER COLUMN booking_date TYPE DATE
USING TO_DATE(booking_date, 'YYYY-MM-DD');

ALTER TABLE booking
ALTER COLUMN booking_time TYPE TIME
USING TO_TIMESTAMP(booking_time, 'HH24:MI:SS')::TIME;

ALTER TABLE booking
ALTER COLUMN avg_vtat TYPE NUMERIC
USING NULLIF(NULLIF(avg_vtat ,''), 'null')::NUMERIC;

ALTER TABLE booking
ALTER COLUMN avg_ctat TYPE NUMERIC
USING NULLIF(NULLIF(avg_ctat ,''), 'null')::NUMERIC;

ALTER TABLE booking
ALTER COLUMN cancelled_by_customer TYPE BOOLEAN
USING (cancelled_by_customer ILIKE '1');

ALTER TABLE booking
ALTER COLUMN cancelled_by_driver TYPE BOOLEAN
USING (cancelled_by_driver ILIKE '1');

ALTER TABLE booking
ALTER COLUMN incomplete_ride TYPE BOOLEAN
USING (incomplete_ride ILIKE '1');

ALTER TABLE booking
ALTER COLUMN booking_value TYPE NUMERIC
USING NULLIF(NULLIF(booking_value, ''), 'null')::NUMERIC;

ALTER TABLE booking
ALTER COLUMN ride_distance TYPE NUMERIC
USING NULLIF(NULLIF(ride_distance, ''), 'null')::NUMERIC;

ALTER TABLE booking
ALTER COLUMN driver_rating TYPE NUMERIC
USING NULLIF(NULLIF(driver_rating, ''), 'null')::NUMERIC;

ALTER TABLE booking
ALTER COLUMN customer_rating TYPE NUMERIC
USING NULLIF(NULLIF(customer_rating, ''), 'null')::NUMERIC;

