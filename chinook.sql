--==============================================================================
--  These examples were performed in SQLite Studio, using the "chinook.db3"
--  database found in the ./data subdirectory of the guided project.
--==============================================================================


--------------------------------------------------------------------------------
--  SELECT (Reading data
--------------------------------------------------------------------------------
SELECT * FROM Customer
-- we can specify specific columns to return, if we don't want them all, in
-- order to limit the data footprint, and in the RDBMS tool, to make the data
-- more readable.
SELECT FirstName,LastName,Company,City,Country FROM Customer
-- The "WHERE" clause allows us to specify conditions on what rows to return.
-- The condition is typically specified in terms of a column value.
select * from artist where ArtistId=1
select * from album where ArtistId=1;
-- We can have multiple conditions, combined with AND and OR.
-- Note that SQL statements are often on multiple lines. The ";" is important to
-- specify when the command ends. Otherwise, it assumes everything after the
-- previous ";" (or from the beginning of the file, if there is no ";" is one 
-- command.
select city,firstname,lastname,company,supportrepid
from customer
where country='Germany' AND supportrepid=3;
-- An example using OR...
select firstname,lastname,company,city,country
from customer
where country='Germany' OR city='Prague';
-- Another example using a comparison
select * from track where bytes>10000000
-- for fun, take a peek at the following Wikipedia article:
-- https://en.wikipedia.org/wiki/Mebibyte
-- totally unrelated, but you might find it interesting...

-- one of my favorite bands... I was a drummer, so... If you know, you know.
select * from artist where artistid=128;

--------------------------------------------------------------------------------
--  ORDER BY
--------------------------------------------------------------------------------
--  We can "sort" the records that are returned using "order by". Typically, you
--  specify a column name, and it will use the values of the column to choose
--  how to order the records.
--
--  There are special rules about how to determine what is first if their values
--  match... such rules may differ from one RDBMS to another.
--
--  You can also "reverse" sort by using the "DESC" modifier at the end (for
--  "descending"). There is also an "ASC" modifier, meaning "ascending"... it is
--  not necessary to include it, ascending is the default. But you can if you
--  want. 
select * from invoice where invoicedate >= '2009-03-01' order by invoicedate;
select * from invoice where invoicedate >= '2009-03-01' order by invoicedate desc;

select * from album order by artistid desc;

--------------------------------------------------------------------------------
--  LIMIT
--------------------------------------------------------------------------------
--  In some cases, you may only want to return a limited number of results.
--  Perhaps you want to see the "top 5", etc. This is accomplished with the
--  LIMIT clause, as shown below.
select * from invoice 
where billingstate is null
limit 5;

--------------------------------------------------------------------------------
--  INSERT
--------------------------------------------------------------------------------
--  The "insert" command is used to add records to a table. The syntax is :
--
--      insert into <table_name> (comma,separated,list,of,column,names)
--      values ('comma','separated','list','of','column','values')
--    
--  The values are mapped to the column by position in their respective
--  comma-separated lists. The first value is placed in the first-named column,
--  the second value is placed in the second-named column, etc.ABORT--
select * from genre order by name;
insert into genre (Name) values ('Folk');

insert into artist (Name) values ('skirkby');
update artist set Name='Sean Kirkby'
where Name='skirkby';
select * from artist where Name = 'Sean Kirkby';

--------------------------------------------------------------------------------
-- DELETE
--------------------------------------------------------------------------------
-- The "delete" command is used to remove records. You don't need to specify
-- column names at all... 
--
-- REMEMBER to use a WHERE clause! If you don't, the command will apply to every
-- record (because there is no filter to specify certain records.)
delete from artist where Name = 'Sean Kirkby';
-- You can have the delete command apply to multiple records, however...
-- WARNING: the following command will destroy data!
delete from customers where state is NULL


