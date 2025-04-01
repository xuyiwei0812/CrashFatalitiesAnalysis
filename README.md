# Crash Fatalities Analysis

## Overview

This project involves designing and implementing a star schema data warehouse to analyze Australian road crash fatality data. The process includes data cleaning, transformation, and integration using Python and PostgreSQL, followed by the creation of visual dashboards in Tableau for analytical insights.

## Project Structure

1. **Data Extraction and Preparation**:
   - **Data Sources**: Utilized official datasets containing detailed records of fatal road crashes in Australia.
   - **Data Cleaning**: Handled missing values, corrected inconsistencies, and ensured data quality using Python libraries such as pandas and NumPy.

2. **Data Warehouse Design**:
   - **Star Schema**: Developed a star schema comprising one fact table and multiple dimension tables to facilitate efficient querying and analysis.
   - **Implementation**: Deployed the schema in PostgreSQL, establishing relationships between tables to maintain referential integrity.

3. **Data Loading (ETL Process)**:
   - **ETL Pipelines**: Constructed Extract, Transform, Load (ETL) pipelines to populate the data warehouse, ensuring data consistency and accuracy.

4. **Data Analysis and Visualization**:
   - **Tableau Dashboards**: Created interactive dashboards in Tableau to visualize trends, patterns, and insights from the crash fatality data.

## Getting Started

To explore or replicate this project:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/xuyiwei0812/CrashFatalitiesAnalysis.git
   ```
2. **Set Up the Environment**:
   - Ensure Python and PostgreSQL are installed.
   - Install necessary Python packages:
     ```bash
     pip install pandas numpy sqlalchemy psycopg2
     ```
3. **Configure the Database**:
   - Create a PostgreSQL database and update connection settings in the ETL scripts.
4. **Run ETL Scripts**:
   - Execute the ETL scripts to load data into the PostgreSQL database.
5. **Launch Tableau**:
   - Open the provided Tableau workbook or connect Tableau to the PostgreSQL database to access the dashboards.

## Acknowledgments

This project utilizes publicly available datasets on Australian road crash fatalities. Special thanks to the data providers for making this information accessible for analysis.
