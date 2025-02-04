create user 'TestLogin'@'localhost' identified by 'testlogin,sDBpw0';
select User from mysql.user;

-- drop user 'TestLogin'@'localhost';

grant insert, select, update on Author.* to 'TestLogin'@'localhost'; 

flush PRIVILEGES

show grants for 'TestLogin'@'localhost';

revoke insert, update on Author.* from 'TestLogin'@'localhost';

create role librarian;

grant select, insert, update on *.* to librarian;

select * from mysql.roles_mapping;

grant librarian to 'TestLogin'@'localhost';

-- note that testlogin might need to set their role to gain their new powers

revoke librarian from 'TestLogin'@'localhost';

drop role librarian;