# Bash Shell Script Database Management System (DBMS)

## Project Overview:

The goal of this project is to develop a simple Database Management System (DBMS) using a Bash shell script. The system allows users to store and retrieve data from the hard disk through a Command Line Interface (CLI) menu.

## Project Features:

### Main Menu:

1. **Create Database:**
   - Allows users to create a new database, which will be stored as a directory next to the script file.

2. **List Databases:**
   - Displays a list of existing databases.

3. **Connect To Database:**
   - Allows users to connect to a specific database, leading to a new screen with additional menu options.

4. **Drop Database:**
   - Permits users to delete a database along with its contents.

### Database Menu:

1. **Create Table:**
   - Enables users to define a new table within the connected database, specifying column names and data types.

2. **List Tables:**
   - Displays a list of tables in the connected database.

3. **Drop Table:**
   - Allows users to remove a table and its data from the connected database.

4. **Insert into Table:**
   - Facilitates the insertion of new records into a specified table, validating data types and checking for primary key constraints.

5. **Select From Table:**
   - Retrieves and displays rows from a specified table in an accepted/good format.

6. **Delete From Table:**
   - Permits users to delete specific rows from a table based on specified conditions.

7. **Update Table:**
   - Allows users to update existing records in a table, checking for valid data types and primary key constraints.

## Implementation Details:

- **Database Storage:**
  - Databases are stored as directories adjacent to the script file.

- **Column Datatypes:**
  - Users are prompted for column data types during table creation and validated during data insertion and updating.

- **Primary Key:**
  - Users are prompted to define a primary key during table creation, and the system enforces this constraint during data insertion.

## Bonus Features:

- **GUI Integration:**
  - A graphical user interface (GUI) could be implemented as an alternative to the menu-based CLI, providing a more user-friendly experience.

## How to Run the Script:

1. **Ensure Bash is Installed:**
   - Make sure that Bash is installed on your system.

2. **Execute the Script:**
   - Run the script using the command: `./main.sh`

3. **Follow On-Screen Instructions:**
   - Follow the on-screen menu instructions to interact with the DBMS.

4. **Explore Database Operations:**
   - Create, connect, and manipulate databases and tables as needed.

## Contributors:

- [mahmudhmh]

## License:

This project is licensed under the [Open Software License 3.0].
