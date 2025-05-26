# Bonus Section :

## \*\*\* What is PostgreSQL?

- PostgreSQL is powerfull, open-source relational databse management system (RDBMS), that uses and exteds the SQL language.
- The world's most advanced open source database.
- Users can define custom functions, types and even languages.

### \*\*\* What is the purpose of a database schema in PostgreSQL?

- Schema is a logical container that organizes database objects like tables, views, functions and types.
- It provides a namespace, allowing for better management and organization of data within a database.
- Schema enabale multiple users to access the same database without interfering with each other's objects.

#### \*\*\* Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Primary Key:**

- A primary key is a field or a combination of fields in a database table that uniquely identifies each row in that table.
- Must be unique, can't be NULL - no two rows can have the same primary key value.

**Foreign Key:**

- A foreign key is a column in one table that refers to the primary key in another table.
- Ensures referential integrity, can be NULL if the relationship is optional - use to define many-to-one, one-to-one or many to many relationships.

#### \*\*\* What is the difference between the VARCHAR and CHAR data types?

**VARCHAR:**

- Varchar has a variable size.
- Varchar data type values are not padded with spaces.
- Slightly better for variable-length text.

**CHAR:**

- Char has a fixed size.
- Char data type stores data of fixed length.
- Slightly better for fixed-length fields.

#### \*\*\* Explain the purpose of the WHERE clause in a SELECT statement.

**WHERE:**

- The WHERE clause acts as a filter, selecting only the rows that satisfy the conditions you specify.

**SELECT:**

- The SQL SELECT statement returns a result set of rows, from one or more tables. A SELECT statement retrieves zero or more rows from one or more database.
