use Books;

DELIMITER \\

CREATE or replace PROCEDURE print_books()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE isbn varchar(20);
    DECLARE bookTitle varchar(250);

    DECLARE book_cursor CURSOR FOR
        select ISBN, Title from Book;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN book_cursor;
    
    read_loop: LOOP

        FETCH book_cursor INTO isbn, bookTitle;

        IF done THEN 
            LEAVE read_loop;
        END IF;

        
        #this is where we do something
        SELECT CONCAT_WS(': ', isbn, bookTitle) AS book;

    END LOOP;
CLOSE book_cursor;

END; //

CALL print_books;