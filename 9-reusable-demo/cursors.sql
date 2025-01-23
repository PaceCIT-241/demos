use Books;

DELIMITER \\

CREATE or replace PROCEDURE print_books(out response VARCHAR(1000))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE id varchar(20);
    DECLARE bookTitle varchar(250);

    DECLARE book_cursor CURSOR FOR
        select ISBN, Title from Book;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET response = cast("" as VARCHAR(1000));

    OPEN book_cursor;
    
    read_loop: LOOP

        FETCH book_cursor INTO id, bookTitle;

        IF done THEN 
            LEAVE read_loop;
        END IF;

        #this is where we do something
        SET response = CONCAT_WS('\n', response, CONCAT_WS(': ', id, bookTitle));

    END LOOP;
    CLOSE book_cursor;

END; //

CALL print_books(@output);
select @output;

select ISBN, Title from Book;