CREATE OR REPLACE PROCEDURE add_late_fee(
    p_id INTEGER,
    feeAmount NUMERIC(4,2)
)
LANGUAGE plpgsql
AS
$$
BEGIN
    -- code body goes here
    UPDATE payment
    SET amount = amount + feeAmount
    WHERE payment_id = p_id;
    

    -- you can do as many updates or insert as you like
    -- once you are done, commit these as a single transaction
    COMMIT;


END
$$
;

-- call a stored procedure
SELECT * FROM payment WHERE amount < 0;
CALL add_late_fee(18495, 90.00)
SELECT * FROM payment WHERE payment_id = 18495;


CREATE OR REPLACE FUNCTION add_actor(
    a_id INTEGER,
    f_name VARCHAR(45),
    l_name VARCHAR(45)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    -- code goes here
    INSERT INTO actor(actor_id, first_name, last_name, last_update)
    VALUES(a_id, f_name, l_name, NOW()::TIMESTAMP);



    -- end
END
$MAIN$
;

-- call a function using the SELECT keyword instead of CALL
SELECT * FROM actor ORDER BY actor_id DESC;
SELECT add_actor(555,'Benedict', 'Cumberbatch')

