# SQL Exercises

This repository contains my SQL exercises from the Data Analyst Training Program at Tose'e Institute, taught by Dr. Ehsan Khakbazian.

The exercises cover basic queries, grouping, joins, subqueries, window functions, and a sales report built from several related tables.

## Assignment Information

- **Institute:** Tose'e Institute
- **Instructor:** Dr. Ehsan Khakbazian
- **Course:** Data Analyst Training Program
- **Tool:** Microsoft SQL Server
- **Language:** T-SQL

## Exercises

| Exercise | Database | Main topics |
|---|---|---|
| 01 | Hospital | Filtering, `NULL`, `LIKE`, `IN`, dates, and `UPDATE` |
| 02 | Sepidar01 | Grouping, counting, percentages, and window functions |
| 03 | Northwind | Table relationships and joins |
| 04 | Sepidar01 | Customer-level counts and date summaries |
| 05 | Sepidar01 | `JOIN`, subqueries, and products with no orders |
| 06 | ProductVariants practice table | Conditional aggregation and `HAVING` |
| 07 | Sepidar01 | Multi-table sales reporting and grouped totals |

## Folder Structure

```text
Fatemeh_Kamrani_SQL_Exercises/
├── README.md
├── sql/
│   ├── Fatemeh_Kamrani_SQL_EX_01.sql
│   ├── Fatemeh_Kamrani_SQL_EX_02.sql
│   ├── Fatemeh_Kamrani_SQL_EX_03.sql
│   ├── Fatemeh_Kamrani_SQL_EX_04.sql
│   ├── Fatemeh_Kamrani_SQL_EX_05.sql
│   ├── Fatemeh_Kamrani_SQL_EX_06.sql
│   └── Fatemeh_Kamrani_SQL_EX_07.sql
└── docs/
    ├── SQL Exercise -01.pdf
    ├── SQL Exercise -02.pdf
    ├── SQL Exercise -03.pdf
    ├── SQL Exercise -04.pdf
    ├── SQL Exercise -05.pdf
    ├── SQL Exercise -06.pdf
    └── SQL Exercise -07.pdf
```

## How to Use the Files

1. Install Microsoft SQL Server and SQL Server Management Studio.
2. Restore or connect to the database required for the exercise.
3. Open the matching `.sql` file from the `sql` folder.
4. Check the database name at the beginning of the file.
5. Run each query separately and review the result.

The databases are not included in this repository. The SQL files use the database structures provided with the course.

## Notes

- The queries are written for Microsoft SQL Server.
- Exercise 01 includes an `UPDATE` statement for replacing missing allergy values with `NKA`. Run it only on a practice copy of the database.
- The Northwind and Sepidar exercises use different database structures, so each file should be run against the correct database.

## Author

**Fatemeh Kamrani**  
[GitHub Profile](https://github.com/fatemehkamrani79)
