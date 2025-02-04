USE Books;

DELIMITER \\
create or replace PROCEDURE insertLoan(
    isbn varchar(20), 
    borrower varchar(250), 
    startDate date,
    out response VARCHAR(1000)
) 
begin
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
    @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
    SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
    -- SELECT @full_error;
    SET response = @full_error;
    END;

    # code that may cause errors
    insert into Loan (Book, Person, LoanedDate)
      values (isbn, borrower, startDate);
end //

call insertLoan('978-0998587516', 'EM' ,'2025-01-05', @response);
select @response;