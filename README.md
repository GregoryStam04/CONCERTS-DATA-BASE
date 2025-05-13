# CONCERTS-DATA-BASE
In this repo, we implement a database project for our university class of Databases I, during the 6th Semester in the ECE NTUA program.
The goal of our database is to collect and manage data for a festival organization across 10 years. Our database contains information about the festival's location, events, performances, artists, etc and a FIFO process resale queue for the festival's tickets.

## Frameworks and Technologies used:
- MariaDB (v 10.4.32)
- XAMPP (v8.0.30)
- MySQL Workbench(v8.0.42)
- Python 3.13.3 ( Faker, Random, Datetime Libraries)

## Files Included in the Repository
Our repository contains all the important files for the adequate use of our Database:
- sql/install.sql -> The ddl file, containing all the tables, indexes and triggers for our database.
- sql/load.sql -> The dml file, containing the random data population sql script as well as the procedures necessary for our database.
- sql/queries/Q_x.sql and sql/queries/Q_X_out.txt -> Our database's queries and their outputs.
- diagrams/ER_DIAGRAM.pdf and diagrams/RELATIONAL_SCHEMA.pdf -> Entity - Relationship Diagram and Relational Schema of our database.
- code/fake_data.py -> Python script to generate the random data population sql script.
- docs/report.pdf -> Report of our work and steps done to implement our application.

## Collaborators:
* Georgios Pallis (https://github.com/gepall-bot)
* Grigorios Stamatopoulos (https://github.com/GregoryStam04)
* Nickolaos-Dionysios Fragkos (https://github.com/nikolasfragkos)
