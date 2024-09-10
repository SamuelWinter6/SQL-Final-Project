# ISBA 4715 Final Sql-Project

## 1. Project Name ~ Tesla Trend Setter 

## 2. Project Objective:

#### a. What problem are you solving? ~ This project seeks to solve/showcase the requirements of a Data Engineering intern at tesla. Which is to provide a platform for data driven decision making.

#### b. We've designed an ETL pipeline that begins by extracting data from various sources using APIs and web scraping techniques. The data is then transformed using Python's Pandas library along with other related Python modules. Finally, the processed data is loaded onto a MySQL server, where preliminary data analysis is conducted to derive insights.

## 3. Job Description:
#### a. Tesla is renowned for its electric vehicles, which feature advanced autopilot capabilities and sports car-like performance. This project aims to illustrate the essential skills required for a Data Engineer intern at Tesla, encompassing ETL design and the effective extraction, transformation, and loading of data. The ultimate goal is to provide a robust analytical platform that supports informed decision-making to enhance and optimize Tesla's product offerings.

#### b. This project utilizes an ETL (Extract, Transform, Load) process implemented on a MySQL database to facilitate data-driven insights into Tesla's product range. The project involves extracting, cleaning, and formatting data to prepare it for thorough analysis. It highlights key features of Tesla products by employing a range of Data Engineering techniques and tools. These tools include Python, Pandas, BeautifulSoup (Bs4), JSON, SQLAlchemy, Selenium, and cloud technologies like AWS (EC2, RDS), along with Linux.

## 4. Data:
#### a. Source: Cars.com - webscraped for customer reviews per Tesla model
#### b. Characteristics - Overall rating, user, date, review text, rating breakdown: comfort, interior, performance, value, and reliability
#### c. Source: Edmunds.com - webscraped for customer reviews per Tesla model
#### d. Characteristics - Overall rating, user, date, review text, rating breakdown: comfort, interior, performance, value, and reliability
#### e. Source: NHSTA - API for Car model maintenance schedules and recommended inspections
#### f. Characteristics - Model, service type, recommended interval, actual service date, mileage, notes
#### g. Source: CIS - Tesla model details and specifications
#### h. Characteristics - Make, Model, Class, Drive, Fuel_Type, City Mpg, Highway Mpg, Combination Mpg, Transmission, Year

## 5. Notebooks:
#### a. API ~ Sources data on Car Specifcations and Car Complaints related to components within the car model, link - https://github.com/SamuelWinter6/sql-project/blob/2fcdf76f2f55b4a00e6fded61d78e20340139767/Notebooks/API_ETL.ipynb

#### b. Webscrape ~ Customer reiviews data with ratings on specifc car attributes, link - https://github.com/SamuelWinter6/sql-project/blob/2fcdf76f2f55b4a00e6fded61d78e20340139767/Notebooks/Web_Scrape_ETL.ipynb

## 6. Future Improvements:
#### a. Collect a wider mote of data to have an accurate reading on consumer satsifaction to corrlate elements of car models that sell

#### b. Having access to Tesla fleet API and maintence schedules would be used to further idenify specific car model components that either could use improvment to increase customer satisfaction while simultaneously identifying aspects of models that decrease customer satsfcation.
