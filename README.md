# Data Warehouse Project

Welcome to the Data Warehouse and Analytics Project repository! This project demonstrates a comprehensive data warehousing solution, from ingesting raw data to generating actionable business insights using SQL. It serves as a portfolio piece showcasing skills in data engineering, data modeling, and data analysis.

## 📖 Project Overview

This project focuses on building a modern data warehouse using **SQL Server** to consolidate sales data from disparate sources (ERP and CRM systems provided as CSV files).

1. Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
3. Data Modeling: Developing fact and dimension tables optimized for analytical queries.
4. Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.


## 🏗️ Data Architecture: The Medallion Approach

The project employs the **Medallion Architecture** to structure the data warehouse into distinct layers, promoting scalability, maintainability, and quality:

<div align="center">
  <img src="https://github.com/michalpuskac/sql-data-warehouse-project/blob/main/docs/high_level_architecture.png" width="90%" />
  <br/>
  <img src="https://github.com/michalpuskac/sql-data-warehouse-project/blob/main/docs/data_flow.png" width="75%"/> 
</div>

* **🥉 Bronze Layer:** Raw data is ingested directly from the source CSV files (ERP, CRM) into SQL Server tables without transformation. This layer serves as the historical archive of source data. *(See: [scripts/bronze/](https://github.com/michalpuskac/sql-data-warehouse-project/tree/main/scripts/bronze))*
* **🥈 Silver Layer:** Data from the Bronze layer undergoes cleansing, standardization, transformation. Data quality issues are addressed here, resulting in a validated and consistent dataset. *(See: [scripts/silver/](https://github.com/michalpuskac/sql-data-warehouse-project/tree/main/scripts/silver))*
* **🥇 Gold Layer:** Business-ready data is modeled into a **Star Schema** (optimized for analytics) consisting of fact and dimension tables. This layer directly serves reporting and analytics needs. *(See: [scripts/gold/](https://github.com/michalpuskac/sql-data-warehouse-project/tree/main/scripts/gold))*

<div align="center">
  <img src="https://github.com/michalpuskac/sql-data-warehouse-project/blob/main/docs/data_integration%20Diagram.png" width="85%" />
   <br/>
  <img src="https://github.com/michalpuskac/sql-data-warehouse-project/blob/main/docs/sales_data_mart.png" width="85%"/> 
</div>

## 🛠️ Tools & Technologies

* **Database:** [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
* **Database Management:** [Azure Data Studio](https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?tabs=win-install%2Cwin-user-install%2Credhat-install%2Cwindows-uninstall%2Credhat-uninstall)
* **ETL & Data Transformation:** [T-SQL](https://learn.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver16)
* **Data Modeling & Diagrams:** [Draw.io](https://app.diagrams.net/)
* **Version Control:** [Git & GitHub](https://github.com/)
* **Data Source:** [CSV Files (ERP & CRM)](https://github.com/michalpuskac/sql-data-warehouse-project/tree/main/datasets)

# 🎯 Key Project Tasks & Features

* **Data Ingestion:** Loading raw data from CSV files into the Bronze layer.
* **ETL Pipeline:** Developing SQL scripts to move and transform data across Bronze, Silver, and Gold layers.
* **Data Cleansing & Integration:** Handling data quality issues and merging data from ERP and CRM sources.
* **Data Modeling:** Designing and implementing a Star Schema (FactSales, DimCustomers, DimProducts) in the Gold layer.
* **Documentation:** Creating diagrams and descriptions for architecture, data flow, and data models. *(See: [docs/](https://github.com/michalpuskac/sql-data-warehouse-project/tree/main/docs))*


## 📊 Downstream Analysis Project

The Gold Layer data produced by this Data Warehouse serves as the foundation for further exploratory and advanced analysis. See the following project for examples of how this data was analyzed using SQL to derive business insights:

### [SQL Data Analysis Project](https://github.com/michalpuskac/sql-data-analysis.git)

---

## 🗂  Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw source CSV files (ERP, CRM)
│
├── docs/                               # Documentation, diagrams
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                
│   ├── data_flow.png                   # Data flow diagram
│   ├── data_integration.drawio                
│   ├── data_integration.png            # Data integration
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── high_level_architecture.drawio        
|   ├── high_level_architecture.png     # Project's architecture
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│   ├── sales_data_mart.drawio        
|   ├── sales_data_mart.png             # Star schema of gold layer
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```

## ⚙️ Getting Started 

1. **Prerequisites:**
    * Ensure you have SQL Server (Express or other edition) and SQL Server Management Studio (SSMS) installed.
    * Clone this repository: `git clone https://github.com/michalpuskac/sql-data-warehouse-project.git`
    <br>
    
    * **Important:** Place the source CSV files (e.g., `cust_info.csv`, `prd_info.csv`, `sales_details.csv`, `loc_a101.csv`, `cust_az12.csv`, `px_cat_g1v2.csv`) in a location accessible *by the SQL Server instance*. The default paths in the load script are `/data/source_crm/` and `/data/source_erp/`.
        * You might need to adjust these paths within the `scripts/bronze/load_bronze.sql` file to match your environment (e.g., `C:\data\source_crm\` on Windows).
2. **Database Setup:** Create a new database in SQL Server using `script/init_database.sql`.
3. **Load Data:**
        * *Run scripts in Order*
        * **a. Create Bronze Tables:** Open and run the entire `scripts/bronze/ddl_bronze.sql` script. This creates the empty table structures.
        * **b. Create Bronze Load Procedure:** Open and run the entire `scripts/bronze/load_bronze.sql` script. This creates the stored procedure but does *not* load data yet.
        * **c. Execute Bronze Load Procedure:** Run the following command to load the data from the CSV files into the Bronze tables:
        
        ```sql
        EXEC bronze.load_bronze;
        GO
        ```
        *(Check the output messages in SSMS for success or errors).*

    * Follow a similar pattern for the Silver and Gold layers.
4. **Analytics:** Once the underlying Silver layer is populated and the Gold views are created, connect to the database using SSMS or another BI tool. Run analytical queries against the Gold layer views (e.g., gold.fact_sales, gold.dim_customers, gold.dim_products) to derive insights.


## ✨ Skills Demonstrated

This project highlights expertise in:

* SQL Development (T-SQL)
* Data Architecture (Medallion Architecture)
* Data Engineering (ETL Processes)
* ETL Pipeline Development
* Data Modeling (Star Schema)
* Data Analysis & Reporting

## 📄 License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/michalpuskac/sql-data-warehouse-project/blob/main/LICENSE) file for details.


## 👨‍💻 Author - Michal Puškáč
This project is part of my portfolio, showcasing skills and concepts I learned. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!


<div align="left">
   <a href="https://www.linkedin.com/in/michal-pu%C5%A1k%C3%A1%C4%8D-94b925179/">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
  </a>
  <a href="https://github.com/michalpuskac">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Badge"/>
  </a>
</div>
