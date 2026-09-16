FOOTBALL DATA ANALYSIS USING SQL

1. PROJECT OVERVIEW

This project is a Football Data Analysis project developed using SQL. The project analyzes football players, teams, matches, appearances, goals, assists, shots, expected goals (xG), cards, and other match statistics.

The database consists of multiple related tables, allowing player, team, and match information to be analyzed together. Various SQL concepts such as JOINs, aggregate functions, subqueries, views, stored procedures, filtering, grouping, and sorting are used to perform the analysis.

2. PROJECT OBJECTIVES

• Analyze player performance using football statistics.

• Identify top-performing players based on goals, assists, and goal contributions.

• Analyze match results and team performance.

• Compare home and away team performances.

• Find players based on different performance conditions.

• Practice SQL JOINs using multiple related tables.

• Create reusable SQL Views and Stored Procedures.

• Perform advanced data analysis using aggregate functions and subqueries.

3. DATABASE STRUCTURE

The project contains four main tables.

3.1 Players Table

The Players table contains information about football players.

Main column:
PlayerID
Name

3.2 Appearances Table

The Appearances table contains player performance statistics for individual matches.

Important columns:
PlayerID
GameID
Goals
Assists
Shots
xGoals
xAssists
Time
Position
YellowCard
RedCard

3.3 Games Table

The Games table contains information about football matches.

Important columns:
GameID
Date
Season
HomeTeamID
AwayTeamID
HomeGoals
AwayGoals

3.4 Teams Table

The Teams table contains information about football teams.

Important columns:
TeamID
Team_Name

4. TABLE RELATIONSHIPS

The tables are connected using common identifiers.

Players and Appearances are connected through PlayerID.

Appearances and Games are connected through GameID.

Games and Teams are connected through HomeTeamID and AwayTeamID.

These relationships allow player statistics, match results, and team performance to be analyzed together.

5. SQL CONCEPTS USED

The following SQL concepts are used in this project:

SELECT

WHERE

GROUP BY

HAVING

ORDER BY

LIMIT

DISTINCT

INNER JOIN

LEFT JOIN

RIGHT JOIN

Aggregate Functions

SUM()

COUNT()

AVG()

CASE Statements

Subqueries

Calculated Columns

CREATE VIEW

CREATE PROCEDURE

CALL

DELIMITER

6. ANALYSIS PERFORMED

The project contains 20 SQL analysis tasks covering player performance, team performance, match analysis, and advanced SQL operations.

6.1 Player Analysis

The project performs the following player-related analysis:

1. Identifying players who scored more goals than the average player.

2. Finding the top three players based on expected goals (xG).

3. Identifying players who have scored at least one goal and provided at least one assist.

4. Finding the top ten players based on total goal contributions.

5. Identifying players who scored more than three goals with fewer than twenty appearances.

6. Identifying players with at least two goals and a shooting conversion rate above twenty percent.

7. Finding players who appeared in matches where more than four total goals were scored.

8. Identifying players who scored goals while playing for the home team.

9. Finding players who made more than two appearances in selected high-scoring matches.

10. Identifying players who scored goals in matches where their team won.

11. Finding players who have never made an appearance in any game.

6.2 Team and Match Analysis

The project also performs several team and match-related analyses:

1. Finding the five biggest victories by an away team.

2. Listing matches where the home team won.

3. Calculating the number of goals scored by each team in each season.

4. Identifying the ten teams with the most home wins.

5. Finding games where no player received a yellow card.

6. VIEWS

Two SQL Views are created as part of the project.

7.1 Game Results View

The Game Results View provides a simplified representation of match results.

It classifies each game into one of three categories:

Home Win

Away Win

Draw

7.2 Player Summary View

The Player Summary View provides an overall summary of each player's performance.

It includes:

Player ID

Player Name

Total Appearances

Total Goals

Total Assists

8. STORED PROCEDURES

Two Stored Procedures are created in the project.

8.1 Players by Position

The Players by Position procedure retrieves players based on their playing position.

The procedure accepts a position as input and returns the players associated with that position.

8.2 Player Statistics

The Player Statistics procedure retrieves detailed statistics for a selected player.

The statistics include:

Appearances

Minutes Played

Goals

Assists

Shots

Expected Goals (xG)

Expected Assists (xA)

Yellow Cards

Red Cards

9. PROJECT FILES

The project contains the following files:

README.md

sql_prjct.sql

players.csv

appearances.csv

games.csv

teams.csv

10. HOW TO RUN THE PROJECT

Step 1: Install MySQL

Install MySQL and MySQL Workbench or use another MySQL-compatible database management system.

Step 2: Create the Database

Create a database named "project" and select it for use.

Step 3: Import the Dataset

Import the following CSV files into their respective tables:

players.csv

appearances.csv

games.csv

teams.csv

Step 4: Run the SQL File

Open the sql_prjct.sql file in MySQL Workbench and execute the queries.

11. TECHNOLOGIES USED

Database: MySQL

Query Language: SQL

Database Management Tool: MySQL Workbench

Data Format: CSV

12. KEY LEARNING OUTCOMES

This project provided practical experience in working with relational databases and analyzing structured football data using SQL.

The major learning outcomes include:

• Understanding relationships between multiple database tables.

• Using different types of JOINs to combine data.

• Performing data aggregation and filtering.

• Writing subqueries for comparative analysis.

• Using GROUP BY and HAVING for analytical queries.

• Creating calculated fields using SQL expressions.

• Creating reusable Views.

• Creating and executing Stored Procedures.

• Extracting meaningful information from football statistics.

13. FUTURE IMPROVEMENTS

The project can be further extended by:

• Creating an interactive dashboard using Power BI or Tableau.

• Adding additional seasons and competitions.

• Performing advanced player performance analysis.

• Adding more team-level performance metrics.

• Creating visualizations for goals, assists, expected goals, and match results.

• Integrating the database with Python for advanced data analysis.

14. AUTHOR

Sarang A

Computer Science Engineering Student

Areas of Interest: Data Analytics, SQL, Python, and Data Visualization.

15. CONCLUSION

This project demonstrates the practical application of SQL for analyzing football data. By combining multiple related tables and applying different SQL techniques, the project extracts useful insights about players, teams, and matches.

The project also demonstrates the use of advanced SQL features such as JOINs, subqueries, Views, and Stored Procedures, making it a practical example of relational database analysis.
