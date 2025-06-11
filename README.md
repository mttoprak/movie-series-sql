# Movie and TV Series Tracking System - SQL Assignment

This project is an **SQL assignment** that includes the database schema and various SQL queries for a movie and TV series tracking system. The `homework.sql` file contains table creation, data insertion, basic and advanced SQL queries, views, and data manipulation (DML) examples.

## Contents

- [Setup](#setup)
- [Table Structure](#table-structure)
- [Data Insertion](#data-insertion)
- [Query Examples](#query-examples)
- [Views](#views)
- [Set Operators](#set-operators)
- [Data Manipulation (DML)](#data-manipulation-dml)
- [Notes](#notes)

---

## ⚠️ Important Notice

**Do not run all the example SQL queries at once!**

The `homework.sql` file contains many example queries for learning and demonstration purposes. Running all of them together may cause your computer or database to freeze or crash. Please review and execute queries one by one as needed.

If you only want to set up the database and insert the sample data, run only the table creation and data insertion sections at the top of `homework.sql`. **Do not run the example queries and views at the bottom for setup purposes.**

See the [Setup](#setup) section for more information.

## Setup

1. Create a PostgreSQL database.
2. Open the `homework.sql` file and copy only the table creation and data insertion sections (everything above the example queries and views).
3. Run these sections in your database:
   ```sh
   psql -U <username> -d <database_name> -f <your_table_and_data_file.sql>
   ```
4. If you want to try the example queries, you can run them one by one after setup.

## Table Structure

The following tables are created:

- **Users**: User information (username, email, password)
- **Contents**: Content information (movie/series title, description, year, type)
- **Genres**: Genres (action, drama, etc.)
- **ContentGenres**: Content-genre mapping (many-to-many relationship)
- **SeriesSeasons**: Seasons of series
- **Episodes**: Episodes of series
- **WatchStatus**: Users' watch statuses
- **Ratings**: User ratings for contents
- **Comments**: User comments

## Data Insertion

Sample users, contents, genres, seasons, episodes, watch statuses, ratings, and comments are inserted into the tables.

## Query Examples

The file includes the following types of SQL queries as examples:

- **Simple Selections**: Listing users, contents, watch statuses
- **Aggregate Functions**: Total user count, average rating, earliest/latest content year
- **Grouping (GROUP BY)**: Content count by type, watch count
- **Joins**: Combining user, content, and rating information
- **Subqueries**: Selecting content or users based on specific criteria

## Views

- **HighlyRatedContents**: Contents with an average rating of 8 or higher
- **UserCommentSummary**: Total comment count per user

## Set Operators

- **UNION**: Combines movies and series titles without duplicates
- **INTERSECT**: Contents that are both movies and series in certain years
- **EXCEPT**: Contents released before 2000 that are not series

## Data Manipulation (DML)

- **UPDATE**: Update user ratings
- **DELETE**: Delete specific watch records

## Notes

- This file is prepared as an **assignment**.
- It is compatible with PostgreSQL.
- Foreign keys are used for data integrity between tables.
- The queries and data samples are designed to demonstrate the core functionalities of the system.
- **The project report is provided as a PDF file and is written in Turkish.**

---

If you have any questions, you can review the comments in the file or ask for help.
