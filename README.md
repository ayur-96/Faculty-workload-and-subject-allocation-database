Description

The Faculty Workload & Subject Allocation Database is a MySQL-based database project designed to manage and monitor faculty teaching workload in an educational institution. The system stores faculty details, subject information, and subject allocations while ensuring that no faculty member exceeds their maximum teaching workload.

This project demonstrates the practical implementation of relational database concepts such as primary keys, foreign keys, joins, aggregate functions, grouping, and constraints.

Features

Faculty Management (store faculty details and workload limits)

Subject Management (store subject information and credits)

Subject Allocation to Faculty

Workload Calculation using aggregate functions

Overload Detection using HAVING clause

Data Integrity using Foreign Key constraints

Technologies Used

MySQL

SQL

Database Structure
1. Faculty Table

Stores faculty information such as name, department, designation, and maximum workload.

2. Subject Table

Stores subject details including semester, credits, and weekly hours.

3. Allocation Table

Links faculty and subjects and records allocated workload hours.

Sample Queries

Calculate total workload of each faculty

Display faculty with allocated subjects

Identify faculty exceeding maximum workload

Purpose of the Project

This system helps institutions distribute teaching workload efficiently and prevents faculty overloading. It is suitable as a mini-project for Database Management Systems (DBMS) coursework.
