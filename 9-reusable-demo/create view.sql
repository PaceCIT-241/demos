use Books;
create view OutstandingLoans as
    select ISBN, Title, Person, LoanedDate, 
    round(DATEDIFF(CURRENT_TIMESTAMP, LoanedDate)/7) as WeeksLoaned 
    from Loan JOIN Book on Loan.Book = Book.ISBN
    where ReturnedDate is null;

SELECT * FROM OutstandingLoans;