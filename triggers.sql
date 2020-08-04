Drop TRIGGER InsertBeforeCustomers;

Delimiter $$

CREATE TRIGGER InsertBeforeCustomers
Before Insert
ON Customers
FOR EACH ROW
Begin

If ((New.country = 'North Korea') Or (New.country = 'Iran') Or (New.country = 'Cuba'))
Then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Trade embargo, new customer not added';

If (New.creditLimit > 400000)
Then
SIGNAL SQLSTATE '45001'
SET MESSAGE_TEXT = 'Credit limit too high, new customer not added';

If (New.salesRepEmployeeNumber IS NULL)
The
SIGNAL SQL STATE '45003'
SET MESSAGE_TEXT = 'President not taking new customers, select different rep';

End$$
Delimiter;


Drop TRIGGER InsertBeforeCustomers;

Delimiter $$

CREATE TRIGGER InsertBeforeCustomers
Before Insert
ON Customers
FOR EACH ROW
Begin
If (New.creditLimit > 400000)
Then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Credit limit too high, new customer not added';
End$$
Delimiter;
